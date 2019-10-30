""""""""""""
" VIM PLUG "
""""""""""""
if empty(glob('~/.vim/autoload/plug.vim'))
      silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
      autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
    Plug 'autozimu/LanguageClient-neovim', {
        \ 'branch': 'next',
        \ 'do': 'bash install.sh',
        \ }

    Plug 'racer-rust/vim-racer'
    "
    "Assuming you're using vim-plug: https://github.com/junegunn/vim-plug
    Plug 'ncm2/ncm2'
    Plug 'roxma/nvim-yarp'

    " enable ncm2 for all buffers
    autocmd BufEnter * call ncm2#enable_for_buffer()

    " IMPORTANT: :help Ncm2PopupOpen for more information
    set completeopt=noinsert,menuone,noselect

    " NOTE: you need to install completion sources to get completions. Check
    " our wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki
    Plug 'ncm2/ncm2-bufword'
    Plug 'ncm2/ncm2-path'
    " (Optional) Multi-entry selection UI.
    Plug 'junegunn/fzf'
    "Plug 'SirVer/ultisnips'
    "Plug 'honza/vim-snippets'
    "Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'scrooloose/nerdcommenter'
    Plug 'ryanoasis/vim-devicons'
    "Plug 'dylanaraps/wal'

call plug#end()
"For wal, probably not neccessary
"colorscheme wal
" Open files in vertical horizontal split
nnoremap <silent> <C-h> :call fzf#run({
    \   'right': winwidth('.') / 2,
    \   'sink':  'horizontal botright split',
    \   'height': '40%'})<CR>
nnoremap <silent> <C-v> :call fzf#run({
    \   'right': winwidth('.') / 2,
    \   'sink':  'vertical botright split',
    \   'height': '40%'})<CR>
nnoremap <silent> <C-p> :FZF <CR>
"nnoremap <silent> <C-p> :FZF <CR>
    "\   'right': winwidth('.') / 2,
    "\   'sink':  'vertical botright split',
    "\   'height': '40%'})<CR>
"nnoremap <C-p> :Files<Cr>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" For NCM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" a list of relative paths for compile_commands.json
let g:ncm2_pyclang#database_path = ['compile_commands.json']
    " suppress the annoying 'match x of y', 'The only match' and 'Pattern not
    " found' messages
    set shortmess+=c

    " CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
    inoremap <c-c> <ESC>

    " When the <Enter> key is pressed while the popup menu is visible, it only
    " hides the menu. Use this mapping to close the menu and also start a new
    " line.
    inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

    " Use <TAB> to select the popup menu:
    inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
    inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" For Nerdcommenter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin on
" Add spaces after comment delimiters by default
"let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" For dein.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:deoplete#enable_at_startup = 1
"call dein#add('Shougo/deoplete.nvim')
"if !has('nvim')
"  call dein#add('roxma/nvim-yarp')
"  call dein#add('roxma/vim-hug-neovim-rpc')
"endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SETS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on

"Convert tabs to spaces
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
" Search details
set incsearch
set hlsearch
" Do no wrap searching
set nowrapscan
" To aid the colorscheme...
set t_Co=256
" Create line numbers on the left side of vi, 6 digits worth
set number
set numberwidth=6
" Set text wrapping at 80 columns
set tw=80
" Indent to the tab positiion when  you cross over the 80 line limit.
set smartindent
" Leave a couple of lines at the top and bottom when scrolling
set scrolloff=2
" Give context on where you are in the file
set ruler
" wrapping is a problem more often than not.
set nowrap


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MAPPING
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Make 'Q' not annoyingly enter into ex edit mode!
"nnoremap Q <nop>
"nnoremap K <nop>

" Always show a ctags list
"nnoremap <C-]> g<C-]>

" Window splitting (vertical and horizontal)
"nnoremap <C-v> :vsp<CR>
"nnoremap <C-h> :sp<CR>
" Auto completion
"imap <tab> <C-p>
"if executable('ag')
    " Use ag over grep
    "set gepprg=ag\ --color \ -n \ -B 5 \ -A 5

    " Use af in CtrlP for listing files. Lightning fast and respects .gitignore
    "let g:ctrlp_user_command = 'ag %s -l --color -g ""'

    " ag is fast enough that we don't need to cache
    "let g"ctrlp_use_caching = 0
"endif

"let g:ycm_global_ycm_extra_conf = "~/Projects/workRequest/bugfixes/release/.ycm_extra_conf.py"

" bind \ to grep short cut
"command -nargs=+ -complete=file -bar Ag silent! <args>|cwindow|redraw!
"nnoremap \ :Ag<SPACE>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" DOXYGEN
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <F5> O/A*74.A//**oi *Brief.Detailed.@returnsA*76.A/6kb
map <F6> O/**/O
map <F7> A /**<  */hhi


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" UNDO
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('persistent_undo')
    set undodir=$HOME/.vim/undodir
    set undofile
    set undolevels=1000
    set undoreload=10000
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" AUTOCOMPLETE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('wildmenu')
"    set wildmode=list:longest,full
    set wildignore+=*.a,*.o,*.orig,*~
    set wildmenu
    set wildmode=longest,list
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MOUSE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Allow the mouse to be used for selecting
" :set mouse=""     Disable all mouse behaviour.
" :set mouse=a      Enable all mouse behaviour (the default).
" :set mouse+=v     Enable visual mode (v)
" :set mouse-=c     Disable mouse in command mode.


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COLORS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
highlight Folded       ctermfg=7   ctermbg=8
highlight FoldColumn   ctermfg=7   ctermbg=8
highlight Search       ctermfg=16  ctermbg=11
highlight VertSplit    ctermfg=8   ctermbg=0
highlight StatusLine   ctermfg=8   ctermbg=2
highlight StatusLineNC ctermfg=8   ctermbg=60
highlight LineNr       ctermfg=60
highlight Comment      ctermfg=60
highlight Number       ctermfg=202
highlight Search       ctermfg=15  ctermbg=12
highlight Todo         ctermfg=15  ctermbg=11


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SYNTAX HIGHLIGHTING
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"autocmd BufRead,BufNewFile *.c,*.h,*.cpp syntax match pointer /\*[a-z,A-Z,0-9]*++/
"autocmd BufRead,BufNewFile *.c,*.h,*.cpp highlight pointer term = NONE ctermfg=Yellow
"autocmd BufRead,BufNewFile *.c,*.h,*.cpp syntax match privCtx /privCtx/
"autocmd BufRead,BufNewFile *.c,*.h,*.cpp highlight privCtx term = NONE ctermfg=Yellow
"autocmd BufRead,BufNewFile *.c,*.h,*.cpp syntax match annotate
"\ /\/\*\* [\:A-Za-z0-9 \n\r\*\\\/]* \*\*\//
"autocmd BufRead,BufNewFile *.c,*.h,*.cpp highlight annotate
"\ term=NONE ctermfg=8 ctermbg=2 cterm=bold
"autocmd BufRead,BufNewFile *.c,*.h,*.cpp syntax match wescam /moduleSend\w*/
"autocmd BufRead,BufNewFile *.c,*.h,*.cpp syntax keyword wescam
"\ MSG_Q_ID msgQDelete msgQCreate msgQSend msgQReceive
"\ moduleAddCmdQ moduleRemoveCmdQ moduleAddCmd moduleGetCmd moduleRemoveCmd
"\ moduleAddCmdRespQ moduleRemoveCmdRespQ moduleAddCmdResp moduleAddCmdResp
"\ moduleRemoveCmdResp
"autocmd BufRead,BufNewFile *.c,*.h,*.cpp highlight wescam term=NONE ctermfg=Yellow
"
"autocmd BufRead,BufNewFile *.c,*.h,*.cpp syntax match defining /#\(define\|undef\) \w*/
"autocmd BufRead,BufNewFile *.c,*.h,*.cpp highlight defining term=NONE ctermfg=205
"
""syn match unimportant /moduleLogError(.*\n\=.*\n\=.*);/
"autocmd BufRead,BufNewFile *.c,*.h,*.cpp syntax match unimportant
"\ /moduleLogError([a-zA-Z0-9-+><,\n \*"%.\\/&:?\[\]_\(\)]*);/
"autocmd BufRead,BufNewFile *.c,*.h,*.cpp highlight unimportant term=NONE ctermfg=244
"autocmd BufRead,BufNewFile *.c,*.h,*.cpp syntax match this /this/
"autocmd BufRead,BufNewFile *.c,*.h,*.cpp highlight this term=NONE ctermfg=3
"autocmd BufRead,BufNewFile *.c,*.h,*.cpp syntax match Identifier /\w\+_t\ze\W/
"autocmd BufRead,BufNewFile *.c,*.h,*.cpp syntax match Identifier 'rtems_[a-z_]*\( \|(\)'
"autocmd BufRead,BufNewFile *.c,*.h,*.cpp syntax keyword cSpecial
"\ TRUE FALSE
"\ UNITY UNITY_FLOAT UNITY_SHIFT
"\ UNITY7 UNITY7_FLOAT UNITY7_SHIFT
"\ UNITY23 UNITY23_FLOAT UNITY23_SHIFT
"\ BIT_1 BIT_2 BIT_3 BIT_4 BIT_5 BIT_6 BIT_7 BIT_8
"\ BIT_9 BIT_10 BIT_11 BIT_12 BIT_13 BIT_14 BIT_15
"\ BIT_A BIT_B BIT_C BIT_D BIT_E BIT_F
"\ BIT_16 BIT_17 BIT_18 BIT_19 BIT_20 BIT_21 BIT_22
"\ BIT_23 BIT_24 BIT_25 BIT_26 BIT_27 BIT_28 BIT_29
"\ BIT_30 BIT_31


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" AUTO COMMANDS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("autocmd")
" autocmd BufRead,BufNewFile *.[ch] let fname = expand('<afile>:p:h') . '/types.vim'
" autocmd BufRead,BufNewFile *.[ch] if filereadable(fname)
" autocmd BufRead,BufNewFile *.[ch]   exe 'so ' . fname
" autocmd BufRead,BufNewFile *.[ch] endif

" Remove trailing whitepsaces for each line on save.
" Highlight text that goes past the 80 line limit.
augroup vimrc_autocmds
" autocmd BufReadPre * setlocal foldmethod=syntax
" autocmd BufWinEnter * if &fdm == 'syntax' | setlocal foldmethod=manual | endif
  autocmd BufEnter * highlight OverLength ctermbg=7 ctermfg=0 guibg=#707070
  autocmd BufEnter * match OverLength /\%81v.*/
augroup END

if has("autocmd")
" autocmd BufRead,BufNewFile *.[ch] let fname = expand('<afile>:p:h') . '/types.vim'
" autocmd BufRead,BufNewFile *.[ch] if filereadable(fname)
" autocmd BufRead,BufNewFile *.[ch]   exe 'so ' . fname
" autocmd BufRead,BufNewFile *.[ch] endif
" Remove trailing whitepsaces for each line on save.
  autocmd BufWritePre * :%s/\s\+$//e
endif

augroup cprog
  " Remove all cprog autocommands
  au!

  " For *.c and *.h files set formatting of comments and set C-indenting on.
  " For other files switch it off.
  " Don't change the order, it's important that the line with * comes first.
    autocmd BufRead,BufNewFile *       set formatoptions=tcql nocindent comments&
    autocmd BufRead,BufNewFile *.c,*.h,*.cpp set formatoptions=croql cindent comments=sr:/*,mb:*,el:*/,://
    set cino=:0,(0,c1
  augroup END

  autocmd BufWritePre * :%s/\s\+$//e
endif

" Automatically update the ctags file when a file is written
function! DelTagOfFile(file)
  let fullpath = a:file
  let cwd = getcwd()
  let tagfilename = cwd . "/tags"
  let f = substitute(fullpath, cwd . "/", "", "")
  let f = escape(f, './')
  let cmd = 'sed -i "/' . f . '/d" "' . tagfilename . '"'
  let resp = system(cmd)
endfunction

function! UpdateTags()
  let f = expand("%:p")
  let cwd = getcwd()
  let tagfilename = cwd . "/tags"
  let cmd = 'ctags -a -f ' . tagfilename . ' --c++-kinds=+p --fields=+iaS --extra=+q ' . '"' . f . '"'
  call DelTagOfFile(f)
  let resp = system(cmd)
endfunction
autocmd BufWritePost *.cpp,*.h,*.c call UpdateTags()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LSP Stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'python': ['/usr/local/bin/pyls'],
    \ }
function SetLSPShortcuts()
  nnoremap <leader>ld :call LanguageClient#textDocument_definition()<CR>
  nnoremap <leader>lr :call LanguageClient#textDocument_rename()<CR>
  nnoremap <leader>lf :call LanguageClient#textDocument_formatting()<CR>
  nnoremap <leader>lt :call LanguageClient#textDocument_typeDefinition()<CR>
  nnoremap <leader>lx :call LanguageClient#textDocument_references()<CR>
  nnoremap <leader>la :call LanguageClient_workspace_applyEdit()<CR>
  nnoremap <leader>lc :call LanguageClient#textDocument_completion()<CR>
  nnoremap <leader>lh :call LanguageClient#textDocument_hover()<CR>
  nnoremap <leader>ls :call LanguageClient_textDocument_documentSymbol()<CR>
  nnoremap <leader>lm :call LanguageClient_contextMenu()<CR>
endfunction()

augroup LSP
  autocmd!
  autocmd FileType cpp,c call SetLSPShortcuts()
augroup END

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
"nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> gh :call LanguageClient#textDocument_hover()<CR>
"Hide in-line messages
let g:LanguageClient_useVirtualText = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Custom COMMANDS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <C-c> :y+
nnoremap <C-f> :%s/
nnoremap <C-o> :!
nnoremap <C-j> :!
nnoremap <F7> :! git rev-parse --abbrev-ref HEAD <CR>

set ignorecase
" get the notename
"function! GetNoteName()
"    let s:branch = system('git rev-parse --abbrev-ref HEAD')
"    let s:shortBranch = substitute(s:branch,".*\/rm\/","","")
"    let l:noteName = "~/notes/" . substitute(s:shortBranch,"_.*","","") . ".md"
"    execute "vsplit" l:noteName
"endfunction

"nnoremap <C-m> :call GetNoteName()<CR>
" Git Fugitive
"set statusline=%{fugitive#statusline()}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" For Rust Specific Stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hidden
let g:racer_cmd = "/home/reggiemarr/.cargo/bin/racer"

let g:racer_experimental_completer = 1

au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Not yet used
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"got from https://alex.dzyoba.com/blog/vim-revamp/
" cscope
function! Cscope(option, query)
  let color = '{ x = $1; $1 = ""; z = $3; $3 = ""; printf "\033[34m%s\033[0m:\033[31m%s\033[0m\011\033[37m%s\033[0m\n", x,z,$0; }'
  let opts = {
  \ 'source':  "cscope -dL" . a:option . " " . a:query . " | awk '" . color . "'",
  \ 'options': ['--ansi', '--prompt', '> ',
  \             '--multi', '--bind', 'alt-a:select-all,alt-d:deselect-all',
  \             '--color', 'fg:188,fg+:222,bg+:#3a3a3a,hl+:104'],
  \ 'down': '40%'
  \ }
  function! opts.sink(lines)
    let data = split(a:lines)
    let file = split(data[0], ":")
    execute 'e ' . '+' . file[1] . ' ' . file[0]
  endfunction
  call fzf#run(opts)
endfunction

" Invoke command. 'g' is for call graph, kinda.
"nnoremap <silent> <Leader>g :call Cscope('3', expand('<cword>'))<CR>
