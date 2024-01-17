$ENV:STARSHIP_CONFIG = "$HOME\.config\starship.toml"
$ENV:STARSHIP_DISTRO = ""

Invoke-Expression (& 'C:\Program Files\starship\bin\starship.exe' init powershell)

