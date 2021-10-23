
# pacman
- pacman -S  <package name> => install a pack 
- pacman -Ss <package name> => search a pack on rep
- pacman -Q  <package name> => search installed pack
- pacman -Sy 		  => update rep database
---------------------------------------
## To change icons and themes
run lxappearance 
---------------------------------------
## change kernel to lts
pacman -S linux-lts
update-grub
reboot
---------------------------------------
## Dont update Kernel pacman
sudo vim /etc/pacman.conf
uncomment IgnorePkg = linux
---------------------------------------
## Timeshift auto snapshots 
pacman -S timeshift grub-btrfs timeshift-autosnap
complete timeshift wizard 
sudo systemctl enable grub-btrfs.path
sudo systemctl start grub-btrfs.service

now you have snapshots on grub loader screen as an option
---------------------------------------
## SSH Keys
```
ssh-keygen -t ed25519
```
add keys to your remote server
```
ssh-copy-id user@domain.com
```
Adding keys to github
```
pbcopy < ~/.ssh/id_ed25519.pub
```
---------------------------------------
## Installing NVM Node Version Manager
```
yay -S nvm
```
add scripts to .bashrc and zshrc as recomended 
check if it loads correctly
```
command -v nvm
```
install LTS Node version latest
```
nvm install --lts
```
Check Node version installed
```
node --version
```

install Prettier NVM completion Nodemon
```
npm i -g prettier nvm-completion nodemon
```
---------------------------------------
## Install Python & Pip
```
python -m ensurepip --upgrade
```
---------------------------------------
## Intel Video Drivers Arch linux for surface pro 3 i7 with Intel HD graphics 5000
3d rendering Hardware video accelaration drivers
arch wiki follow intel graphics and hardware video acceleration pages
```
pacman -S libva-intel-driver
pacman -S intel-gpu-tools
```
view the process 
```
sudo intel_gpu_tool
```
```
pacman -S libva-utils
```
then check for no errors 
```
vainfo
```
you must get the info correctly for futher steps 
```
grep -iE 'vdpau | dri driver' /var/log/Xorg.0.log
```
then see what drivers you need to install
i put env variables /etc/profile.d/intel_graphics3d.sh 
and add env vars
```
export LIBVA_DRIVER_NAME=i965
export VDPAU_DRIVER=va_gl
```
hardware video acceleration from arch wiki
pacman -S vdpauinfo
```
vdpauinfo
```
can not find libvdpau-va-gl error
/usr/lib/vdpau/ dir there is a driver called trace but it does not work 
instead we need the driver called va_gl for intel hD graphics card 
check for your vga card from arch wiki what its suggesting

then install lib
```
yay libvdpau-va-gl
```
now check if its ok
```
vdpauinfo
```
then vola
some app like OBS-studio do not work with LTS kernel try ZEN kernel incase of problem


