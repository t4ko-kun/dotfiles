#!/usr/bin/env python3

# Custom network information script for waybar on FreeBSD Systems

import subprocess
import shlex
import json

def ifconfig(interface):
    return subprocess.check_output(args="ifconfig " + interface, shell=True).decode("utf-8")

def is_active(interface):
    info = ifconfig(interface)
    return "status" in info and "no carrier" not in info

def is_wlan(interface):
    return "wlan" in ifconfig(interface)

def get_ip(interface):
    # "ifconfig em0 | grep inet | awk '{print $1 "\t" $2}' | sed 's/inet/IPv/g ; s/IPv\t/IPv4\t/'"
    info = shlex.quote(ifconfig(interface))
    echo = subprocess.Popen('echo ' + info, shell=True, stdout=subprocess.PIPE)
    grep = subprocess.Popen("grep inet", shell=True, stdin=echo.stdout, stdout=subprocess.PIPE)
    awk = subprocess.Popen(''' awk '{print $1 "\t" $2}' ''', shell=True, stdin=grep.stdout, stdout=subprocess.PIPE)
    sed = subprocess.check_output("sed 's/inet/IPv/g ; s/IPv\t/IPv4\t/'", shell=True, stdin=awk.stdout)
    # Remove trailing newline
    sed = sed[:-1]
    return sed.decode("utf-8")

def get_ssid(interface):
    # ifconfig $interface | grep ssid | grep -o '\".*\"' | sed 's/\"//g'
    info = shlex.quote(ifconfig(interface))
    echo = subprocess.Popen('echo ' + info, shell=True, stdout=subprocess.PIPE)
    grep1 = subprocess.Popen("grep ssid", shell=True, stdin=echo.stdout, stdout=subprocess.PIPE)
    grep2 = subprocess.Popen(''' grep -o '\".*\"' ''', shell=True, stdin=grep1.stdout, stdout=subprocess.PIPE)
    sed = subprocess.check_output(''' sed 's/\"//g' ''', shell=True, stdin=grep2.stdout)
    # Remove trailing newline
    sed = sed[:-1]
    return sed.decode("utf-8")

def get_signal_strength(interface):
    # ifconfig $interface list sta | awk 'FNR == 2 {print $5}'
    info = subprocess.Popen("ifconfig " + interface + " list sta", shell=True, stdout=subprocess.PIPE)
    awk = subprocess.Popen("awk 'FNR == 2 {print $5}'", shell=True, stdin=info.stdout, stdout=subprocess.PIPE)
    sed = subprocess.check_output("sed 's/^/Signal\t/ ; s/$/%/'", shell=True, stdin=awk.stdout)
    return sed.decode("utf-8")

def ping():
    ping = subprocess.run("ping -c 1 -W 100 1.1.1.1", shell=True, stdout=subprocess.PIPE)
    return not ping.returncode

data = {}
data['text'] = ""
data['alt'] = ""
data['tooltip'] = "" 
data['class'] = ""
data['percentage'] = 0

text = ""
alt = ""
tooltip = ""
css_class = ""
percentage = 0

interfaces = subprocess.check_output("ifconfig -l", shell=True)
interfaces = interfaces.decode("utf-8")
interfaces = interfaces.split()

active = False
for interface in interfaces:
    text = "offline"
    css_class = "offline"

    if is_active(interface):

        css_class = "linked"
        ssid = ""
        if is_wlan(interface): 
            alt = "wlan"
            ssid = get_ssid(interface)
            text = ssid + " (no internet)"
            tooltip = get_signal_strength(interface) + get_ip(interface)
            # Add when other wifi symblos are free to display signal strength also through icon
            # data['percentage'] = get_signal_strength(interface)
            if ping():
                text = ssid
                css_class = "online"

        else:
            alt = "lan"
            text = "online" + "(no internet)"
            tooltip = get_ip(interface)

            if ping():
                text = "online" 
                css_class = "online"

        break


data['text'] = text
data['alt'] = alt
data['tooltip'] = tooltip 
data['class'] = css_class
data['percentage'] = percentage
print(json.dumps(data))

