## runit-gentoo
##### this repo contains my personal runit config along with service files that weren't included in Powerman's gentoo overlay!
##### this repo is also based on [void-runit](https://github.com/void-linux/void-runit/tree/master), the default runit config that gentoo comes with and [runit-rc](https://github.com/neeshy/runit-rc)!

### disclaimer!!!
##### this config may not work on your system since i only tested these scripts on gentoo

### dependencies!
- **A shell like posix shell such as dash or bash**
- **util-linux (agetty)**
- **[seedrng](https://git.zx2c4.com/seedrng/about/)**
- **procps-ng (pkill)**
- **and runit**
### system services!
##### this config has services for:
- **iwd**
- **NetworkManager**
- **greetd**
- **tlp**
- **sulogin**
- **and everything agetty needs to run**

### usage!
#### to use this config all you need to do is install runit then follow these steps!
</details>
<details close>

<summary><b>clone the repo</b></summary>

<br>

```
git clone https://github.com/imrando/runit-gentoo
```

</details>

</details>
<details close>

<summary><b>copy the config to the runit dir</b></summary>

<br>

remove the default config (if you use runit from Powerman's gentoo overlay this may not be necessary!)

```
sudo/doas rm -rf /etc/runit
sudo/doas rm -rf /etc/sv
```

copy the config into /etc

```
sudo/doas cp ~/runit-gentoo/runit /etc
sudo/doas cp ~/runit-gentoo/sv /etc
```
</details>

</details>
<details close>

<summary><b>edit your grub config so your system can boot with runit as it's init!</b></summary>

<br>

add this kernel parameter to your /etc/default/grub like this!
```
GRUB_CMDLINE_LINUX="init=/sbin/runit-init"
```

then update the grub config!
```
sudo/doas grub-mkconfig -o /boot/grub/grub.cfg
```
</details>

</details>
<details close>

<summary><b>make your new system actually usable! (these instructions are gentoo only!)</b></summary>

<br>

step 1: install the eselect-repository tool to enable the Powerman overlay! 
###### (this overlay contains various packages meant for gentoo being used with runit as it's main init such as service files for runit or runit without the default config)

```
sudo/doas emerge -a app-eselect/eselect-repository
```

step 2: enable the overlay! 
###### (it's also recomended to enable the guru overlay to be able to install packages that aren't on the main gentoo repository! guru is esentially the gentoo equivalent of the aur!)

```
sudo/doas eselect repository enable powerman
sudo/doas eselect repository enable guru
```

step 3: sync the repositories!
###### (this subcommand makes it so you're able to install the newest version of any package form every single repository!) 
```
sudo/doas emerge --sync
```
if you want to install anything from powerman overlay just check out their [repository](https://github.com/powerman/powerman-overlay)!
</details>

#### now you're officially done! 
