" c: Automatically break comments using the textwidth value.
" r: Automatically insert the comment leader when hitting <Enter> in insert mode.
" o: Automatically insert the comment leader when hitting 'o' or 'O' in normal mode.
" n: Recognize numbered lists. When hitting <Enter> in insert mode.
" m: Automatically break the current line before inserting a new comment line.
set formatoptions+=cronm
" This sets the width of a tab character to 4 spaces.
set tabstop=4
" This sets the number of spaces used when the <Tab> key is pressed in insert
" mode to 4.
set softtabstop=4
" This sets the number of spaces used for each indentation level when using
" the '>' and '<' commands, as well as the autoindent feature.
set shiftwidth=4
" This setting enables automatic indentation, which will copy the indentation
" of the current line when starting a new line.
set autoindent
" This disables the automatic conversion of tabs to spaces when you press the
" <Tab> key.
set noexpandtab
" This enables the use of the mouse in all modes (normal, visual, insert,
" command-line, etc.).
set mouse=a
" This displays line numbers in the left margin.
set number
" This disables the creation of backup files.
set nobackup
" This disables the creation of swap files.
set noswapfile
" Automatically reload files when they change
set autoread
" Enable spell checking
set spell
set spelllang=en,es
" Highlight the current line
set cursorline
" Show white space characters and tab characters
set list
" Show spaces as dots
set lcs+=space:·
" Highlight the 100th column
set colorcolumn=100
" Set text width to 100
set textwidth=100

if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif


call plug#begin()
    Plug 'akinsho/bufferline.nvim', { 'tag': 'v3.7.0' } " plugin for tab line at the top
    Plug 'catppuccin/nvim', { 'as': 'catppuccin' } " a beautiful color scheme
    Plug 'dense-analysis/ale' " linting and fixing code.
    Plug 'jeetsukumaran/vim-buffergator' " easy switching between buffers.
    Plug 'junegunn/goyo.vim' " Clean interface when you need it
    Plug 'kkvh/vim-docker-tools' " Docker integration
    Plug 'ledger/vim-ledger' " ledger accounting system.
    Plug 'lewis6991/gitsigns.nvim' " text buffer Git integration.
    Plug 'majutsushi/tagbar' " displaying tags in a sidebar.
    Plug 'mbbill/undotree' " Undo/Redo History Visualizer
    Plug 'morhetz/gruvbox' " Gruvbox: Color Scheme
    Plug 'neovim/nvim-lspconfig' " Language Server Protocol Config
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Syntax and code analysis
    Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' } " File explorer
    Plug 'ryanoasis/vim-devicons' " Developer font icons
    Plug 'tpope/vim-commentary' " Commenting tool
    Plug 'tpope/vim-dispatch' " Asynchronous execution
    Plug 'tpope/vim-fugitive' " Git integration
    Plug 'vim-airline/vim-airline' " Visual status line indicators
    Plug 'vim-airline/vim-airline-themes' " Themes for airline
    Plug 'vim-scripts/SpellCheck' " Spell checking
    Plug 'voldikss/vim-floaterm' " Floating terminal support
call plug#end()

