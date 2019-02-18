set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" if !empty(system("which cmake"))
"   Plugin 'Valloric/YouCompleteMe'
" endif
Plugin 'ajh17/VimCompletesMe'
" Plugin 'ervandew/supertab'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'kien/ctrlp.vim'
Plugin 'Yggdroot/indentLine'
" Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'altercation/vim-colors-solarized.git'
Plugin 'scrooloose/nerdtree.git'
Plugin 'majutsushi/tagbar'
Plugin 'rodjek/vim-puppet'
Plugin 'moll/vim-bbye'
Plugin 'hashivim/vim-hashicorp-tools'
Plugin 'Matt-Deacalion/vim-systemd-syntax'
Plugin 'ddollar/golang-template.vim'
Plugin 'brooth/far.vim'
Plugin 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plugin 'nsf/gocode', {'rtp': 'vim/'}
Plugin 'w0rp/ale'

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
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
"
" Syntastic configuration stuff
set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"let g:ale_override_tmpdir = $HOME.'/.vimtmp'
let $TMPDIR = $HOME.'/.vimtmp'
let g:ale_open_list = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" Only run Ale on save, not every time when text changes
let g:ale_lint_on_text_changed = 'never'

" CtrlP stuff
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|Trash|vagrant|vagrant.d|terraform)$'

" HashiVim stuff
let g:terraform_remap_spacebar = 1

" Vim Go stuff
let g:go_auto_type_info = 1
let g:go_auto_sameids = 1

let g:go_fmt_fail_silently = 1
let g:go_fmt_command = "goimports" "Explicited the formater plugin (gofmt, goimports, goreturn...)

" Show a list of interfaces which is implemented by the type under your cursor
au FileType go nmap <Leader>s <Plug>(go-implements)

" Show type info for the word under your cursor
au FileType go nmap <Leader>i <Plug>(go-info)

" Open the relevant Godoc for the word under the cursor
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)

" Open the Godoc in browser
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)

" Run/build/test/coverage
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

" By default syntax-highlighting for Functions, Methods and Structs is disabled.
" Let's enable them!
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1

nmap <F8> :TagbarToggle<CR>
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

let g:tagbar_type_terraform = {
    \ 'ctagstype' : 'terraform',
    \ 'kinds' : [
        \ 'r:Resources',
        \ 'd:Datas',
        \ 'v:Variables',
        \ 'p:Providers',
        \ 'o:Outputs',
        \ 'm:Modules',
        \ 'f:TFVars'
    \ ],
    \ 'sort' : 1
\ }

" Send more characters for redraws
set ttyfast

" Enable mouse use in all modes
set mouse=a

" Make backspace behave the way it does in other apps
set backspace=2

if has('mouse_sgr')
  set ttymouse=sgr
else
  set ttymouse=xterm2
endif

syntax enable
set background=dark
set tabstop=2
set shiftwidth=2
set expandtab
set number
set relativenumber
set ruler
set cursorline
set laststatus=2
set showtabline=2
set noshowmode
set guioptions=
set shellcmdflag=-lc


" Use the OSX clipboard (does not work on Vim 7.3 on OSX)
" If you want this to work, install vim from Homebrew (brew install vim),
" and make sure your 'homebrew vim' precedes the 'system vim' in your PATH
set clipboard=unnamed

set guifont=Inconsolata\ for\ Powerline:h14
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\

" Set term if we're not running in GUI mode
if !has('gui_running')
  set term=xterm-256color
endif

set termencoding=utf-8
let g:solarized_termtrans = 1
silent! colorscheme solarized
highlight CursorLineNr cterm=none ctermfg=2 guifg=yellow

" Correct syntax highlighting for Markdown
augroup markdown
  au!
  au BufRead,BufNewFile *.md set filetype=markdown
augroup END

" Correct syntax highlighting for Vagrantfile
augroup vagrant
  au!
  au BufRead,BufNewFile Vagrantfile set filetype=ruby
augroup END

augroup ctmpl
  au!
  au BufRead,BufNewFile *.ctmpl set filetype=gotmpl
augroup END

" Give a shortcut key to NERD Tree
nnoremap <C-\> :NERDTreeToggle<CR>
nnoremap <C-p> :CtrlP<CR>
nnoremap <C-o> :CtrlPBuffer<CR>
nnoremap <C-e> :e#<CR>
nnoremap <C-j> :bnext<CR>
nnoremap <C-k> :bprev<CR>
nnoremap <C-i> :IndentLinesToggle<CR>
nnoremap <C-S-b> :Bd<CR>
