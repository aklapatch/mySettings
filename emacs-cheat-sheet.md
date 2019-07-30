# emacs-config
My journey through configuring emacs to my liking.

## Notes
+ The config file (.emacs)  for windows is in `C:\Users\username\AppData\Roaming\`

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


### Magit

+ `M-x magit-status` to get into a git status buffer
    
 ##### In the git status buffer:
   +  `s` to stage files
    + `c c` to commit (type the message then C-c C-c to actually commit)
    + `b b` to switch to another branch
   + `P u` to do a git push
   + `F u` to do a git pull

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

### ace-jump-mode
+ `C-c SPC` enter ace-jump-mode
+ `C-c SPC` ace-jump-word-mode
+ `C-u C-c SPC` ace-jump-char-mode
+ `C-u C-u C-c SPC` ace-jump-line-mode

### org mode
https://orgmode.org/org.html#Summary

(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)

### Neotree key bindings

+ `n` next line, `p` previous line
+ `SPC` or `RET` or `TAB` Open current item if it is a file. Fold/Unfold current item if it is a directory.
+ `U` Go up a directory
+ `g` Refresh
+ `A` Maximize/Minimize the NeoTree Window
+ `H` Toggle display hidden files
+ `O` Recursively open a directory
+ `C-c C-n` Create a file or create a directory if filename ends with a ‘/’
+ `C-c C-d` Delete a file or a directory.
+ `C-c C-r` Rename a file or a directory.
+ `C-c C-c` Change the root directory.
+ `C-c C-p` Copy a file or a directory.

## Steps/Packages
+ Installing MELPA (package repo). Instructions are [here](http://ergoemacs.org/emacs/emacs_package_system.html). Remeber to restart emacs before refreshing the package list.



