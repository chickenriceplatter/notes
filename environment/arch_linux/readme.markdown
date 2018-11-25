arch linux apps to install
===

autokey (customize key bindings)
---
```
yaourt -S autokey-py3
```

awesome-terminal-fonts
---
```
sudo pacman -S awesome-terminal-fonts
```

htop
---
```
sudo pacman -S htop
```

keepassxc
---
```
sudo pacman -S keepassxc
```

mupdf (pdf viewer)
---
```
sudo pacman -S mupdf
```

okular (pdf viewer)
---
```
sudo pacman -S okular
```

steam
---
```
sudo pacman -S steam
```

sublime text
---
```
yaourt -S sublime-text-dev
```

vlc
---
```
sudo pacman -S vlc
sudo pacman -S qt4
```

gnome extensions
---
```
yaourt -S gnome-shell-extension-dynamic-top-bar
yaourt -S gnome-shell-frippery
yaourt -S gnome-terminal-transparency
yaourt -S gnome-shell-extension-no-topleft-hot-corner
```

fonts
---
```
sudo pacman -S ttf-arphic-uming
sudo pacman -S ttf-baekmuk
sudo pacman -S ttf-dejavu
sudo pacman -S ttf-droid
sudo pacman -S ttf-font-awesome
sudo pacman -S ttf-freefont
sudo pacman -S ttf-hack

yaourt -S ttf-adobe-fonts
yaourt -S ttf-emojione-color
yaourt -S ttf-mac-fonts
yaourt -S ttf-monaco
yaourt -S ttf-ms-fonts
yaourt -S ttf-twemoji-color
```

font-awesome in terminal
---
https://github.com/gabrielelana/awesome-terminal-fonts


Arch install instructions
---

1. create usb boot (https://wiki.archlinux.org/index.php/USB_flash_installation_media)
  ```sudo dd bs=4M if=archlinux-2018.11.01-x86_64.iso of=/dev/sdc1 status=progress oflag=sync```

2. plugin usb boot and turn on computer, change boot order in bios to usb.

3. check internet connection
  ```
  ping -c 3 google.com
  ip a
  ```

4. partition disk
  ```
  fdisk -l

  fdisk /dev/nvmeOn1

  o (to wipe disk)
  n (new partition)
  p (primary)

  press 'enter' when prompted for sector

  +16G

  type
  82 (linux swap)

  n,p,enter

  a (makes partition bootable)

  w (saves and exits fdisk)
  ```

5. format partition
  ```
  mkfs.ext4 /dev/nvme0n1p2

  fdisk -l
  ```

6. mount partition
  ```
  mount /dev/nvme0n1p2 /mnt

  lsblk
  ```

7. install arch
  ```
  pacstrap -i /mnt base base-devel

  genfstab -U -p /mnt >> /mnt/etc/fstab

  cat /mnt/etc/fstab

  arch-chroot /mnt /bin/bash

  pacman -S openssh grub-bios linux-headers linux-lts linux-lts-headers
  ```

8. config local settings
  ```
  nano /etc/locale.gen

  uncomment en-US.UTF-8 UTF-8 line

  locale-gen

  ln -s /usr/share/zoneinfo/America/New_York /etc/localtime

  hwclock --systohc --utc
  ```
9. create computer name
  ```
  echo [computer name] > /etc/hostname

  nano /etc/hosts

  add 127.0.0.1 localhost.localdomain [computer name]
  ```

10. enable dhcpcd
  ```
  systemctl enable dhcpcd
  ```

11. enable ssh
  ```
  systemctl enable sshd.service
  ```

12. set password
  ```
  passwd
  ```

13. set up grub
  ```
  pacman -S grub

  grub-install --target=i386-pc --recheck /dev/nvme0n1p2

  grub-mkconfig -g /boot/grub/grub.cfg

  exit

  umount -R /mnt

  reboot

  login as root
  ```

14. create user
  ```
  useradd -m -g users -G wheel -s /bin/bash [user name]

  passwd [user name]

  EDITOR=nano visudo

  uncomment '%wheel ALL=(ALL) ALL' line
  ```

15. login as user
  ```
  exit
  ```

16. install xorg
  ```
  sudo pacman -S xorg xorg-xinit
  ```

17. install gdm (gnome display manager)
  ```
  sudo pacman -S gdm

  systemctl enable gdm
  ```

18. install gnome
  ```
  sudo pacman -S gnome-control-center gnome-shell gnome-shell-extensions gnome-system-monitor gnome-terminal gnome-tweak-tool nautilus
  ```

19. install audio
  ```
  sudo pacman -S pulseaudio pulseaudio-alsa
  ```

20. start xorg
  ```
  startx
  ```

21. reboot into gnome
  ```
  reboot
  ```

22. install nvidia driver in gnome terminal, install version that matches kernel version
  ```
  sudo pacman -S nvidia-lts
  ```
