set nocompatible              " be iMproved, required
filetype off                  " required

set number
syntax on

set shiftwidth=4
set softtabstop=4
set tabstop=4
set cindent
set cinoptions=(0)

set statusline+=%#warningmsg#
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
if &term =~ "xterm"
  " 256 colors
   let &t_Co = 256
  "     " restore screen after quitting
       let &t_ti = "\<Esc>7\<Esc>[r\<Esc>[?47h"
         let &t_te = "\<Esc>[?47l\<Esc>8"
           if has("terminfo")
              let &t_Sf = "\<Esc>[3%p1%dm"
                   let &t_Sb = "\<Esc>[4%p1%dm"
                     else
                         let &t_Sf = "\<Esc>[3%dm"
                             let &t_Sb = "\<Esc>[4%dm"
                     endif
   	     endif

set autoindent
set mouse=a
