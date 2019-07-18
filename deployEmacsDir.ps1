# copy the emacs dir into here
Remove-Item "$HOME\AppData\Roaming\.emacs.d" -Force -Recurse 
Copy-Item -Path "$PSScriptRoot\.emacs.d" -Destination "$HOME\AppData\Roaming\.emacs.d" -Force -Recurse
Read-Host 'press enter to exit'