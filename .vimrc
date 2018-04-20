set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
"clang completion
"             Plugin 'justmao945/vim-clang' Disabled for compatiblity
Plugin 'jiangmiao/auto-pairs'
"doxygen
Plugin 'vim-scripts/DoxygenToolkit.vim'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
 ":PluginClean! "     - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

set number
syntax on

set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set cindent
set cinoptions=(0)

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
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
colorscheme apprentice
set autoindent
set cindent
set mouse=a
