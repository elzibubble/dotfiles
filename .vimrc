scriptencoding utf-8
let g:dotbase='~'

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd lxs VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')
Plug 'AndrewRadev/splitjoin.vim'
Plug 'FelikZ/ctrlp-py-matcher'
" Plug 'Olical/conjure', { 'tag': 'v0.22.0', 'do': 'bin/compile'  }
Plug 'PeterRincker/vim-argumentative'
Plug 'avakhov/vim-yaml'
Plug 'bps/vim-textobj-python'
Plug 'chiel92/vim-autoformat'
Plug 'chrisbra/NrrwRgn'
Plug 'chrisbra/SudoEdit.vim'
Plug 'christianrondeau/vim-base64'
" Plug 'christoomey/vim-tmux-navigator'
" Plug 'clojure-vim/acid.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'clojure-vim/vim-jack-in'
Plug 'elzr/vim-json'
Plug 'eraserhd/parinfer-rust', {'do': 'cargo build --release'}
Plug 'ervandew/supertab'
" Plug 'gastonsimone/vim-dokumentary'
Plug 'godlygeek/tabular'
Plug 'guns/vim-sexp'
Plug 'habamax/vim-asciidoctor'
Plug 'jceb/vim-textobj-uri'
Plug 'jeanCarloMachado/vim-toop'
Plug 'jparise/vim-graphql'
" Plug 'jreybert/vimagit'
" Plug 'junegunn/fzf', {'do': './install --all'}
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-user'
Plug 'kburdett/vim-nuuid'
Plug 'kien/ctrlp.vim'
" Plug 'kien/rainbow_parentheses.vim'
Plug 'kshenoy/vim-signature'
Plug 'mattboehm/vim-accordion'
Plug 'michaeljsmith/vim-indent-object'
Plug 'nanotech/jellybeans.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ntpeters/vim-better-whitespace'
Plug 'radenling/vim-dispatch-neovim'
Plug 'scrooloose/nerdtree'
" Plug 'scrooloose/syntastic'
Plug 'sgur/vim-textobj-parameter'
Plug 'sjl/gundo.vim'
Plug 'tpope/vim-abolish'
" Plug 'tpope/vim-classpath'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-repeat'
" Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
" Plug 'typedclojure/vim-typedclojure'
" Plug 'venantius/vim-cljfmt'
Plug 'vim-scripts/Tabmerge'
Plug 'xenomachina/public', {'rtp': 'vim/'}
Plug 'xolox/vim-misc' " prereq for xolox/vim-session
Plug 'xolox/vim-session'
Plug 'lxsli/vim-unimpaired'
" Plug 'lxsli/vim-unstack'
Plug 'lxsli/ftplugins'
call plug#end()

syn on
set bs=2
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
exec 'set undodir='. g:dotbase .'/.vim/undo'
set undofile
" let loaded_matchparen = 1
" set termguicolors
let g:python_host_prog = $HOME .'/pyve2.7/bin/python2'
let g:python3_host_prog = $HOME .'/pyve/bin/python3'
set grepprg=ag
set virtualedit=block

if has('gui_running')
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
function! Save()
  update
  if &diff
    diffupdate
  end
endf

imap jk <ESC>
inoremap j\k jk
nnoremap <BS> %
onoremap <BS> %
vnoremap <BS> %
map M 10j
map L 10k
nmap '' :call Save()<CR>
nmap 'w :x<CR>
nmap 'q :q<CR>
nmap 'Q :q!<CR>
nmap <C-Q> :qa<CR>
nmap 'e :ls<CR>:e<space>
" nmap 'e :CtrlP<CR>
" nmap 'E :e "<CR>
nmap 'E :e %:h/
nmap '@ :e!%<CR>
nmap '# :e#<CR>
nmap '~ :e!#<CR>
nmap '. :cd %:h<CR>
nmap 'v :vert botright new ~/.vimrc<CR>
nmap 'V :exec ':vert botright new $VIMB/ftplugins/after/ftplugin/'. &ft .'.vim'<CR>
" if has('win32')
"     nmap 'V :e ~/_vimrc<CR>
" else
"     nmap 'V :e ~/.vimrc<CR>
" endif
nmap 'z :vert botright new ~/.zshrc<CR>
nmap Z @@
nmap Q @q
nmap # .n
nmap 'l :llist<CR>:ll
nnoremap <expr> <C-n> ":let @/=escape(@". v:register .", '\\/.*$^~[]')<cr>:exec 'norm /'.@/<cr>n"
com! Qa qa
nmap 'm :!make<CR>
nnoremap gx :normal mxviugx<Esc>`x
nmap <TAB> >>
vmap <TAB> >
nmap <S-TAB> <<
vmap <S-TAB> <
vmap X "_dP
nmap X VX
map <M-y> "yy
map <M-S-y> "yY
map <M-p> "yp
map <M-S-p> "yP
nmap <M-x> V"yp
tnoremap <esc><esc> <c-\><c-n>
nmap 'A 's'#:A<CR>

function! <SID>SourcePart(line1, line2)
   let tmp = @z
   silent exec a:line1.','.a:line2.'yank z'
   let @z = substitute(@z, '\n\s*\\', '', 'g')
   @z
   let @z = tmp
endfunction
" if some argument is given, this command calls built-in command :source with
" given arguments; otherwise calls function <SID>SourcePart() which sources
" visually selected lines of the buffer.
command! -nargs=? -bar -range Source if empty('<args>') | call <SID>SourcePart(<line1>, <line2>) | else | exec 'so <args>' | endif
map <F12> :Source<CR>

if has('win32')
  nmap 'x :update \| !del %<CR>
  nmap 'Y :%y *<CR>
  vmap Y "*y
  nmap 'P :%d<CR>"*]pggdd
else
  nmap 'x :update \| !rm %<CR>
  nmap 'Y :%y +<CR>
  vmap Y "+y
  nmap 'P :%d<CR>"+]pggdd
endif
"nmap 'D :%d \| w!<CR>
" Gdiffsplit!
nmap 'dd :vert Gdiffsplit! HEAD~1<CR>
nmap 'ds :vert Gdiffsplit! HEAD<CR>
nmap 'du :diffupdate<CR>
nmap 'dt :diffthis<CR>
nmap 'do :diffoff<CR>
nmap 'dw :call ToggleIWhite()<CR>
function! ToggleIWhite() abort
    if stridx(&diffopt, 'iwhite') == -1
        set diffopt+=iwhite
    else
        set diffopt-=iwhite
    endif
endf

" vim-unimpaired
" replacements
" nmap yoi :set ignorecase!<CR>
" nmap yoh :set hls!<CR>
" nmap [a :prev<CR>
" nmap ]a :next<CR>
" nmap [A :first<CR>
" nmap ]A :last<CR>
" nmap [<Space> :<C-U>put!=repeat(nr2char(10), v:count)<CR>
" nmap ]<Space> :<C-U>put =repeat(nr2char(10), v:count)<CR>

" extensions
nmap yoH :let @/=""<CR>
nnoremap 's :vert botright new<CR>
nnoremap 'S :bel new<CR>
nmap 't :tabnew<CR>
nmap 'T :tabc<CR>
nmap '<C-T> :tabc!<CR>
" nmap [t <Plug>unimpairedTPrevious:diffupdate<CR>
" nmap ]t <Plug>unimpairedTNext:diffupdate<CR>
nnoremap [t :tabprev\|diffupdate<CR>
nnoremap ]t :tabnext\|diffupdate<CR>
nnoremap [T :tabfirst\|diffupdate<CR>
nnoremap ]T :tablast\|diffupdate<CR>
nmap <F8> '':prev<CR>
nmap <F9> '':next<CR>
nmap <S-F8> '':first<CR>
nmap <S-F9> '':last<CR>
nmap [w :wincmd h<CR>
nmap ]w :wincmd l<CR>
nmap [W :99wincmd h<CR>
nmap ]W :99wincmd l<CR>
nmap <C-w>` :wincmd w \| wincmd _<CR>
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
nmap yoC :ClipMode<CR>

vnoremap <A-k> :m-2<CR>gv=gv
vnoremap <A-j> :m'>+<CR>gv=gv

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
" au VimEnter * RainbowParenthesesActivate
" au Syntax * RainbowParenthesesLoadRound
" au Syntax * RainbowParenthesesLoadSquare
" au Syntax * RainbowParenthesesLoadBraces
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16

" autoformat
let g:autoformat_autoindent = 0
let g:formatdef_cljfmt = '"cljfmt"'
let g:formatters_clojure = ['cljfmt']

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

autocmd bufenter * if (winnr('$') == 1 && exists('b:NERDTreeType') && b:NERDTreeType == 'primary') | q | endif
nmap '/ :NERDTreeToggle<CR>
let g:NERDTreeQuitOnOpen = 1

" Filetypes
au BufEnter Jenkinsfile set ft=groovy
au BufEnter *.bb set ft=clojure

" let g:ConqueTerm_CWInsert = 1
" let g:ConqueTerm_SessionSupport = 1
" com! ConqueTermReload exec 'ConqueTerm '. strpart(bufname(''), 0, strlen(bufname('')) - 4)

" ctags
set tags=~/.tags

" ctrlp
" nmap '; :CtrlPMixed<CR>
nmap '; :CtrlPBuffer<CR>
nmap ': :CtrlPMRU<CR>
" nmap '; :FZF<CR>
set wildignore+=*.so,*.exe,*.swp,*.zip,*.pyc
set wildignore+=*/tmp/*    " MacOSX/Linux
set wildignore+=*\\tmp\\*  " Windows
let g:ctrlp_mruf_exclude = '/tmp/.*\|/temp/.*' " MacOSX/Linux
" let g:ctrlp_mruf_exclude = '^C:\\dev\\tmp\\.*' " Windows
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
let g:ctrlp_use_caching = 0
let g:ctrlp_switch_buffer = 'Et'

"unstack
nmap ys* :UnstackFromSelection<CR>
nmap ys+ :UnstackFromClipboard<CR>

"accordion
au VimEnter * let g:accordion_size=max([2, &columns/100])
au VimResized * let g:accordion_size=max([2, &columns/100])
nmap 'ar :AccordionZoomIn<CR>
nmap 'am :AccordionZoomOut<CR>

"gundo
nnoremap U :GundoToggle<CR>

"splitjoin
let g:splitjoin_split_mapping="'j"
let g:splitjoin_join_mapping="'k"

" jedi-vim
"let g:jedi#use_tabs_not_buffers = 0
"let g:jedi#use_splits_not_buffers = 'right'
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
      \. 'call setline('.', tr(getline('.'), '.string(fields[0]).','.string(fields[1]).'))'
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
            \ 'regex':
            \ '\(' .
            \ 'Unknown directive type "' . s:rst_accepted_dir_type . '"\|' .
            \ 'Unknown interpreted text role "' . s:rst_accepted_text_role . '"\|' .
            \ 'Undefined substitution referenced: "' . s:rst_def_substitution . '"' .
            \ '\)',
            \ }

" function! DeleteTrailingWS()
"     exe 'normal mz'
"     %s/\s\+$//ge
"     exe 'normal `z'
" endfunc
" com! DeleteTrailingWS call DeleteTrailingWS()
" autocmd BufWrite *.py :call DeleteTrailingWS()

autocmd BufRead *.graphqls set ts=2 sw=2

function! RangeTest(count)
  exe 'echo '. a:count
endfunc
nmap '` :<C-U>call RangeTest(v:count)<CR>

inoremap qp <C-O>gwap
inoremap qs <C-O>gwas

" Fireplace
nnoremap cpe :%Eval<CR>

" Conjure
let g:conjure_log_auto_open = ["eval", "ret", "ret-multiline", "out", "err", "tap", "doc", "load-file", "test"]
let g:conjure_log_auto_open = ["ret-multiline", "out", "err", "tap", "doc", "test"]
let g:conjure_log_direction = "horizontal"
let g:conjure_log_size_small = 15
let g:conjure_log_size_large = 25

" Nrrw
let g:nrrw_topbot_leftright = 'botright'

" ADoc
function! NRAdoc()
    exe 'normal ?^----$k0f,lyejjVNk:NR'
    exe 'set ft='. @"
endfunc
com! NRAdoc call NRAdoc()

" Supertab
let g:SuperTabMappingForward = '<s-tab>'
let g:SuperTabMappingBackward = '<tab>'

com! Clj set ft=clojure

function! SpaceOut(str)
  return substitute(a:str, '.', ' ', 'g')
endfunction
call toop#mapFunction('SpaceOut', 'c<space>')
nmap c<space><space> c<space>aW

function! ProfileStart()
  profile start profile.log
  profile func *
  profile file *
endfunc
function! ProfileStop()
  profile stop
endfunc
com! ProfileStart call ProfileStart()
com! ProfileStop call ProfileStop()

" base64
vnoremap <silent> <leader>ba :<c-u>call base64#v_atob()<cr>
vnoremap <silent> <leader>ab :<c-u>call base64#v_btoa()<cr>
" map <space><space> vi"'ba<esc>

" dispatch
let g:dispatch_no_maps=1

" vim-commentary
autocmd FileType tf setlocal commentstring=#\ %s

" asciidoctor
let g:asciidoctor_extensions = ['asciidoctor-diagram']
let g:asciidoctor_pdf_extensions = ['asciidoctor-diagram']
" let g:asciidoctor_pdf_themes_path = '~/docs/AsciiDocThemes'
" let g:asciidoctor_pdf_fonts_path = '~/docs/AsciiDocThemes/fonts'
let g:asciidoctor_folding = 1
fun! AsciidoctorMappings()
	nnoremap <buffer> <leader>oo :AsciidoctorOpenRAW<CR>
	nnoremap <buffer> <leader>op :AsciidoctorOpenPDF<CR>
	nnoremap <buffer> <leader>oh :AsciidoctorOpenHTML<CR>
	nnoremap <buffer> <leader>ox :AsciidoctorOpenDOCX<CR>
  nnoremap <buffer> <leader>ch :Asciidoctor2HTML<CR>
	nnoremap <buffer> <leader>cp :Asciidoctor2PDF<CR>
	nnoremap <buffer> <leader>cx :Asciidoctor2DOCX<CR>
endfun

augroup asciidoctor
	au!
	au BufEnter *.adoc,*.asciidoc call AsciidoctorMappings()
augroup END

" basename for file completion
cnoremap <C-t> <C-\>e(<SID>RemoveLastPathComponent())<CR>
function! s:RemoveLastPathComponent()
  return substitute(getcmdline(), '\%(\\ \|[\\/]\@!\f\)\+[\\/]\=$\|.$', '', '')
endfunction

colorscheme jellybeans
" vi:set ft=vim ts=2 sw=2 expandtab:
