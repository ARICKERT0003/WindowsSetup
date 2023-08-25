## 
# @author Alex Rickert (ARickert0003@gmail.com)
# @date   08/06/23
# @brief  Windows environment install script for programming
##

# ============================
# User Options
# ============================
param( 
[string[]] $Quartus
)

# ============================
# Make Prefered File Structure
# ============================

# Nonadmin install user specific
$LOCAL_INSTALL = "$home\AppData\Local"

# For all local programming projects
mkdir "$home/Projects"

# ============================
# Install Various Programs
# ============================

# Attach and share usb devices w/ WSL
winget install usbipd

# Update Powershell to most recent
winget install --id Microsoft.Powershell --source winget

# Install git
winget install -e --id Git.Git

# Install nerdfonts ( prereq for starship idk why)
git clone --filter=blob:none --sparse https://github.com/ryanoasis/nerd-fonts.git $LOCAL_INSTALL/nerd-fonts
cd $LOCAL_INSTALL/nerd-fonts
git sparse-checkout add patched-fonts/JetBrainsMono
cd ~/

# Install Starship 
# - Allows me to customize terminal and make it more efficient/comfortable to program in
# - Website https://starship.rs/ 
winget install starship

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

# Create directories for editor config files and packages
mkdir ~/vimfiles 
mkdir ~/vimfiles/backup 
mkdir ~/vimfiles/pack 
mkdir ~/vimfiles/swap

# NERDTree (file explorer)
mkdir ~/vimfiles/pack/NERDTree/start
git clone https://github.com/preservim/nerdtree ~/vimfiles/pack/NERDTree/start/

# ============================
# Install Quartus
# ============================
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
