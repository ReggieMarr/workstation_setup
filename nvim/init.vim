""""""""""""
" VIM PLUG "
""""""""""""
if empty(glob('~/.vim/autoload/plug.vim'))
      silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
      autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
    Plug 'vim-airline/vim-airline'
    Plug 'neomake/neomake'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'autozimu/LanguageClient-neovim', {
        \ 'branch': 'next',
        \ 'do': 'bash install.sh',
        \ }

    Plug 'racer-rust/vim-racer'
    "
    "Assuming you're using vim-plug: https://github.com/junegunn/vim-plug
    "Used with lsp for static analysis
    Plug 'cespare/vim-toml'
    Plug 'm-pilia/vim-ccls'
    Plug 'ncm2/ncm2'
    Plug 'roxma/nvim-yarp'
    Plug 'CoatiSoftware/vim-sourcetrail'
    " NOTE: you need to install completion sources to get completions. Check
    " our wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki
    Plug 'ncm2/ncm2-bufword'
    Plug 'ncm2/ncm2-path'
    "Plug 'ncm2/ncm2-jedi'
    "Use this to drop type info/snippet support
    Plug 'HansPinckaers/ncm2-jedi'
    "Plug '~/.cargo/bin/sk'
    "Plug 'lotabout/skim.vim'
    " (Optional) Multi-entry selection UI.
    Plug 'junegunn/fzf'
    Plug 'junegunn/fzf.vim'
    Plug 'SirVer/ultisnips'
    Plug 'reggiemarr/vim-picker', {'branch' : 'feature/rm/custom_fuzzy_file_search'}
    Plug 'aklt/plantuml-syntax'
    Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }
    "Plug 'ludovicchabant/vim-gutentags'
    Plug 'tyru/open-browser.vim'
    "An interactive debugger
    Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh \| UpdateRemotePlugins' }
    "This blame would be nice but it makes things sooo slow
    "Plug 'tveskag/nvim-blame-line'
    Plug 'tpope/vim-fugitive'
    "Plug 'weirongxu/plantuml-previewer.vim'
    "This doesn't work, would be great if it did though
    "Plug 'scrooloose/vim-slumlord'
    Plug 'jiangmiao/auto-pairs'
    Plug 'honza/vim-snippets'
    "Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'Shougo/echodoc.vim'
    Plug 'scrooloose/nerdcommenter'
    Plug 'davidhalter/jedi-vim'
    "Needs nerdfonts to work properly
    Plug 'ryanoasis/vim-devicons'
    "Plug 'dylanaraps/wal'
    Plug 'kaicataldo/material.vim'
    "May want to switch to https://github.com/euclio/vim-markdown-composer later
    "Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
    "With markdown viewer junegunn goyo and limelight might also be nice to have
    Plug 'scrooloose/nerdtree'  " file list
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'  "to highlight files in nerdtree
    "This could replace chromatica since it does not do its own analysis it just uses lsp
    Plug 'jackguo380/vim-lsp-cxx-highlight'
    Plug 'arakashic/chromatica.nvim'
    Plug 'majutsushi/tagbar'
    "A fuzzy search alternative to tagbar
    Plug 'liuchengxu/vista.vim'
    Plug 'rust-lang/rust.vim'
    "Plug 'vim-syntastic/syntastic'
    Plug 'w0rp/ale'  " python linters
    Plug 'dhruvasagar/vim-table-mode'
    Plug 'ervandew/supertab'
    "For C# integration
    Plug 'OmniSharp/omnisharp-vim'
    "Debugger with DAP support couldnt get stepping through code or evaluating state to work
    "Plug 'puremourning/vimspector', {'do' : './install_gadget.py --all --disable-tcl'}
call plug#end()
"For wal, probably not neccessary
"colorscheme wal
" Open files in vertical horizontal split
set cmdheight=2
set wrapscan
set noswapfile
set ignorecase
set nobackup
set noshowmode
set noshowcmd
let mapleader=" "
let g:airline_powerline_fonts = 1
let g:webdevicons_enable_airline_statusline = 1
let g:airline_theme = 'material'
set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/
nnoremap <leader>n :execute "vspl" "~/notes/" . strftime('%d_%m_%Y') .".md"<CR>

" Window managing
nmap <unique> <leader>ts :split<bar>terminal<CR>a
nmap <unique> <leader>tv :vsplit<bar>terminal<CR>a
nmap <unique> <leader>te :terminal<CR>a
tnoremap WW <C-\><C-n>
tnoremap QQ <C-\><C-n>:q<CR>


" Always show statusline
set laststatus=2

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256
"let g:airline#extensions#tabline#enabled = 1

"set clipboard=unnamedplus
let g:echodoc#enable_at_startup = 1
"let g:echodoc#type = 'virtual'
let g:echodoc#type = 'floating'
" To use a custom highlight for the float window,
" change Pmenu to your highlight group
highlight link EchoDocFloat Pmenu
" path to your python
let g:python3_host_prog = '/usr/bin/python3'
let g:python_host_prog = '/usr/bin/python2'
" ---------------- Vimscript file settings  {{{
" open a split window to edit the vimrc file:
nnoremap <leader>ev :split $MYVIMRC<cr>
" source the vimrc file. (Run it):
nnoremap <leader>sv :source $MYVIMRC<cr>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" For Understand
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"command! UMenu silent: exe “!understand -existing -contextmenu %:p -line ” line(‘.’) ” -col ” col(‘.’) ” -text <cword> &” | redraw!
"map <C-u> :UMenu<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" For vim vista
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

set statusline+=%{NearestMethodOrFunction()}

" By default vista.vim never run if you don't call it explicitly.
"
" If you want to show the nearest function in your statusline automatically,
" you can add the following line to your vimrc
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
" How each level is indented and what to prepend.
" This could make the display more compact or more spacious.
" e.g., more compact: ["▸ ", ""]
" Note: this option only works the LSP executives, doesn't work for `:Vista ctags`.
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]

" Executive used when opening vista sidebar without specifying it.
" See all the avaliable executives via `:echo g:vista#executives`.
let g:vista_default_executive = 'ctags'

" Set the executive for some filetypes explicitly. Use the explicit executive
" instead of the default one for these filetypes when using `:Vista` without
" specifying the executive.
let g:vista_executive_for = {
  \ 'cpp': 'nvim_lsp',
  \ 'c': 'nvim_lsp',
  \ 'python': 'nvim_lsp',
  \ }

" Declare the command including the executable and options used to generate ctags output
" for some certain filetypes.The file path will be appened to your custom command.
" For example:
let g:vista_ctags_cmd = {
      \ 'haskell': 'hasktags -x -o - -c',
      \ }

" To enable fzf's preview window set g:vista_fzf_preview.
" The elements of g:vista_fzf_preview will be passed as arguments to fzf#vim#with_preview()
" For example:
"let g:vista_fzf_preview = ['right:50%']
nnoremap <leader>r :Vista finder<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" For vimspector
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:vimspector_enable_mappings = "HUMAN"
"nnoremap <Leader> <F5> :call vimspector#Launch()
"nnoremap <Leader> <F8> :call vimspector#AddFunctionBreakpoint(expand('<cexpr>'))
"Used in vim not friendly to neovim
"packadd! vimspector
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" For nvimgdb
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set to 1 to disable
"let g:loaded_nvimgdb = 0
" We're going to define single-letter keymaps, so don't try to define them
" in the terminal window.  The debugger CLI should continue accepting text commands.
au FileType python nnoremap <leader>DD :GdbStartPDB python3 -m pdb expand('%:t')<CR>

function! NvimGdbNoTKeymaps()
  tnoremap <silent> <buffer> <esc> <c-\><c-n>
endfunction

let g:nvimgdb_config_override = {
  \ 'key_next': 'n',
  \ 'key_step': 's',
  \ 'key_finish': 'f',
  \ 'key_continue': 'c',
  \ 'key_until': 'u',
  \ 'key_breakpoint': 'b',
  \ 'set_tkeymaps': "NvimGdbNoTKeymaps",
  \ }

let g:vista#renderer#enable_icon = 1

" The default icons can't be suitable for all the filetypes, you can extend it as you wish.
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" For OmniSharp
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype indent plugin on
let g:OmniSharp_highlight_types = 3
let g:Omnisharp_server_use_mono=1


augroup omnisharp_commands
    autocmd!

    " Show type information automatically when the cursor stops moving
    autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

    " The following commands are contextual, based on the cursor position.
    autocmd FileType cs nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fi :OmniSharpFindImplementations<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fs :OmniSharpFindSymbol<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fu :OmniSharpFindUsages<CR>

    " Finds members in the current buffer
    autocmd FileType cs nnoremap <buffer> <Leader>fm :OmniSharpFindMembers<CR>

    autocmd FileType cs nnoremap <buffer> <Leader>fx :OmniSharpFixUsings<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>tt :OmniSharpTypeLookup<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>dc :OmniSharpDocumentation<CR>
    autocmd FileType cs nnoremap <buffer> <C-\> :OmniSharpSignatureHelp<CR>
    autocmd FileType cs inoremap <buffer> <C-\> <C-o>:OmniSharpSignatureHelp<CR>

    " Navigate up and down by method/property/field
    autocmd FileType cs nnoremap <buffer> <C-k> :OmniSharpNavigateUp<CR>
    autocmd FileType cs nnoremap <buffer> <C-j> :OmniSharpNavigateDown<CR>

    " Find all code errors/warnings for the current solution and populate the quickfix window
    autocmd FileType cs nnoremap <buffer> <Leader>cc :OmniSharpGlobalCodeCheck<CR>
augroup END

" Contextual code actions (uses fzf, CtrlP or unite.vim when available)
nnoremap <Leader><Space> :OmniSharpGetCodeActions<CR>
" Run code actions with text selected in visual mode to extract method
xnoremap <Leader><Space> :call OmniSharp#GetCodeActions('visual')<CR>

" Rename with dialog
nnoremap <Leader>nm :OmniSharpRename<CR>
nnoremap <F2> :OmniSharpRename<CR>
" Rename without dialog - with cursor on the symbol to rename: `:Rename newname`
command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")

nnoremap <Leader>cf :OmniSharpCodeFormat<CR>

" Start the omnisharp server for the current solution
nnoremap <Leader>ss :OmniSharpStartServer<CR>
nnoremap <Leader>sp :OmniSharpStopServer<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" For Marks
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <C-A> 0 :'0
nnoremap <C-A> 1 :'1
nnoremap <C-A> 2 :'2
nnoremap <C-A> 3 :'3
nnoremap <C-A> 4 :'4
nnoremap <C-A> 5 :'5
nnoremap <C-S-[> :''<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" For gutentags
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <C-[> :pop<CR>
:set statusline+=%{gutentags#statusline()}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" For fugitive
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"nnoremap <leader>  :Gblame<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" For pdb
""""""""""""""""""" Nvim python environment settings
"if has('nvim')
"  let g:python_host_prog='~/.virtualenvs/neovim2/bin/python'
"  let g:python3_host_prog='~/.virtualenvs/neovim3/bin/python'
"  " set the virtual env python used to launch the debugger
"  let g:pudb_python='~/.virtualenvs/poweruser_tools/bin/python'
"  " set the entry point (script) to use for pudb
"  let g:pudb_entry_point='~/src/poweruser_tools/test/test_templates.py'
"  " Unicode symbols work fine (nvim, iterm, tmux, nyovim tested)
"  let g:pudb_breakpoint_symbol='☠'
"endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" For neomake
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:neomake_highlight_columns = 1
let g:neomake_highlight_lines = 1

hi NeomakeError gui=undercurl cterm=undercurl
hi NeomakeWarning gui=underline cterm=underline
au BufWritePost *.rs NeomakeProject cargo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" For airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline#extensions#neomake#enabled = 1
let g:airline_section_z=''
let g:airline_skip_empty_sections = 1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" For picker
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:picker_custom_find_executable = 'rg'
let g:picker_custom_find_flags = '. -n -g "!*.html"'
"let g:picker_custom_find_flags = '--color never --files'
let g:picker_split = 'bo'
let g:picker_height = 40
let g:picker_selector_executable = 'fzf'
let g:picker_selector_flags = '--preview="source ~/.config/nvim/vim_string_to_arg.sh; string2arg {}"'
" Custom Picker Calls
nmap <unique> <leader>pe <Plug>(FuzzyPicker)
nmap <unique> <leader>ps <Plug>(SideFuzzyPicker)
nmap <unique> <leader>pv <Plug>(VertFuzzyPicker)

"nmap <unique> <leader>pe <Plug>(PickerEdit)
"nmap <unique> <leader>ps <Plug>(PickerSplit)
nmap <unique> <leader>pt <Plug>(PickerTabedit)
"nmap <unique> <leader>pv <Plug>(PickerVsplit)
nmap <unique> <leader>pb <Plug>(PickerBuffer)
nmap <unique> <leader>p] <Plug>(PickerTag)
nmap <unique> <leader>pw <Plug>(PickerStag)
nmap <unique> <leader>po <Plug>(PickerBufferTag)
nmap <unique> <leader>ph <Plug>(PickerHelp)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" For SourceTrail
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>as :SourcetrailRefresh<CR>`
nnoremap <leader>aa :SourcetrailActivateToken<CR>`
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" For ale
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ale options
let g:ale_linters = {'python': ['flake8', 'pylint']}
let g:ale_linters_ignore = {'python': ['pylint']}
"test_system.py:1:0: C0111 (missing-docstring) Missing module docstring
"test_system.py:20:0: C0103 (invalid-name) Class name "Test_UDP_Sys_IF" doesn't conform to PascalCase naming style
"test_system.py:20:0: C0111 (missing-docstring) Missing class docstring
"test_system.py:21:4: C0111 (missing-docstring) Missing method docstring
"test_system.py:21:4: R0914 (too-many-locals) Too many local variables (16/15)
"test_system.py:21:4: R0201 (no-self-use) Method could be a function
"test_system.py:20:0: R0903 (too-few-public-methods) Too few public methods (1/2)
"test_system.py:47:4: C0103 (invalid-name) Constant name "test" doesn't conform to UPPER_CASE naming style
let g:ale_python_flake8_options = '--ignore=E722,E129,E501,E302,E265,E241,E305,E402,W503,E221,E203'
let g:ale_python_pylint_options = '-j 0 --max-line-length=120'
let g:ale_list_window_size = 4
let g:ale_sign_column_always = 0
let g:ale_open_list = 0
let g:ale_keep_list_window_open = 1
let g:ale_set_loclist = 0

" Options are in .pylintrc!
highlight VertSplit ctermbg=253
highlight ALEError cterm=undercurl gui=undercurl
highlight ALEWarning cterm=underline gui=underline

let g:ale_sign_error = '‼'
let g:ale_sign_warning = '∙'
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1
nmap <silent> <C-M> <Plug>(ale_previous_wrap)
nmap <silent> <C-m> <Plug>(ale_next_wrap)
au FileType c ALEDisable
au FileType cpp ALEDisable
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" For Tag and Tree Toggle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" toggle nerdtree on ctrl+n
map <C-n> :NERDTreeToggle<CR>
"nmap <F8> :TagbarToggle<CR>
map <C-t> :set nosplitright<CR>:TagbarToggle<CR>:set splitright<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" For Table formatter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:isAtStartOfLine(mapping)
  let text_before_cursor = getline('.')[0 : col('.')-1]
  let mapping_pattern = '\V' . escape(a:mapping, '\')
  let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
  return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction

inoreabbrev <expr> <bar><bar>
          \ <SID>isAtStartOfLine('\|\|') ?
          \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
inoreabbrev <expr> __
          \ <SID>isAtStartOfLine('__') ?
          \ '<c-o>:silent! TableModeDisable<cr>' : '__'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" For Util snippets
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger="<tab>"  " use <Tab> trigger autocompletion
"let g:UltiSnipsJumpForwardTrigger="<c-f>"
"let g:UltiSnipsJumpBackwardTrigger="<c-b>"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" For Synatastic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:syntastic_rust_checkers = ['cargo']
"let g:rust_cargo_avoid_whole_workspace = 1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" For Markdown previewer
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_python_checkers = ['flake8']
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 0
"let g:syntastic_check_on_open = 0
"let g:syntastic_check_on_wq = 0
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" For Chromatica
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:chromatica#enable_at_startup=0

"let g:chromatica#libclang_path='/usr/lib/llvm-8/lib/libclang.so'
let g:chromatica#libclang_path='/usr/lib/llvm-6.0/lib/libclang.so'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" For Fuzzy
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

nnoremap <silent> <C-h> :call fzf#run({
    \   'right': winwidth('.') / 2,
    \   'sink':  'horizontal botright split',
    \   'height': '40%'})<CR>
"nnoremap <silent> <C-v> :call fzf#run({
"    \   'right': winwidth('.') / 2,
"    \   'sink':  'vertical botright split',
"    \   'height': '40%'})<CR>
nnoremap <silent> <C-p> :call fzf#run({
    \ 'source' : 'fd',
    \ 'sink':  'e', 'bottom': '40%'})<CR>
nnoremap <leader>f :Files<CR>
nnoremap <leader>g :Rg<CR>
nnoremap <leader><S-g> :Clap blines<CR>
nnoremap <C-g> :Clap grep<CR>
nnoremap <leader>fs :Clap filer<CR>
"nnoremap <C-p> :Files<Cr>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" For Jedi
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable Jedi-vim autocompletion and enable call-signatures options
let g:jedi#auto_initialization = 1
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#smart_auto_mappings = 0
let g:jedi#popup_on_dot = 0
let g:jedi#completions_command = ""
let g:jedi#show_call_signatures = "1"
let g:jedi#show_call_signatures_delay = 0
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#show_call_signatures_modes = 'i'  " ni = also in normal mode
let g:jedi#enable_speed_debugging=0
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
    " enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()
autocmd BufEnter *.md call ncm2#disable_for_buffer()

" IMPORTANT: :help Ncm2PopupOpen for more information
nnoremap <leader>T :tabNext<CR>
let g:SuperTabMappingForward = '<tab>'
let g:SuperTabMappingBackward = '<s-tab>'
let g:SuperTabDefaultCompletionType = "context"
set completeopt=noinsert,menuone
set pumheight=5
let ncm2#complete_length = [[1,1]]
let ncm2#popup_delay = 5
inoremap <expr> <Space> (pumvisible() ? "\<c-y>" : "\<Space>")
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

au FileType Markdown call ncm2#disable_for_buffer()
"au FileType Rust call ncm2#disable_for_buffer()
inoremap <expr> <PageDown> pumvisible() ? "\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp> pumvisible() ? "\<C-p>" : "\<PageUp>"
"inoremap <expr> <Down> pumvisible() ? "\<C-n>" : "\<Down>"
"inoremap <expr> <Up> pumvisible() ? "\<C-p>" : "\<Up>"
" Use <TAB> to select the popup menu:
	"function! CleverTab()
	"   if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
	"      return "\<Tab>"
	"   else
	"      return "\<C-N>"
	"   endif
	"endfunction
	"inoremap <Tab> <C-R>=CleverTab()<CR>
"inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LSP Stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Required for operations modifying multiple buffers like rename.
set hidden

    "\ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
"https://clang.llvm.org/extra/clangd/Installation.html
let s:ccls_settings = {
         \ 'highlight': { 'lsRanges' : v:true },
         \ }
let s:ccls_command = ['ccls', '-init=' . json_encode(s:ccls_settings), '--log-file=/tmp/cc.log']

let g:LanguageClient_serverCommands = {
    \ 'rust': ['rls'],
    \ 'python': ['/home/rmarr/.local/bin/pyls'],
    \ 'cpp': s:ccls_command,
    \ 'c': s:ccls_command,
    \ }
    "\ 'cpp' : ['clangd', '-background-index',],
    "\ 'c' : ['clangd','-background-index',],

let g:LanguageClient_loadSettings = 1 " Use an absolute configuration path if you want system-wide settings
let g:LanguageClient_settingsPath = '/home/rmarr/.config/nvim/settings.json'
set completefunc=LanguageClient#complete
set formatexpr=LanguageClient_textDocument_rangeFormatting()

nnoremap <silent> F5:call LanguageClient_contextMenu()<CR>
nnoremap <silent> gh :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :normal! m'<CR>:call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> gi :call LanguageClient#textDocument_implementation()<CR>:normal! m`<<CR>
nnoremap <silent> gr :call LanguageClient#textDocument_references()<CR>:normal! m`<<CR>
nnoremap <silent> gs :call LanguageClient#textDocument_documentSymbol()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
nn <silent> <C-,> :call LanguageClient#textDocument_references({'includeDeclaration': v:false})<cr>

"nn <silent> ff :call BTags<CR>
" caller
nn <silent> xc :normal! m'<CR>:call LanguageClient#findLocations({'method':'$ccls/call'})<CR>
" callee
nn <silent> xC :normal! m'<CR>:call LanguageClient#findLocations({'method':'$ccls/call','callee':v:true})<CR>

au FileType Rust nnoremap <silent> <C-]> :call LanguageClient#textDocument_definition()<CR>:normal! m`<CR>
au FileType Rust  nnoremap <silent> <C-S-]> :call LanguageClient#textDocument_hover()<CR>

"Hide in-line messages
let g:LanguageClient_useVirtualText = "No"
let g:LanguageClient_hoverPreview = "Always"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ccls Stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ccls_close_on_jump = v:true
let g:ccls_levels = 3
let g:ccls_size = 50
let g:ccls_position = 'botright'
let g:ccls_orientation = 'horizontal'
" $ccls/member
" nested classes / types in a namespace
nn <silent> xs :call LanguageClient#findLocations({'method':'$ccls/member','kind':2})<cr>
" member functions / functions in a namespace
nn <silent> xf :call LanguageClient#findLocations({'method':'$ccls/member','kind':3})<cr>
" member variables / variables in a namespace
nn <silent> xm :call LanguageClient#findLocations({'method':'$ccls/member'})<cr>

"let g:yggdrasil_no_default_maps = 1
"nmap <silent> <buffer> <leader>o <Plug>(yggdrasil-toggle-node)
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
map '" call NERDCommenterToggle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" For deoplete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:deoplete#enable_at_startup = 1
"call dein#add('Shougo/deoplete.nvim')
"if !has('nvim')
"  call dein#add('roxma/nvim-yarp')
"  call dein#add('roxma/vim-hug-neovim-rpc')
"endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SETS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
syntax enable
if has("termguicolors")
    set termguicolors
endif

if (has('nvim)'))
    let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
endif

let g:material_terminal_italics = 1
"let g:material_theme_style = 'lighter'
colorscheme material

"Convert tabs to spaces
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
" Search details
set incsearch
set hlsearch
" To aid the colorscheme...
set t_Co=256
" Create line numbers on the left side of vi, 6 digits worth
set nonumber
"set relativenumber
"set number
"set numberwidth=6
" Set text wrapping at 120 (used to be 80) columns
set nowrap
"set tw=120
" Indent to the tab positiion when  you cross over the 80 line limit.
set smartindent
" Leave a couple of lines at the top and bottom when scrolling
set scrolloff=2
" Give context on where you are in the file
set ruler

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
set mouse=""    " Disable all mouse behaviour.
set mouse=a     " Enable all mouse behaviour (the default).
set mouse+=v    " Enable visual mode (v)
set mouse-=c    " Disable mouse in command mode.



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" AUTO COMMANDS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("autocmd")
" autocmd BufRead,BufNewFile *.[ch] let fname = expand('<afile>:p:h') . '/types.vim'
" autocmd BufRead,BufNewFile *.[ch] if filereadable(fname)
" autocmd BufRead,BufNewFile *.[ch]   exe 'so ' . fname
" autocmd BufRead,BufNewFile *.[ch] endif

" Remove trailing whitepsaces for each line on save.
" Highlight text that goes past the 121 line limit.
"augroup vimrc_autocmds
"    "autocmd BufReadPre * setlocal foldmethod=syntax
"    "autocmd BufWinEnter * if &fdm == 'syntax' | setlocal foldmethod=manual | endif
"    autocmd BufEnter * highlight OverLength ctermbg=7 ctermfg=0 guibg=#707070
"    autocmd BufEnter * match OverLength /\%121v.*/
"augroup END

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
" Custom COMMANDS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <C-c> :y+
nnoremap <C-f> :%s/
nnoremap <F7> :! git rev-parse --abbrev-ref HEAD <CR>
"Adjust current split
nnoremap <S-A-Left> : vertical resize -2 <CR>
nnoremap <S-A-Right> : vertical resize +2 <CR>
nnoremap <S-A-Up> : resize +2 <CR>
nnoremap <S-A-Down> : resize -2 <CR>
nnoremap <C-\> : vsplit <CR>
nnoremap <C-S-\> : split <CR>
"nnoremap <C-k-w> : quit <CR>


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

au FileType rust nmap gd <Plug>(rust-def)<CR> :normal! m`<CR>
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COLORS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"highlight Folded       ctermfg=7   ctermbg=8
"highlight FoldColumn   ctermfg=7   ctermbg=8
"highlight VertSplit    ctermfg=8   ctermbg=0
"highlight StatusLine   ctermfg=8   ctermbg=2
"highlight StatusLineNC ctermfg=8   ctermbg=60
"highlight LineNr       ctermfg=60
"highlight Comment      ctermfg=60
"highlight Number       ctermfg=202
"highlight Search       ctermfg=0  ctermbg=12
"highlight Todo         ctermfg=0  ctermbg=11

" Invoke command. 'g' is for call graph, kinda.
"nnoremap <silent> <Leader>g :call Cscope('3', expand('<cword>'))<CR>
