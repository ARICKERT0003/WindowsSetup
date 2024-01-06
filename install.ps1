## 
# @author Alex Rickert (ARickert0003@gmail.com)
# @date   08/06/23
# @brief  Windows environment install script for programming
##

# ============================
# Paths
# ============================

$LOCAL_INSTALL = "$home\AppData\Local"
$PROJECTS = "$home/Projects"
$STARSHIP_CONFIG = "$home/.config"
$POWERSHELL_SETTINGS = "$home/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/"
$VIMFILES_PATH = "$home/vimfiles"

# ============================
# User Options
# ============================

#param( 
#[string[]] $Quartus
#)

# ============================
# Make Prefered File Structure
# ============================
# For all local programming projects
mkdir $PROJECTS

# ============================
# Powershell
# ============================

# Update Powershell to most recent
winget install --id Microsoft.Powershell --source winget

# Copy profile
cp profile.ps1 $PROFILE

# Copy prefered settings
cp settings.json $POWERSHELL_SETTINGS/settings.json

# ============================
# Install Git
# ============================

# Install git
winget install -e --id Git.Git

# Add to system PATH
setx /M PATH "$Env:PATH;C:\Program Files\Git\cmd"

# Add to system PATH (current session)
set /M PATH "$Env:PATH;C:\Program Files\Git\cmd"

# Make SSH key
ssh-keygen -b 4096

# ============================
# Install Starship
# ============================

# Install nerdfonts ( prereq for starship)
git clone --filter=blob:none --sparse https://github.com/ryanoasis/nerd-fonts.git $LOCAL_INSTALL/nerd-fonts
cd $LOCAL_INSTALL/nerd-fonts
git sparse-checkout add patched-fonts/JetBrainsMono
./install.ps1 JetBrainsMono
cd $home

# Install Starship 
# - Allows me to customize terminal and make it more efficient/comfortable to program in
# - Website https://starship.rs/ 
winget install starship

mkdir $STARSHIP_CONFIG
cp starship.toml $STARSHIP_CONFIG/starship.toml

# ============================
# Install Python Setup
# ============================

# Install python
winget install -e --id Python.Python.3.0

# Install pip and other tools
python -m pip install --upgrade pip setuptools virtualenv

python -m virtualenv kivy_vnenv

kivy_venv\Scripts\activate.ps1

python -m pip install "kivy[base]" kivy_examples

# ============================
# Install Text Editor
# ============================

# Install text editor (Vim)
winget install -e --id vim.vim

# Add to PATH
setx /M PATH "$Env:PATH;C:\Program Files\Vim\vim90"

# Add to current PATH
set /M PATH "$Env:PATH;C:\Program Files\Vim\vim90"

# Create directories for editor config files and packages
mkdir $VIMFILES_PATH 
mkdir $VIMFILES_PATH/backup 
mkdir $VIMFILES_PATH/pack 
mkdir $VIMFILES_PATH/swap

# Copy vim settings
cp vimrc $VIMFILES_PATH/vimrc

# NERDTree (file explorer)
mkdir ~/vimfiles/pack/NERDTree/start
cd ~/vimfiles/pack/NERDTree/start
git clone https://github.com/preservim/nerdtree

# ============================
# Install VeraCrypt
# ============================
$VC_DL_URL = "https://launchpad.net/veracrypt/trunk/1.26.7/+download/VeraCrypt%20Setup%201.26.7.exe"
Invoke-WebRequest $VC_DL_URL -Outfile $home/Downloads/veracrypt.exe
cd $home/Downloads
./veracrypt.exe

# ============================
# Install WSL
# ============================
wsl --install -d Ubuntu-22.04

# Attach and share usb devices w/ WSL
winget install usbipd

# ============================
# Install Quartus
# ============================
<#
foreach( $Q_DL in $Quartus )
{
  $Q_PATH = $env:Path

  Switch( $Q_DL )
  {
    "help"
    {
      "Options:"
      "18.1.0-lite"
      "18.1.0-std"
      "19.3.0-pro"
      "20.1.1-lite"
    }

    "18.1.0-lite"
    {
      "Quartus DL: $Q_DL"
      $Q_DL_URL = "https://downloads.intel.com/akdlm/software/acdsinst/18.1std/625/ib_tar/Quartus-lite-18.1.0.625-windows.tar"
      $Q_DL_PATH = "$home/Downloads/Quartus-lite-18.1.0.625-windows.tar"
      $Q_DIR = "$home/Downloads/Quartus-18.1.0-lite.tar"
      $Q_PATH += ";C:\intelFPGA_lite\18.1\quartus\bin64"
    }

    "18.1.0-std"
    {
      "Quartus DL: $Q_DL"
      $Q_DL_URL = "https://downloads.intel.com/akdlm/software/acdsinst/18.1std/625/ib_tar/Quartus-18.1.0.625-windows-complete.tar"
      $Q_DL_PATH = "$home/Downloads/Quartus-18.1.0.625-windows-complete.tar"
      $Q_DIR = "$home/Downloads/Quartus-18.1.0-std.tar"
    }

    "19.3.0-pro"
    {
      "Quartus DL: $Q_DL"
      $Q_DL_URL = "https://downloads.intel.com/akdlm/software/acdsinst/19.3/222/ib_tar/Quartus-pro-19.3.0.222-windows-complete.tar"
      $Q_DL_PATH = "$home/Downloads/Quartus-pro-19.3.0.222-windows-complete.tar"
      $Q_DIR = "$home/Downloads/Quartus-19.3.0-pro"
    }

    "20.1.1-lite"
    {
      "Quartus DL: $Q_DL"
      $Q_DL_URL = "https://downloads.intel.com/akdlm/software/acdsinst/20.1std.1/720/ib_tar/Quartus-lite-20.1.1.720-windows.tar"
      $Q_DL_PATH = "$home/Downloads/Quartus-lite-20.1.1.720-windows.tar"
      $Q_DIR = "$home/Downloads/Quartus-20.1.1-lite"
      $Q_PATH += ';C:\intelFPGA_lite\20.1\quartus\bin64'
    }
    default 
    { 
      "$Q_DL does not match any Quartus Downloads" 
      continue
    }
  }

  Invoke-WebRequest $Q_DL_URL -Outfile $Q_DL_PATH

  if( !(Test-Path $Q_DIR -PathType Container ))
  { New-Item -ItemType Directory -Force -Path $Q_DIR }

  tar -xvzf $Q_DL_PATH -C $Q_DIR
  start-process $Q_DIR/setup.bat

 [Environment]::SetEnvironmentVariable( "Path", $Q_PATH, [System.EnvironmentVariableTarget]::Machine )  

  rm -r $Q_DIR
  rm -r $Q_DL_PATH 
}
#>

