# t4ko's Configuration and Dotfiles
These are the dotfiles for my current workspace configuration. I use [stow](https://www.gnu.org/software/stow/) to keep all my dotfiles in one directory and conveniently switch between different configurations.

## Featured programs

+ spectrwm
+ i3 (i3-gaps)
+ vim/neovim
+ bash
+ X11
+ polybar
+ neofetch
+ ranger
+ vifm
+ mpd

## Installation

Typically no installation is required because config files are just placed into a particular directory specified by the corresponding program. For most programs it's your home directory `~` or a directory in `~/.config`.

However stow needs a particular directory structure which specifies where to place the files in your file tree. Use the following instructions to adopt it:
1. Save the repo into a folder in your home directory  
`$ git clone https://gitlab.com/t4ko/dotfiles.git`
1. Change your working directory to the cloned folder  
`$ cd dotfiles`
1. Symlink the files for the specified program into your directory structure using stow  
`$ stow <program>`

To install all files use  
`$ stow *`  
instead

To remove files you installed using stow use following command:  
`$ stow -D <program>`
