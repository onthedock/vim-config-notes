# Configuración de Vim como un IDE

Uso de base una imagen de Docker con Bash, que no tiene prácticamente nada.

La imagen en la que se distribuye Bash está basada en Alpine:

```console
bash-5.2# cat /etc/os-release 
NAME="Alpine Linux"
ID=alpine
VERSION_ID=3.19.1
PRETTY_NAME="Alpine Linux v3.19"
HOME_URL="https://alpinelinux.org/"
BUG_REPORT_URL="https://gitlab.alpinelinux.org/alpine/aports/-/issues"
```

## Instalación de Vim

> Tras la instalación de Vim, podemos añadir acentos al texto en Vim.

```console
# apk add vim
fetch https://dl-cdn.alpinelinux.org/alpine/v3.19/main/x86_64/APKINDEX.tar.gz
fetch https://dl-cdn.alpinelinux.org/alpine/v3.19/community/x86_64/APKINDEX.tar.gz
(1/3) Installing vim-common (9.0.2127-r0)
(2/3) Installing xxd (9.0.2127-r0)
(3/3) Installing vim (9.0.2127-r0)
Executing busybox-1.36.1-r15.trigger
OK: 39 MiB in 21 packages
```

Tras la instalación, validamos la versión instalada:

```console
# vim vim_config.md

VIM - Vi IMproved 9.0 (2022 Jun 28, compiled Nov 24 2023 11:25:06)
Included patches: 1-2127
Compiled by Alpine Linux
...
```

## Configuración

> Basada en la guía [Awesome Vim: Modern Guide To A Fully Featured Vim IDE](https://swedishembedded.com/developers/vim-in-minutes)

He creado el fichero `~/.vimrc` con el contenido:

```console
" c: Automatically break comments using the textwidth value.
" r: Automatically insert the comment leader when hitting <Enter> in insert mode.
" o: Automatically insert the comment leader when hitting 'o' or 'O' in normal mode.
" n: Recognize numbered lists. When hitting <Enter> in insert mode.
" m: Automatically break the current line before inserting a new comment line.
set formatoptions+=cronm
" This sets the width of a tab character to 4 spaces.
set tabstop=4
" This sets the number of spaces used when the <Tab> key is pressed in insert mode to 4.
set softtabstop=4
" This sets the number of spaces used for each indentation level when using the '>' and '<' commands, as well as the autoindent feature.
set shiftwidth=4
" This setting enables automatic indentation, which will copy the indentation of the current line when starting a new line.
set autoindent
" This disables the automatic conversion of tabs to spaces when you press the <Tab> key.
set noexpandtab
```

Habilitamos el *mouse* en la consola:

```console
" This enables the use of the mouse in all modes (normal, visual, insert,
" command-line, etc.).
set mouse=a
```

Otras mejoras:

```console
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
set spelllang=en
" Highlight the current line
set cursorline
" Show white space characters and tab characters
set list
" Highlight the 100th column
set colorcolumn=100
" Set text width to 100
set textwidth=100
```

> Podemos habilitar la corrección de palabras en castellano descargando los ficheros  `spl` y `sug`
> para los idiomas especificados, separados por comas, mediante:
>
> ```console
> set spelllang=en,es
> ```

Los ficheros se pueden descargar desde <https://ftp.nluug.nl/vim/runtime/spell/> y deben colocarse
en la carpeta `~/.vim/spell`

Con la configuración actual, los espacios se muestran como `$`, lo que resulta demasiado recargado
para mi gusto.
Se puede modificar por un "punto" mediante:

```console
" Show white space characters and tab characters
set list
" Show spaces as dots
set lcs+=space:·
"
```

Se puede desactivar mediante `set nolist`.

A continuación, en el artículo de referencia, se configuran *shortcuts* relacionados con *vim
motions* que no voy a configurar.

## Instalación de *plugins*

Como gestor de *plugins* se usa *Vim Plug*, que se instala mediante el siguiente bloque:

```console
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif
```

Para ello, es necesario tener instalado `curl`. En la imagen de *bash*, es necesario instalarlo
mediante:

```console
apk add curl
```

Al volver a abrir Vim, se descarga e instala [*Vim Plug*](https://github.com/junegunn/vim-plug).

Una vez tenemos el gestor de *plugins*, el artículo de referencia instala los siguientes:

```console
call plug#begin()
    Plug 'akinsho/bufferline.nvim', { 'tag': 'v3.7.0' } " plugin for tab line at the top
    Plug 'catppuccin/nvim', { 'as': 'catppuccin' } " a beautiful color scheme
    Plug 'dense-analysis/ale' " linting and fixing code.
    Plug 'habamax/vim-asciidoctor' " editing AsciiDoc files.
    Plug 'inkarkat/vim-AdvancedSorters' " advanced sorting of text.
    Plug 'inkarkat/vim-ingo-library' " a library of useful functions for Vim.
    Plug 'jeetsukumaran/vim-buffergator' " easy switching between buffers.
    Plug 'junegunn/goyo.vim' " Clean interface when you need it
    Plug 'kkvh/vim-docker-tools' " Docker integration
    Plug 'ledger/vim-ledger' " ledger accounting system.
    Plug 'lervag/vimtex' " LaTeX editing.
    Plug 'lewis6991/gitsigns.nvim' " text buffer Git integration.
    Plug 'madox2/vim-ai' " AI-assisted coding.
    Plug 'majutsushi/tagbar' " displaying tags in a sidebar.
    Plug 'mbbill/undotree' " Undo/Redo History Visualizer
    Plug 'morhetz/gruvbox' " Gruvbox: Color Scheme
    Plug 'neoclide/coc.nvim', {'branch': 'release'} " text completion endine
    Plug 'neovim/nvim-lspconfig' " Language Server Protocol Config
    Plug 'nvim-orgmode/orgmode' " Note-taking, Task-tracking, Outlining, Scheduling
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Syntax and code analysis
    Plug 'p00f/nvim-ts-rainbow' " Colorful parenthesis
    Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' } " File explorer
    Plug 'puremourning/vimspector' " Debugger integration
    Plug 'ryanoasis/vim-devicons' " Developer font icons
    Plug 'stsewd/sphinx.nvim' " Sphinx integration
    Plug 'tpope/vim-commentary' " Commenting tool
    Plug 'tpope/vim-dispatch' " Asynchronous execution
    Plug 'tpope/vim-fugitive' " Git integration
    Plug 'tpope/vim-speeddating' " Quick date navigation
    Plug 'vim-airline/vim-airline' " Visual status line indicators
    Plug 'vim-airline/vim-airline-themes' " Themes for airline
    Plug 'vim-scripts/DoxygenToolkit.vim' " Doxygen support
    Plug 'vim-scripts/SpellCheck' " Spell checking
    Plug 'vim-scripts/c.vim' " Syntax highlighting and indentation
    Plug 'vimwiki/vimwiki' " Note taking and task management
    Plug 'voldikss/vim-floaterm' " Floating terminal support
call plug#end()
```

> Necesitamos instalar `git` para que la instalación de los *plugins* funcione:

```console
apk add git
```

Para instalar los *plugins*, ejecutamos el comando `:PlugInstall`.

> Como el artículo de referencia usa NeoVim, parece que algunos *plugins* no se instalan
> correctamente.

```console
# vim ~/.vimrc 
Error detected while processing /root/.vim/plugged/vim-ai/plugin/vim-ai.vim:
line    3:
Python 3 support is required for vim-ai plugin
[coc.nvim] "node" is not executable, checkout https://nodejs.org/en/download/
Error detected while processing /root/.vim/plugged/nvim-ts-rainbow/plugin/rainbow.vim:
line    1:
E370: Could not load library liblua.so: Error loading shared library liblua.so: No such file or directory
Lua library cannot be loaded.
```

En vez de intentar arreglar los errores, voy a revisar primero la lista de *plugins* para verificar
que me interesan todos los que aparecen listado.

Después de una primera limpieza, hemos eliminado algunos errores...

```console
# vim /data/vim_config.md
[coc.nvim] "node" is not executable, checkout https://nodejs.org/en/download/
Error detected while processing /root/.vim/plugged/nvim-ts-rainbow/plugin/rainbow.vim:
line    1:
E370: Could not load library liblua.so: Error loading shared library liblua.so: No such file or directory
Lua library cannot be loaded
```

Vemos que, por un lado, uno de los errores hace referencia a `coc`, un *plugin* de NeoVim
relacionado con el autocompletado, así que éste lo eliminaremos.

En cuanto a `nvim-ts-rainbow`, creo que está relacionado con TreeSitter, otro *plugin* de NeoVim.

Tras la segunda purga, Vim se abre y podemos realizar la instalación de todos los *plugins*
indicados con `:PlugInstall`.

```console
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
```

