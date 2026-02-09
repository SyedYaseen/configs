# Git
sudo dnf install git
git config --global user.email "s.syedyaseen.s@gmail.com"
git config --global user.name syedyaseen

# Fedora Noble setup
# Get the free repository (most stuff you need)
sudo dnf install -y   https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
# Get the nonfree repository (NVIDIA drivers, some codecs)
sudo dnf install -y   https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
# Update everything so it all plays nice together
sudo dnf group upgrade core -y
sudo dnf check-update
# Update everything
sudo dnf update -y
sudo reboot
# See what can be updated
sudo fwupdmgr get-devices
# Refresh the firmware database
sudo fwupdmgr refresh --force
# Check for updates
sudo fwupdmgr get-updates
# Apply them
sudo fwupdmgr update
reboot

sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf swap ffmpeg-free ffmpeg --allowerasing
sudo dnf group upgrade multimedia --set-env="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
sudo dnf group upgrade sound-and-video

# My installs
sudo dnf install swaybg
sudo dnf install kanshi
sudo dnf install brightnessctl
sudo dnf install niri
sudo dnf install sqlite3
sudo dnf install wlr-randr
sudo dnf install localsend
sudo dnf5 install openssl-devel pkg-config
sudo dnf groupinstall "Development Tools"
sudo dnf5 install gcc gcc-c++ make glibc-devel
flatpak install flathub org.localsend.localsend_app
sudo dnf install node

# Proton - Gnome check for no gnome
# wget "https://repo.protonvpn.com/fedora-$(cat /etc/fedora-release | cut -d' ' -f 3)-stable/protonvpn-stable-release/protonvpn-stable-release-1.0.3-1.noarch.rpm"
# sudo dnf install ./protonvpn-stable-release-1.0.3-1.noarch.rpm && sudo dnf check-update --refresh 
# sudo dnf install proton-vpn-gnome-desktop


curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
cargo install sqlx-cli
ssh-keygen -t ed25519 -C "s.syedyaseen.s@gmail.com" -f ~/.ssh/github_key

# Repos
mkdir p && cd ~/p
git clone git@github.com:SyedYaseen/hyle.git

mkdir else-wer && cd else-wer
git clone git@github.com:SyedYaseen/else-wer-app.git
git clone git@github.com:SyedYaseen/else-wer-server.git
git clone git@github.com:SyedYaseen/else-wer-web.git

cd ~/p
mkdir odys && cd odys
git clone git@github.com:SyedYaseen/Odys.git
git clone git@github.com:SyedYaseen/Odys-ui.git
git clone git@github.com:SyedYaseen/Odys-server.git

cd ~/p
git clone git@github.com:SyedYaseen/blog.git
git clone git@github.com:SyedYaseen/bismi.git

sudo dnf install adoptium-temurin-java-repository
sudo dnf install temurin-17-jdk

mkdir -p ~/Android/Sdk/cmdline-tools && cd ~/Android/Sdk/cmdline-tools
wget https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip
unzip commandlinetools-linux-*.zip
mv cmdline-tools latest
rm commandlinetools-linux-*.zip
# Add these to the end of ~/.bashrc
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/emulator

cd ~/Android/Sdk/cmdline-tools/latest/bin
sdkmanager --licenses
./sdkmanager "platform-tools"

# VsCode
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
dnf check-update
sudo dnf install code

# Docker
sudo dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo dnf config-manager addrepo --from-repofile https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker

# Update host name
nano /etc/hosts

# flatpak auto update
chmod +x flatpak_update.sh
./flatpak_update.sh
sudo fc-cache -fv
sudo dnf install -y fuse fuse-libs
sudo systemctl disable NetworkManager-wait-online.service
sudo rm /etc/xdg/autostart/org.gnome.Software.desktop
sudo dnf clean all
sudo dnf autoremove -y
