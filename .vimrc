" exec 'so '. g:dropbox .'/vimbundles/pathogen.vim'
" exec "call pathogen#infect('". g:dropbox ."/vimbundles/{}')"

" Vundle
filetype off
exec 'set rtp+=~/.vundle'
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'FelikZ/ctrlp-py-matcher'
Plugin 'PeterRincker/vim-argumentative'
Plugin 'Shougo/neocomplete'
Plugin 'avakhov/vim-yaml'
Plugin 'bps/vim-textobj-python'
Plugin 'chrisbra/NrrwRgn'
Plugin 'chrisbra/SudoEdit.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'elzr/vim-json'
Plugin 'eraserhd/parinfer-rust'
Plugin 'ervandew/supertab'
Plugin 'gastonsimone/vim-dokumentary'
Plugin 'godlygeek/tabular'
Plugin 'guns/vim-sexp'
Plugin 'jreybert/vimagit'
Plugin 'kana/vim-textobj-indent'
Plugin 'kana/vim-textobj-user'
Plugin 'kien/ctrlp.vim'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'mattboehm/vim-accordion'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'nanotech/jellybeans.vim'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'sgur/vim-textobj-parameter'
Plugin 'sjl/gundo.vim'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-classpath'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-fireplace'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-projectionist'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-sexp-mappings-for-regular-people'
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'typedclojure/vim-typedclojure'
Plugin 'venantius/vim-cljfmt'
Plugin 'xenomachina/public'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-session'
Plugin 'lxsli/vim-unstack'
Plugin 'lxsli/personal.vim'
call vundle#end()
filetype plugin indent on

syn on
filetype plugin indent on
set nocompatible bs=2
set ts=4 sw=4 et ai nojs
set so=15
set hls is
"set relativenumber number ruler
set number cursorline ruler
hi Search guibg=LightYellow
set vi='100,%,<100,h
set guifont=
"set mouse=a
set lazyredraw
set wildmenu
" exec "set undodir=". g:dropbox ."/vim-undo-dir"
set undofile
colorscheme jellybeans
set termguicolors

" Gresham
"set noet
set visualbell

set fcl=all fdn=2 fml=5
nnoremap <Space> za

augroup lxs
au!

imap jk <ESC>
inoremap j\k jk
nnoremap <BS> %
onoremap <BS> %
vnoremap <BS> %
map M 10j
map L 10k
map '' :update
map 'w :x
map 'q :q
map 'Q :q!
map <C-Q> :qa
map 'e :ls:e<space>
" map 'E :e "
map 'E :e %:h/
map '@ :e!%
map '# :e#
map '~ :e!#
map '. :cd %:h
exec "map 'v :vert botright new ~/.vimrc"
map 'V :exec ":vert botright new $VIMB/_lxs/after/ftplugin/". &ft .".vim"
" if has("win32")
"     map 'V :e ~/_vimrc
" else
"     map 'V :e ~/.vimrc
" endif
exec "map 'z :e ~/.zshrc"
map Z @@
map Q @q
map # .n
map 'l :llist:ll
" Exec current line as an Ex command
nnoremap <F12> 0y$:<C-R>"
nnoremap <expr> <C-n> ":let @/=escape(@".v:register.", '\\/.*$^~[]')<cr>:exec 'norm /'.@/<cr>n"
com! Qa qa
map coH :let @/=""
map X pk"_dd
map 'm :!make

if has("win32")
  map 'x :update \| !del %
  map 'Y :%y *
  vmap Y "*y
  map 'P :%d"*]pggdd
else
  map 'x :update \| !rm %
  map 'Y :%y +
  vmap Y "+y
  map 'P :%d"+]pggdd
endif
"map 'D :%d \| w!
map 'du :diffupdate
map 'dt :diffthis
map 'do :diffoff
map 'dw :call ToggleIWhite()
function! ToggleIWhite() abort
    if stridx(&diffopt, "iwhite") == -1
        set diffopt+=iwhite
    else
        set diffopt-=iwhite
    endif
endf

" vim-unimpaired extensions
map <F8> '':prev
map <F9> '':next
map <S-F8> '':first
map <S-F9> '':last
map 't :tabnew
map 'T :tabc
nnoremap 's :vert botright new
nnoremap 'S :bel new
map [w :wincmd h
map ]w :wincmd l
map [W :wincmd t:2wincmd l:2wincmd h
map ]W :wincmd b
nnoremap [t :tabprev\|diffupdate
nnoremap ]t :tabnext\|diffupdate

function! ToggleClipMode() abort
    if exists('b:ClipMode') && b:ClipMode == 1
        let b:ClipMode = 0
        set relativenumber<
        set number<
    else
        let b:ClipMode = 1
        setl norelativenumber nonumber
    endif
endf
com! ClipMode call ToggleClipMode()
map coC :ClipMode

vnoremap <A-k> :m-2gv=gv
vnoremap <A-j> :m'>+gv=gv

" Escapes for my custom mappings
noremap \<BS> <BS>
noremap \L L
noremap \M M
noremap \ZZ ZZ
noremap \' '
noremap \<C-Q> <C-Q>
noremap \Q Q
noremap \# #
noremap \[ ]
noremap \[ ]
noremap \<C-f> <C-f>

"--- Highlighting

" hi Normal guifg=white guibg=#300024
hi Naughty ctermfg=white guifg=white ctermbg=red guibg=red
hi Good guifg=green ctermfg=green
hi Good2 term=bold guibg=#AAFFAA guifg=black ctermfg=black
hi LineNr ctermfg=5 guifg=Brown
hi CursorLineNr term=bold cterm=bold ctermfg=3 gui=bold guifg=Yellow
hi Search gui=underline guibg=#300024 guifg=#FFFF55
hi ColorColumn ctermbg=black guibg=black
au CursorMoved * hi clear CursorLine

" au Syntax * syn match Naughty /\s\+$/ containedin=ALL
" au Syntax * syn match Naughty /^\s*\t/ containedin=ALL

"--- Plugin config

let g:mapleader="'"

setlocal omnifunc=htmlcomplete#CompleteTags
nmap  a
inoremap  </

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound

"syntastic
"com! SyntasticPythonLoose let g:syntastic_python_checkers=['python']
let g:syntastic_python_checkers=['python', 'flake8']
let g:syntastic_java_checkers=[]

" vim-session
let g:session_autoload = 'no'
let g:session_autosave = 'no'
let g:session_verbose_messages = 0

" vim-commenter
nmap '<space> gcc
xmap '<space> gc

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
map '/ :NERDTreeToggle<CR>
let g:NERDTreeQuitOnOpen = 1

au BufEnter Jenkinsfile set ft=groovy

" let g:ConqueTerm_CWInsert = 1
let g:ConqueTerm_SessionSupport = 1

" ctags
set tags=~/.tags

" ctrlp
map '; :CtrlPMixed
map ': :CtrlP
set wildignore+=*.so,*.exe,*.swp,*.zip,*.pyc
set wildignore+=*/tmp/*    " MacOSX/Linux
set wildignore+=*\\tmp\\*  " Windows
let g:ctrlp_mruf_exclude = '/tmp/.*\|/temp/.*' " MacOSX/Linux
"let g:ctrlp_mruf_exclude = '^C:\\dev\\tmp\\.*' " Windows
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
let g:ctrlp_use_caching = 0

"unstack
map ys* :UnstackFromSelection<CR>
map ys+ :UnstackFromClipboard<CR>

"accordion
let g:accordion_size=3
map 'ar :AccordionZoomIn
map 'am :AccordionZoomOut

"gundo
nnoremap U :GundoToggle<CR>

"splitjoin
let g:splitjoin_split_mapping="'j"
let g:splitjoin_join_mapping="'k"

" jedi-vim
"let g:jedi#use_tabs_not_buffers = 0
"let g:jedi#use_splits_not_buffers = "right"
let g:jedi#popup_on_dot = 0
"let g:jedi#completions_enabled = 0

" YCM
let g:ycm_autoclose_preview_window_after_completion=1
nnoremap <leader>d :YcmCompleter GoToDefinitionElseDeclaration<CR>

" vim-better-whitespace
au BufEnter * EnableStripWhitespaceOnSave
" let g:better_whitespace_filetypes_blacklist=['diff', 'gitcommit', 'unite', 'qf', 'help', 'markdown']


"--- Fancy stuff

ab (box) ☐
ab (tick) ✓
ab (cross) ✕
ab (heart) ♥
ab (star) ★
ab (zap) ⚡
ab (note) ♪
ab (notes) ♫
ab (sharp) ♯
ab (euro) €
ab (yen) ¥
ab (fn) ƒ
ab (section) §
ab (...) …
ab (c) ©
ab (r) ®
ab (tm) ™
ab (+-) ±
ab (^2) ²
ab (^3) ³

" map 'J i<CR><ESC>%a<CR><ESC>k:.!sed "s/'/\"/g; s/None/null/g" \| jq .<CR>

if has("gui_running")
  set lines=999
  set columns=84
endif

com! ConqueTermReload exec "ConqueTerm ". strpart(bufname(""), 0, strlen(bufname("")) - 4)

function! MaxWin() abort
    "winpos -4 -4
    set lines=60 columns=100
endf

:command! -nargs=1 -range=1 Translate <line1>,<line2>call s:Translate(<f-args>)

function! s:Translate(repl_arg) range abort
  let sep = a:repl_arg[0]
  let fields = split(a:repl_arg, sep)
  let cmd = a:firstline . ',' . a:lastline
      \. 'call setline(".", tr(getline("."), '.string(fields[0]).','.string(fields[1]).'))'
  exe cmd
endfunction

" Syntastic Python
function! Py2()
    let g:syntastic_python_python_exec = '/usr/local/bin/python2.7'
endfunction
function! Py3()
    let g:syntastic_python_python_exec = '/usr/local/bin/python3.6'
endfunction
call Py3()

" Syntastic RST
let s:rst_accepted_dir_type =
            \ '\(' .
            \ 'seealso\|todo\|toctree\|' .
            \ 'literalinclude\|' .
            \ 'auto.*' .
            \ '\)'
let s:rst_accepted_text_role = '\(ref\|command\|file\|py:[a-z]*\|meth\|class\|func\)'
let s:rst_def_substitution = '\(version\|today\)'
let g:syntastic_rst_rst2pseudoxml_quiet_messages = {
            \ "regex":
            \ '\(' .
            \ 'Unknown directive type "' . s:rst_accepted_dir_type . '"\|' .
            \ 'Unknown interpreted text role "' . s:rst_accepted_text_role . '"\|' .
            \ 'Undefined substitution referenced: "' . s:rst_def_substitution . '"' .
            \ '\)',
            \ }

function! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc
com! DeleteTrailingWS call DeleteTrailingWS()
autocmd BufWrite *.py :call DeleteTrailingWS()

autocmd BufRead *.graphqls set ts=2 sw=2

" inoremap qp m`gwap``a
" inoremap qs m`gwas``a

" Fireplace
nnoremap cpe :%Eval

" Nrrw
let g:nrrw_topbot_leftright = 'botright'

" ADoc
function! NRAdoc()
    exe "normal ?^----$k0f,lyejjVNk:NR"
    exe "set ft=". @"
endfunc
com! NRAdoc call NRAdoc()

com! Clj set ft=clojure

augroup END
" vi:set ft=vim ts=4 sw=4 expandtab:
