let g:dotbase="~"

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')
Plug 'AndrewRadev/splitjoin.vim'
Plug 'FelikZ/ctrlp-py-matcher'
Plug 'PeterRincker/vim-argumentative'
Plug 'avakhov/vim-yaml'
Plug 'bps/vim-textobj-python'
Plug 'chiel92/vim-autoformat'
Plug 'chrisbra/NrrwRgn'
Plug 'chrisbra/SudoEdit.vim'
Plug 'christianrondeau/vim-base64'
" Plug 'christoomey/vim-tmux-navigator'
" Plug 'clojure-vim/acid.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'elzr/vim-json'
Plug 'eraserhd/parinfer-rust', {'do': 'cargo build --release'}
Plug 'ervandew/supertab'
" Plug 'gastonsimone/vim-dokumentary'
Plug 'godlygeek/tabular'
Plug 'guns/vim-sexp'
Plug 'jceb/vim-textobj-uri'
Plug 'jreybert/vimagit'
" Plug 'junegunn/fzf', {'do': './install --all'}
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-user'
Plug 'kburdett/vim-nuuid'
Plug 'kien/ctrlp.vim'
Plug 'kien/rainbow_parentheses.vim'
Plug 'mattboehm/vim-accordion'
Plug 'michaeljsmith/vim-indent-object'
Plug 'nanotech/jellybeans.vim'
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}
Plug 'ntpeters/vim-better-whitespace'
Plug 'scrooloose/nerdtree'
" Plug 'scrooloose/syntastic'
Plug 'sgur/vim-textobj-parameter'
Plug 'sjl/gundo.vim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-classpath'
Plug 'tpope/vim-commentary'
" Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-repeat'
" Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
" Plug 'typedclojure/vim-typedclojure'
" Plug 'venantius/vim-cljfmt'
Plug 'xenomachina/public', {'rtp': 'vim/'}
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
Plug 'lxsli/vim-unimpaired'
" Plug 'lxsli/vim-unstack'
Plug 'lxsli/ftplugins'
call plug#end()

syn on
set nocompatible bs=2
set ts=2 sw=2 et ai nojs
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
exec "set undodir=". g:dotbase ."/.vim/undo"
set undofile
colorscheme jellybeans
" set termguicolors
let g:python_host_prog = $HOME .'/pyve2.7/bin/python2'
let g:python3_host_prog = $HOME .'/pyve/bin/python3'
set grepprg=ag

if has("gui_running")
  set lines=999
  set columns=84
endif

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
nmap '' :update:diffupdate
nmap 'w :x
nmap 'q :q
nmap 'Q :q!
nmap <C-Q> :qa
nmap 'e :ls:e<space>
" nmap 'E :e "
nmap 'E :e %:h/
nmap '@ :e!%
nmap '# :e#
nmap '~ :e!#
nmap '. :cd %:h
exec "nmap 'v :vert botright new ~/.vimrc"
nmap 'V :exec ":vert botright new $VIMB/ftplugins/after/ftplugin/". &ft .".vim"<CR>
" if has("win32")
"     nmap 'V :e ~/_vimrc
" else
"     nmap 'V :e ~/.vimrc
" endif
exec "nmap 'z :e ~/.zshrc"
nmap Z @@
nmap Q @q
nmap # .n
nmap 'l :llist:ll
" Exec current line as an Ex command
nnoremap <F12> 0y$:<C-R>"
nnoremap <expr> <C-n> ":let @/=escape(@".v:register.", '\\/.*$^~[]')<cr>:exec 'norm /'.@/<cr>n"
com! Qa qa
nmap 'm :!make
nnoremap gx :normal mxviugx<Esc>`x
nmap <TAB> >>
vmap <TAB> >
nmap <S-TAB> <<
vmap <S-TAB> <
vmap X "_dP
nmap X VX
map <M-y> "ay
map <M-S-y> "aY
map <M-p> "ap
map <M-S-p> "aP

if has("win32")
  nmap 'x :update \| !del %
  nmap 'Y :%y *
  vmap Y "*y
  nmap 'P :%d"*]pggdd
else
  nmap 'x :update \| !rm %
  nmap 'Y :%y +
  vmap Y "+y
  nmap 'P :%d"+]pggdd
endif
"nmap 'D :%d \| w!
nmap 'du :diffupdate
nmap 'dt :diffthis
nmap 'do :diffoff
nmap 'dw :call ToggleIWhite()
function! ToggleIWhite() abort
    if stridx(&diffopt, "iwhite") == -1
        set diffopt+=iwhite
    else
        set diffopt-=iwhite
    endif
endf

" vim-unimpaired
" replacements
" nmap yoi :set ignorecase!<CR>
" nmap yoh :set hls!<CR>
" nmap [a :prev
" nmap ]a :next
" nmap [A :first
" nmap ]A :last
" nmap [<Space> :<C-U>put!=repeat(nr2char(10), v:count)<CR>
" nmap ]<Space> :<C-U>put =repeat(nr2char(10), v:count)<CR>

" extensions
nmap yoH :let @/=""
nnoremap 's :vert botright new
nnoremap 'S :bel new
nmap 't :tabnew
nmap 'T :tabc
" nnoremap [t :tabprev
" nnoremap ]t :tabnext
" nnoremap [T :tabfirst
" nnoremap ]T :tablast
nmap <F8> '':prev
nmap <F9> '':next
nmap <S-F8> '':first
nmap <S-F9> '':last
nmap [w :wincmd h<CR>
nmap ]w :wincmd l<CR>
nmap [W :99wincmd h<CR>
nmap ]W :99wincmd l<CR>
" end unimpaired

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
nmap yoC :ClipMode

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
" hi LineNr ctermfg=5 guifg=Brown
" hi CursorLineNr term=bold cterm=bold ctermfg=3 gui=bold guifg=Yellow
hi Search gui=underline guibg=#300024 guifg=#FFFF55
" hi ColorColumn ctermbg=black guibg=black
" au CursorMoved * hi clear CursorLine

" au Syntax * syn match Naughty /\s\+$/ containedin=ALL
" au Syntax * syn match Naughty /^\s*\t/ containedin=ALL

"--- Plugin config

let g:mapleader="'"

setlocal omnifunc=htmlcomplete#CompleteTags
nmap  a
inoremap  </

" RainbowParen config
au VimEnter * RainbowParenthesesActivate
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
let g:rbpt_colorpairs = [
      \ [118, 118],
      \ ['yellow', 'yellow'],
      \ ['cyan', 'cyan'],
      \ ['red', 'firebrick1'],
      \ ]

" autoformat
let g:autoformat_autoindent = 0
let g:formatdef_cljfmt = '"cljfmt"'
let g:formatters_clojure = ['cljfmt']
au BufWrite * :Autoformat

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
nmap '/ :NERDTreeToggle<CR>
let g:NERDTreeQuitOnOpen = 1

au BufEnter Jenkinsfile set ft=groovy

" let g:ConqueTerm_CWInsert = 1
" let g:ConqueTerm_SessionSupport = 1
" com! ConqueTermReload exec "ConqueTerm ". strpart(bufname(""), 0, strlen(bufname("")) - 4)

" ctags
set tags=~/.tags

" ctrlp
nmap '; :CtrlPMixed
nmap ': :CtrlP
" nmap '; :FZF<CR>
set wildignore+=*.so,*.exe,*.swp,*.zip,*.pyc
set wildignore+=*/tmp/*    " MacOSX/Linux
set wildignore+=*\\tmp\\*  " Windows
let g:ctrlp_mruf_exclude = '/tmp/.*\|/temp/.*' " MacOSX/Linux
"let g:ctrlp_mruf_exclude = '^C:\\dev\\tmp\\.*' " Windows
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
let g:ctrlp_use_caching = 0

"unstack
nmap ys* :UnstackFromSelection<CR>
nmap ys+ :UnstackFromClipboard<CR>

"accordion
au VimEnter * let g:accordion_size=max([2, &columns/100])
au VimResized * let g:accordion_size=max([2, &columns/100])
nmap 'ar :AccordionZoomIn
nmap 'am :AccordionZoomOut

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
let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0
let g:strip_only_modified_lines=0
" let g:better_whitespace_filetypes_blacklist=['diff', 'gitcommit', 'unite', 'qf', 'help', 'markdown']

" projectionist
nmap 'av :botright AV<CR>


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
ab (pound) £
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

" nmap 'J i<CR><ESC>%a<CR><ESC>k:.!sed "s/'/\"/g; s/None/null/g" \| jq .<CR>

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

" Supertab
let g:SuperTabMappingForward = '<s-tab>'
let g:SuperTabMappingBackward = '<tab>'

com! Clj set ft=clojure


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" snoe

" COC
" let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
" let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <localleader>u <Plug>(coc-references)
nmap <localleader>rn <Plug>(coc-rename)
command! -nargs=0 Format :call CocAction('format')

let g:coc_enable_locationlist = 0
autocmd User CocLocationsChange CocList --normal location

inoremap <silent><expr> <c-space> coc#refresh()
nmap <silent> [l <Plug>(coc-diagnostic-prev)
nmap <silent> ]l <Plug>(coc-diagnostic-next)
nmap <silent> [k :CocPrev<cr>
nmap <silent> ]k :CocNext<cr>
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

function! Expand(exp) abort
    let l:result = expand(a:exp)
    return l:result ==# '' ? '' : "file://" . l:result
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')
vmap <localleader>f <Plug>(coc-format-selected)
nmap <localleader>f <Plug>(coc-format-selected)

nnoremap <silent> crcc :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'cycle-coll', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nnoremap <silent> crth :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'thread-first', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nnoremap <silent> crtt :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'thread-last', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nnoremap <silent> crtf :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'thread-first-all', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nnoremap <silent> crtl :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'thread-last-all', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nnoremap <silent> cruw :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'unwind-thread', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nnoremap <silent> crua :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'unwind-all', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nnoremap <silent> crml :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'move-to-let', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1, input('Binding name: ')]})<CR>
nnoremap <silent> cril :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'introduce-let', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1, input('Binding name: ')]})<CR>
nnoremap <silent> crel :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'expand-let', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nnoremap <silent> cram :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'add-missing-libspec', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nnoremap <silent> crcn :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'clean-ns', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nnoremap <silent> cref :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'extract-function', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1, input('Function name: ')]})<CR>

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
vmap <localleader>a  <Plug>(coc-codeaction-selected)
nmap <localleader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <localleader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <localleader>qf  <Plug>(coc-fix-current)

autocmd BufReadCmd,FileReadCmd,SourceCmd jar:file://* call s:LoadClojureContent(expand("<amatch>"))
 function! s:LoadClojureContent(uri)
  setfiletype clojure
  let content = CocRequest('clojure-lsp', 'clojure/dependencyContents', {'uri': a:uri})
  call setline(1, split(content, "\n"))
  setl nomodified
  setl readonly
endfunction

highlight Normal guibg=#101010 guifg=white
highlight CursorColumn guibg=#202020
highlight Keyword guifg=#FFAB52
highlight CursorLine guibg=#202020

augroup END
" vi:set ft=vim ts=4 sw=4 expandtab:
