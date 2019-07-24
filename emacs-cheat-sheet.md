# emacs-config
My journey through configuring emacs to my liking.

## Notes
+ The config file (.emacs)  for windows is in `C:\Users\username\AppData\Roaming\`

## packages
+ spacemacs
+ treemacs
+ real-auto-save
+ highlight-indent-guides
+ centaur-tabs

## Useful commands/keybinds
Emacs manual [here](https://www.gnu.org/software/emacs/manual).

`C` is the Ctrl key and `M` is the  Alt key.

+ `C-g` or `<ESC> <ESC> <ESC>`: Cancel a half-typed command

+ `C-_`: Undo change in current buffer contents

+ `C-<Space>`: Mark a point to start highlighting

+ `C-v`, `M-v`: Scroll one page forward and one page back, respectively

+ `M-g M-g` and `M-g g`: Go to line number (line number is entered after the command is entered)

+ `C-x C-b`: List the existing buffers.

+ `C-x C-c`: exit emacs, saving all buffers.

+ `M-x shell`: open a shell in emacs.

+ `C-x C-d`: open a directory to list files

### Moving the cursor
+ `C-a`, `C-e`: Move to beginning and end of the line, respectively.

+ `M-f`,`M-b`: Move forward and backward one word, respectively.

+ `M-<`,`M->`: Move cursor to back or end of document, respectively.

### Text searching
+ `C-s`: Search for text from top to bottom. (press it again to go to the next matching text entry)

+ `C-r`: Search for text, but from bottom to top.

### Manipulating windows

+ `C-x 2` Split current window into two windows, one above another.

+ `C-x 3` Split current window into two side by side windows

+ `C-x o` Select another window

+ `C-x b BufferName`: select/create buffer with `BufferName`

+ `C-x 4 b BufferName`: Select BufferName in another window.

+ `C-x k buffername`: kills the buffer named `buffername`

+ `C-x 4 0`: kill window and buffer.

### open side file manager
+ `C-x n`: initialize neotree as a sidebar file manager.

### org mode
https://orgmode.org/org.html#Summary

(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)




## Steps/Packages
+ Installing MELPA (package repo). Instructions are [here](http://ergoemacs.org/emacs/emacs_package_system.html). Remeber to restart emacs before refreshing the package list.



