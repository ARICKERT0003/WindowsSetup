## 
# @author Alex Rickert (ARickert0003@gmail.com)
# @date   08/06/23
# @brief  Windows environment install script for programming
##

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

$LITE_DL = https://downloads.intel.com/akdlm/software/acdsinst/18.1std/625/ib_tar/Quartus-lite-18.1.0.625-windows.tar
$STANDARD_DL = https://downloads.intel.com/akdlm/software/acdsinst/18.1std/625/ib_tar/Quartus-18.1.0.625-windows-complete.tar
$PRO_DL = https://downloads.intel.com/akdlm/software/acdsinst/19.3/222/ib_tar/Quartus-pro-19.3.0.222-windows-complete.tar

# Install Quartus Lite 18.1
start-BitsTransfer -Source LITE_DL -Destination ~/Downloads
mkdir ~/Downloads/quartus-lite
tar -xvzf ~/Downloads/Quartus-lite-18.1.0.625-windows.tar -C ~/Downloads/quartus-lite
start-process ~/Downloads/quartus-lite/setup.bat

# Install Quartus Standard 18.1
start-BitTransfer -Source STANDARD_DL -Destination ~/Downloads
mkdir ~/Downloads/quartus-standard
tar -xvzf ~/Downloads/Quartus-18.1.0.625-windows-complete.tar -C ~/Downloads/quartus-standard
start-process ~/Downloads/quartus-standard/setup.bat

# Install Quartus Pro 19.3
start-BitTransfer -Source PRO_DL -Destination ~/Downloads
mkdir ~/Downloads/quartus-pro
tar -xvzf ~/Downloads/Quartus-pro-19.3.0.222-windows-complete.tar -C ~/Downloads/quartus-pro
start-process ~/Downloads/quartus-pro/setup.bat

