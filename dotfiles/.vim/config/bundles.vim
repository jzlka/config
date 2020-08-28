filetype off

set rtp+=~/.vim/bundle/Vundle.vim

" Just one vimrc file for Windows & Linux
let win_shell = (has('win32') || has('win64')) && &shellcmdflag =~ '/'
let vimDir = win_shell ? '$HOME/vimfiles' : '$HOME/.vim'
let &runtimepath .= ',' . expand(vimDir . '/bundle/Vundle.vim')
call vundle#rc(expand(vimDir . '/bundle'))

" Plugin Manager
Plugin 'VundleVim/Vundle.vim'

"
Plugin 'Valloric/YouCompleteMe'

" Show syntax errors upon save
Plugin 'scrooloose/syntastic'

" Count time spent editing a file
Plugin 'git-time-metric/gtm-vim-plugin'

"
"Plugin 'davidhalter/jedi-vim'

"
"Plugin 'hari-rangarajan/CCTree'

"
"Plugin 'ctags.vim'

"
"Plugin 'altercation/vim-colors-solarized'

" The bar at the bottom
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'

"
"Plugin 'tpope/vim-surround'

"
"Plugin 'mickaobrien/vim-stackoverflow'

"
Plugin 'ciaranm/securemodelines'

"
Plugin 'doums/darcula'

"
Plugin 'sjl/badwolf'

"
Plugin 'vim-scripts/256-jungle'

" Ranbow Parentheses
Plugin 'luochen1990/rainbow'

filetype plugin indent on

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
"Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required

" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line}}
" let Vundle manage Vundle, required
