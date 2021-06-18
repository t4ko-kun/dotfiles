#!/usr/bin/env python3

# Custom battery information script for waybar on FreeBSD Systems
# See 'man acm' for more information

import subprocess
import shlex
import json
import time
from enum import IntEnum

class Apm(IntEnum):
     ACLINE = 0      # -a flag (AC coltage line status)
     BATTERY = 1     # -b flag (Battery status)
     PERCENTAGE = 2  # -l flag (remaining battery charge)
     TIME = 3        # -t flag (remaining estimated time charged)

class AC(IntEnum):
    OFFLINE = 0
    ONLINE = 1
    BACKUP = 2   # not needed yet

class Battery(IntEnum):
    HIGH = 0
    LOW = 1
    CRITICAL = 2
    CHARGING = 3

# apm -lab
status = subprocess.check_output("apm -ablt", shell=True).decode("utf-8").split()
# Convert from list of strings to list of ints
status = list(map(int, status))

data = {}
text = str(status[Apm.PERCENTAGE]) + "%"
alt = "draining"
tooltip = ""
css_class = ""
percentage = float(status[Apm.PERCENTAGE])

if status[Apm.ACLINE] == AC.OFFLINE:
    
    tooltip = "Remaining battery time: " + time.strftime('%H:%M', time.gmtime(status[Apm.TIME])) + "h"

    if status[Apm.BATTERY] == Battery.HIGH:
        css_class = "high"
    elif status[Apm.BATTERY] == Battery.LOW:
        css_class = "low"
    elif status[Apm.BATTERY] == Battery.CRITICAL:
        css_class = "critical"

elif status[Apm.ACLINE] == AC.ONLINE:
    if status[Apm.BATTERY] == Battery.CHARGING:
        alt = "charging"
        css_class = "charging"
    elif not status[Apm.BATTERY] == Battery.CHARGING:
        css_class = "high"
        text = "Fully charged"
    else:
        # AC without any battery
        return

data['text'] = text
data['alt'] = alt
data['tooltip'] = tooltip
data['class'] = css_class
data['percentage'] = percentage

print(json.dumps(data))
