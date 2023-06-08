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
# Install Programs
# ============================

# Update Powershell to most recent
winget install --id Microsoft.Powershell --source winget

# Install git
winget install -e --id Git.Git

# Install python
winget install -e --id Python.Python.3.0

# Install nerdfonts ( prereq for starship idk why)
mkdir $LOCAL_INSTALL\fonts
git clone --filter=blob:none --sparse https://github.com/ryanoasis/nerd-fonts.git $LOCAL_INSTALL\fonts


# ============================
# Text Editor
# ============================

# Install text editor (Vim)
winget install -e --id vim.vim

# Create directories for editor config files and packages
mkdir ~/vimfiles ~/vimfiles/backup ~/vimfiles/pack ~/vimfiles/swap

# NERDTree (file explorer)
mkdir ~/vimfiles/NERDTree/start
git clone https://github.com/preservim/nerdtree ~/vimfiles/NERDTree/start/
