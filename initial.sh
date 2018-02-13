#!/bin/bash
# FONT
setfont Lat2-Terminus16

# COLORS
red=$(tput setaf 1)
white=$(tput setaf 7)
green=$(tput setaf 2)
yellow=$(tput setaf 3)

intelinside() {
	printf "\033[1m \n\n${green}Are you using Intel Graphics? \033[0m"	
	printf "\033[1m \n ${white}[${green}Y${white}|${red}N${white}] \033[0m"
	printf "\033[1m \n\n${yellow}Answer: ${white}\033[0m"
	read intelstuff
	if [ "$intelstuff" == Y -o "$intelstuff" == y ]
		then
		pacman -Syy intel-dri xf86-video-intel --noconfirm --needed
	
	else
		printf "\033[1m \n\n ${green}Are you using AMD Graphics? \n\033[0m"
		printf "\033[1m \n ${white}[${green}Y${white}|${red}N${white}] \033[0m"
		printf "\033[1m \n ${yellow}Answer: ${white}\033[0m"
		read amdstuff
		if [ "$amdstuff" == Y -o "$amdstuff" == y ]
			then
			pacman -S ati-dri xf86-video-ati --noconfirm --needed
		fi
	fi
}

usersetup() {
		clear
		printf "\033[1m \n\n ${green} Lets create a user ! \n \033[0m"
		printf "\033[1m \n\n ${yellow} Enter username you want to create \n \033[0m"
		printf "\033[1m \n\n ${red} Do not ${white}enter ${red}Test${white} as a ${red}username.\n \033"
		printf "\033[1m \n Username:${white} \033[0m"
		read namebro
		if [ "$namebro" == Test ]
			then
			printf "\033[1m \n ${red}ERROR, DONT ENTER: ${white}Test\n\033[0m"
			printf "\033[1m \n ${white}TRY AGAIN: \033[0m"
			read namebro
		fi
		$(useradd -m -G adm,disk,audio,network,video "$namebro")
		printf "\033[1m \n\n ${yellow} Set a Password for this USER now \n\n \033[0m"
		passwd "$namebro"
		printf "\033[1m \n\n ${yellow}Would you like to add this user to sudoers? ( user ALL=(ALL) ALL ) \033[0m"
		printf "\033[1m \n\n ${white}[${green}Y${white}|${red}N${white}] \033[0m"
		printf "\033[1m\n\n ${red}Answer: ${white}\033[0m"
		read anot
		if [ "$anot" == Y -o "$anot" == y -o "$anot" == yes -o "$anot" == YES ]
			then
			printf "$namebro ALL=(ALL) ALL" >> /etc/sudoers	
			printf "$namebro ALL=(ALL) NOPASSWD: /usr/bin/reflector" >> /etc/sudoers
		fi
}

bobthebuilder() {  
	clear
	printf "\033[1m\n\n ${green}Would you like to setup pacaur ? \n\033[0m"
	printf "\033[1m\n\n ${white}It's an ${red}AUR ${white}helper with cower backend \n\n\033[0m"
	printf "\033[1m\n\n${white}[${green}Y${white}|${red}N${white}]\n\n\033[0m"
	printf "\033[1m\n\n${red}Answer: ${white}\033[0m"
	read thatquestion
	if [ "$thatquestion" == Y -o "$thatquestion" == y ]
		then
		printf "\033[1m\n\n ${green}Setting up pacaur for future use \n\n\033[0m"
		pacman -Syy expac yajl git perl-error --noconfirm --needed
		su "$namebro" -c "mkdir /home/$namebro/build-dir"
		su "$namebro" -c "cd /home/$namebro/build-dir && wget https://aur.archlinux.org/cgit/aur.git/snapshot/cower.tar.gz && tar xzvf cower.tar.gz"
		su "$namebro" -c "cd /home/$namebro/build-dir/cower && makepkg -s --skippgpcheck"
		pacman -U /home/"$namebro"/build-dir/cower/*.xz --noconfirm
		su "$namebro" -c "cd /home/$namebro/build-dir && wget https://aur.archlinux.org/cgit/aur.git/snapshot/pacaur.tar.gz && tar xzvf pacaur.tar.gz"
		su "$namebro" -c "cd /home/$namebro/build-dir/pacaur && makepkg -s"
		pacman -U /home/"$namebro"/build-dir/pacaur/*.xz --noconfirm
		rm -rf /home/$namebro/build-dir
	else
		printf "\033[1m\n\n ${yellow}You entered no\n\033[0m"
		printf "\033[1m ${yellow}or an unexpected character \n\033[0m"
		printf "\033[1m\n ${red}Moving on... \n\033[0m"
		sleep 2
	fi
}

setupuser() {
	cd /home/$namebro
	su "$namebro" -c "git clone https://github.com/maelodic/dotfiles"
	cd dotfiles
	chmod +x *.sh
	su "$namebro" -c "sh ./bootstrap.sh"
}

rootpasswd() {
	clear
	printf "Set ROOT Password: "
	passwd
}

installsoftware() {
	pacman -Syy reflector packagekit-qt5 python-pyqt5 qt5-declarative git python-dbus python-yaml wmctrl xdotool python-gobject dialog plasma-meta kde-applications-meta sddm xorg-server xorg-font-util xorg-xinit xterm ttf-dejavu xf86-video-vesa xf86-input-synaptics firefox vim plasma-nm latte-dock plasma5-applets-active-window-control qt5-graphicaleffects --noconfirm --needed
	systemctl enable sddm.service
	systemctl enable NetworkManager
	chmod +x /home/$namebro/dotfiles/*.sh
}

main() {
	intelinside
	usersetup
	bobthebuilder
	setupuser
	installsoftware
}

main
