wget "https://repo.protonvpn.com/fedora-$(cat /etc/fedora-release | cut -d' ' -f 3)-stable/protonvpn-stable-release/protonvpn-stable-release-1.0.3-1.noarch.rpm"
sudo dnf install ./protonvpn-stable-release-1.0.3-1.noarch.rpm && sudo dnf check-update --refresh 
sudo dnf install proton-vpn-gnome-desktop

sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf swap ffmpeg-free ffmpeg --allowerasing
sudo dnf group upgrade multimedia --set-env="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
sudo dnf group upgrade sound-and-video

sudo dnf install niri

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

ssh-keygen -t ed25519 -C "s.syedyaseen.s@gmail.com" -f ~/.ssh/github_key

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

sudo dnf install node
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

sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
dnf check-update
sudo dnf install code

sudo dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo dnf config-manager addrepo --from-repofile https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker

# Update host name
nano /etc/hosts
