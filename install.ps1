## 
# @author Alex Rickert (ARickert0003@gmail.com)
# @date   08/06/23
# @brief  Windows environment install script for programming
##

# ============================
# Make Prefered File Structure
# ============================

# Nonadmin install user specific
$local_install = '~\AppData\Local'

# For all local programming projects
mkdir ~/Projects

# ============================
# Install Various Programs
# ============================

# Update Powershell to most recent
winget install --id Microsoft.Powershell --source winget

# Install git
winget install -e --id Git.Git

# Install python
winget install -e --id Python.Python.3.0

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
git clone https://github.com/preservim/nerdtree ~/vimfiles/NERDTree/start/

# ============================
# Install Quartus (Big)
# ============================

# Install Quartus Lite 18.1
#curl --output-dir ~/Downloads https://cdrdv2.intel.com/v1/dl/getContent/665990/666029?filename=Quartus-lite-18.1.0.625-windows.tar
#tar -xvzf ~/Downloads/Quartus-lite-18.1.0.625-windows.tar -C ~/Downloads
#start-process ~/Downloads/Quartus-lite-18.1.0.625-windows/setup.bat

# Install Quartus Standard 18.1
#curl --output-dir ~/Downloads https://cdrdv2.intel.com/v1/dl/getContent/665987/666013?filename=Quartus-18.1.0.625-windows-complete.tar
#tar -xvzf ~/Downloads/Quartus-lite-18.1.0.625-windows-complete.tar -C ~/Downloads
#start-process ~/Downloads/Quartus-lite-18.1.0.625-windows-complete/setup.bat

# Install Quartus Pro 19.3
#curl --output-dir ~/Downloads https://cdrdv2.intel.com/v1/dl/getContent/661657/661690?filename=Quartus-pro-19.3.0.222-windows-complete.tar
#tar -xvzf ~/Downloads/Quartus-lite-18.1.0.625-windows-complete.tar -C ~/Downloads
#start-process ~/Downloads/Quartus-lite-18.1.0.625-windows-complete/setup.bat

