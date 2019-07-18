# copy the emacs dir into here
Remove-Item "$PSScriptRoot\.emacs.d" -Force -Recurse 
Copy-Item -Path "$HOME\AppData\Roaming\.emacs.d" -Destination $PSScriptRoot -Force -Recurse
Read-Host 'press enter to exit'