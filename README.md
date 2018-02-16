# Maelo Arch

Personalized Arch install script, which installs KDE and my custom setup for it.

**Installation**

Download the Arch Linux ISO from one of the mirrors listed here: https://www.archlinux.org/download/

Burn the ISO to a USB drive, disk, or anything you want to boot from as long as it's not the target disk. If you're on Windows, I'd recommend Rufus: https://rufus.akeo.ie/
If you're on Linux or Mac, I'd recommend using the dd command.

Boot into your install disk, and run this command:

    wget https://raw.githubusercontent.com/maelodic/maelo-arch-install-kde/master/arch-setup.sh ; chmod +x arch-setup.sh ; ./arch-setup.sh

The installer will take you through the rest of the process

**Additional Information**

THe KDE installed is a conglomorate of many features I appreciate from Gnome and Unity

Some things that aren't immediately obvious:   
-You'll most likely need to set the timezone in KDE   
-The top right corner is the activity overview   
-No "start menu" is implemented. Press ALT+Space for the launcher (KRunner)   
-CTRL-ALT-T for terminal.   
-Super+(Mouse) can manipulate open windows. Left click to move, right click to resize, middle click to minimize, scroll wheel to change opacity.   
-Once a window is maximized the title disappears- the exit and minimize buttons then show up on the top bar   

*TO-DO:*   
Nvidia support   
Autodetect drivers.   
Do not continue if password change failes    
Better comments  
