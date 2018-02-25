#!/bin/bash

initpackages() {
	clear
	echo "Initializing packages"
	pacman -Sy
}	

hostname() {
	clear
	echo "Setting hostname"
	echo "$hostname" > /etc/hostname
}

timekeeping() {
	clear
	echo "Setting timezone for pacific time and generating locale."
	ln -sf /usr/share/zoneinfo/America/Los_Angeles /etc/localtime
	echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
	locale-gen
	hwclock --systohc
	locale > /etc/locale.conf
}

makeswap() {
	clear
	echo "Creating swapfile."
	fallocate -l $swapsize $swapfile
	chmod 600 $swapfile
	mkswap $swapfile
	echo " " >> /etc/fstab
	echo "$swapfile none swap defaults 0 0" >> /etc/fstab	
}

bootloader() {
	clear
	echo "Setting up bootloader"
	mkinitcpio -p linux
	grub-install --recheck --target=i386-pc $bootDisk
	grub-mkconfig -o /boot/grub/grub.cfg
}

drivers() {
	clear
	echo "Setting up video drivers"
	if [ "$intelGfx" == Y -o "$intelGfx" == y ]
		then
		pacman -S intel-dri xf86-video-intel --noconfirm --needed
	fi
	if [ "$amdGfx" == Y -o "$amdGfx" == y ]
		then
		pacman -S ati-dri xf86-video-aty --noconfirm --needed
	fi
	if [ "$nvidiaGfx" == Y -o "$nvidiaGfx" == y ]
		then
		pacman -S nvidia lib32-nvidia-utils nvidia-dkms --noconfirm --needed
	fi
}

adduser() {
	clear
	echo "Setting up user"
	useradd -m -G wheel,disk,audio,adm,network,video "$userName"
	echo "$userName ALL=(ALL) ALL" >> /etc/sudoers
}

pacaurinstall() {
	clear 
	echo "Installing pacaur"
	pacman -S expac yajl git perl-error --noconfirm --needed
	su "$userName" -c "mkdir /home/$userName/build-dir"
	su "$userName" -c "cd /home/$userName/build-dir && wget https://aur.archlinux.org/cgit/aur.git/snapshot/cower.tar.gz && tar xzvf cower.tar.gz"
	su "$userName" -c "cd /home/$userName/build-dir/cower && makepkg -s --skippgpcheck"
	pacman -U /home/"$userName"/build-dir/cower/*.xz --noconfirm
	su "$userName" -c "cd /home/$userName/build-dir && wget https://aur.archlinux.org/cgit/aur.git/snapshot/pacaur.tar.gz && tar xzvf pacaur.tar.gz"
	su "$userName" -c "cd /home/$userName/build-dir/pacaur && makepkg -s"
	pacman -U /home/"$userName"/build-dir/pacaur/*.xz --noconfirm
	rm -rf /home/$userName/build-dir
}

wminstall() {
	clear
	echo "Setting up WM"
	if [ "$wmChoice" = "1" ]
	then
		pacman -S plasma-meta kde-applications-meta plasma-nm sddm --noconfirm --needed
	elif [ "$wmChoice" = "2" ]
	then
		pacman -S plasma-meta plasma-nm sddm --noconfirm --needed
	elif [ "$wmChoice" = "3" ]
	then
		pacman -S gnome gdm --noconfirm --needed
	elif [ "$wmChoice" = "4" ]
	then
		pacman -S i3 network-manager-applet blueman sddm --noconfirm --needed
	elif [ "$wmChoice" = "5" ]
	then
		pacman -S xfce4 sddm --noconfirm --needed
	else
		wm = "none"
	fi
}

kdecustom() {
	clear
	echo "Setting up custom KDE install"
	pacman -s svn --noconfirm --needed
	cd /home/$userName/
	svn checkout https://github.com/maelodic/maelo-arch-install-kde/trunk/dotfiles
	ln -s dotfiles/config /home/$userName/.config
	ln -s dotfiles/local /home/$userName/.local
	ln -s dotfiles/kde4 /home/$userName/.kde4
	find . -exec chown $userName.$userName {} \;
	rm -rf 
}

software() {
	clear
	echo "Setting up additional software"
	pacman -S grub efibootmgr os-prober sudo networkmanager reflector git dialog sddm xorg-server xorg-font-util xorg-xinit xterm xf86-video-vesa xf86-input-synaptics vim xorg-xkill --noconfirm --needed
       	if [ "$wmChoice" = "4" ]
       		then
		systemctl enable gdm.service
		systemctl enable NetworkManager
	elif [ "$wm" != "none" ]
		then
		systemctl enable sddm.service
		systemctl enable NetworkManager
	fi	
}

passwords() {
	clear
	echo "Set root password: "
	passwd
	echo " --- "
	echo "Set $userName password: "
	passwd "$userName"
}

main() {
	initpackages	#Update reps
	hostname	#Setup hostname
	timekeeping	#Set up timzone and generate the locale
			#Install swapfile if selected
	if [ "$swapChoice" == y -o "$swapChoice" == Y ]
		then
		makeswap
	fi
	drivers 	#Install drivers if previously specified
	adduser		#Add user with sudoers access
			#Install pacaur
	if [ "$pacaurChoice" == y -o "$pacaurChoice" == Y ]
		then
		pacaurinstall
	fi
			#Install WM/DE
	if [ "$wm" != "none" ]
		then
		wminstall
	fi
			#Install KDE custom setup if selected
	if [ "$wmChoice" = "1" ]
		then
		kdecustom
	fi
	software	#Install additional software
	bootloader	#Set up grub
	passwords	#Set user and root passwords	
	rm /root/chroot.sh
}

main
