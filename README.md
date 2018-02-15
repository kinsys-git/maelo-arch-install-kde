# maelo-arch-install-kde

Personalized Arch install script, heavily borrowing from https://github.com/i3-Arch/Arch-Installer

If you want a generalized arch installer, that one is still better. This one will install my personalized KDE interface.

To install, run this command after connecting to the internet on the arch install disk:

    wget https://raw.githubusercontent.com/maelodic/maelo-arch-install-kde/master/arch-setup.sh ; chmod +x arch-setup.sh ; ./arch-setup.sh

... And that's it. Follow the prompts from there.

THe KDE installed is a conglomorate of many features I appreciate from Gnome and Unity

Some things that aren't immediately obvious:   
-You'll most likely need to set the timezone in KDE   
-The top right corner is the activity overview   
-No "start menu" is implemented. Press ALT+Space for the launcher (KRunner)   
-CTRL-ALT-T for terminal.   
-Super+(Mouse) can manipulate open windows. Left click to move, right click to resize, middle click to minimize, scroll wheel to change opacity.   
-Once a window is maximized the title disappears- the exit and minimize buttons then show up on the top bar   

TO-DO:   
Better comments   
All prompts at the beginning for a seemless experience   
Rework colors and flavors from the original fork   
Nvidia support   
Autodetect drivers.   
~Seperate personal dotfiles from install project.~
