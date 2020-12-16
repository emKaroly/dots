" Enable iMproved functions
set nocompatible
set wildmenu
set wildmode=list:longest,list:full
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=$HOME/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required

"========PLUGINS==============================================================
Plugin 'VundleVim/Vundle.vim'
" Appearance 
Plugin 'flazz/vim-colorschemes'
Plugin 'itchyny/lightline.vim'
Plugin 'edkolev/promptline.vim'
Plugin 'ap/vim-buftabline'
" Wiki
Plugin 'vimwiki/vimwiki'
"Plugin 'lervag/wiki'
Plugin 'godlygeek/tabular'
"Plugin 'itchyny/calendar.vim'
Plugin 'mattn/calendar-vim'
" Search
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'Alok/notational-fzf-vim'
Plugin 'CoatiSoftware/vim-sourcetrail'
" Git
Plugin 'tpope/vim-fugitive'
Plugin 'junegunn/gv.vim'
Plugin 'airblade/vim-gitgutter'
" cTags
"Plugin 'ludovicchabant/vim-gutentags'
"Plugin 'majutsushi/tagbar'
" Code completion
Plugin 'w0rp/ale'
"Plugin 'OmniSharp/omnisharp-vim'
Plugin 'Valloric/YouCompleteMe'
" Misc
Plugin 'ledger/vim-ledger'
Plugin 'sk1418/HowMuch'
"A Plugin to show a diff, whenever recovering a buffer
Plugin 'chrisbra/Recover.vim'
Plugin 'tpope/vim-dispatch'
Plugin 'gfontenot/vim-xcode'
" Filetype
Plugin 'darfink/vim-plist'
"Plugin 'chrisbra/csv.vim'
Plugin 'will133/vim-dirdiff'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:
" filetype plugin on
"
"  Brief help
"  :PluginList       - lists configured plugins
"  :PluginInstall    - installs plugins; append `!` to update 
"                       or just :PluginUpdate
"  :PluginSearch foo - searches for foo; append `!` to refresh local cache
"  :PluginClean      - confirms removal of unused plugins; append `!`
"                       to auto-approve removal

set shell=/bin/bash

"========COLORSCHEME===========================================================
colorscheme gruvbox
set background=dark
" temporary fix
" https://github.com/vim/vim/issues/3117
if has('python3')
    silent! python3 1
endif
"Set background depending on time of day
"let hourOfDay = strftime("%H")
""if strftime("%H") < 18
"if hourOfDay > 8 && hourOfDay < 17
"    set background=light
"else
"    set background=dark
"endif

if exists('+colorcolumn')
    set colorcolumn=80
else
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

" Enable syntax highlighting
syntax enable
" Highlight current line
set cursorline
" Search highlighting
set hlsearch
hi Search ctermfg=Black ctermbg=Yellow cterm=bold
hi Search ctermfg=Black ctermbg=Yellow cterm=bold,underline
"Show the cursor position
set ruler
"Always show status line
set laststatus=2
"Make backspace work like most other apps
set backspace=2
"Enable line numbering
set number
"Show the (partial) command as it’s being typed
set showcmd
"Use the OS clipboard by default (on versions compiled with `+clipboard`)
"In iTerm set: Application in terminal may access clipboard
set clipboard=unnamed
"Start scrolling three lines before the horizontal window border
set scrolloff=3
set sidescroll=5
set nowrap
set shell=/bin/zsh

set nosmartindent
"show existing tab with 2 spaces width
set tabstop=2
"when indenting with '>', use 2 spaces width
set shiftwidth=2
set nofoldenable
set foldmethod=indent
"On pressing tab, insert 4 spaces
set expandtab

" Searches will be case insensitive
set ignorecase
" Search will be case sensitive if it contains an uppercase letter
set smartcase
"It hides buffers instead of closing them. This means that you can have
"unwritten changes to a file and open a new file using :e, without being
"forced to write or undo your changes first. Also, undo buffers and marks are
"preserved while the buffer is open.
set hidden
" Preserve creation date of files: :help 'backupcopy'
set backupcopy=yes
" tell vim to keep a backup file
set backup
" tell vim where to put its backup files
set backupdir=/private/tmp
" tell vim where to put swap files
set dir=/private/tmp
" Set when text can be concealed
set conceallevel=2
set concealcursor=
" If spellfile is missing change SK to sk_SK and let spellfile.vim download
" the files and than change sk_SK back so you dont get Warnning
set spell spelllang=en_us,SK
"set nospell
set belloff=all
set path+=$HOME/Dropbox/**,$HOME/Projects/**

if has('nvim-0.3.2') || has('patch-8.1.0360')
    set diffopt=vertical,filler,internal,algorithm:histogram,indent-heuristic
endif

"========COMMANDS==============================================================
" Find TODO in current folder recursive
command Todo noautocmd vimgrep /TODO\|FIXME/j ** | cw
" Find TODO in current File
command Td noautocmd vimgrep /TODO\|FIXME/j % | cw
command R call RunScriptFile()
command S !screen -S logWindow -X exec python3 %:p

"Markdown Preview
command VCD :exe ":!code " . FindDirWithFolder('.vscode')
command MKD :silent !open -a "Marked 2.app" %:p
command MDP !python -m markdown2 %:p > tempMarkdownPreview.html && open tempMarkdownPreview.html
command MD :silent !pandoc %:p -f markdown -t html -s -o /tmp/tmp.html && open /tmp/tmp.html
command MDnum !pandoc %:p -f markdown --number-sections -t html -s -o /tmp/tmp.html && open /tmp/tmp.html
command MDrtf !pandoc %:p -f markdown --number-sections -t rtf -s -o /tmp/tmp.rtf && open /tmp/tmp.rtf
command JPP :exe '%!python -m json.tool'

command LCD :lcd %:p:h
command! -nargs=+ Silent
            \   execute 'silent <args>'
            \ | redraw!

"If you prefer the Omni-Completion tip window to close when a selection is made,
"these lines close it on movement in insert mode or when leaving insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

"MacVim Settings
:set guifont=DejaVu_Sans_Mono_for_Powerline:h20
set guioptions=

"VIM Shortcuts
let mapleader = ';'
"Shortcut for buffer switching  (\ + l)
nnoremap <leader>' :ls<CR>:b<space>
"Toggle relative line numbers (\ + n)
nnoremap <silent><leader>n :set relativenumber!<cr>
"Buffer Next (; + k)
nnoremap <leader>k :bnext<CR>
"Buffer Previous (; + j)
nnoremap <leader>j :bprevious<CR>
"Tabnext (; + l)
nnoremap <leader>l :tabnext<CR>
"Tabprevious (; + h)
nnoremap <leader>h :tabprevious<CR>
" remap control-enter to open files in new tab
nmap <silent> <C-CR> t :rightbelow 20vs<CR>:e .<CR>:wincmd h<CR>
" F3 insert timestamp
nmap <F3> i<C-R>=strftime("%Y%m%d%H%M%S%Z")<CR><Esc>
" F4 insert timestamp
nmap <F4> i<C-R>="[](" . strftime("%Y%m%d%H%M%S%Z") .".md)"<CR><Esc><S-i><Right>
" leader + f: FZF Search
nnoremap <silent><leader>f :NV<CR>
" TODO Function to move selected text to other file
nmap <F2> :w >> kkt.md<CR>
"cmap <F5> :'<,'>w >> =strftime("%Y-%m-%d.md")<CR>
"cmap <F6> w >> =strftime("%Y-%m-%d.md")<CR>
"nnoremap <F6> DD :exe ":w! >>".'$WIKI_DIR/diary/'.strftime("%Y-%m-%d.md")<CR>
":vnoremap <F6> V :exe ":w! >>" . '$WIKI_DIR/diary/' . strftime("%Y-%m-%d.md")<CR>

"map <F5> V :'<,'> w! >> /YOUR/SELECTIONFILE<cr>:'<,'>d<cr>
"map <F5> V :'<,'> w! >> /YOUR/SELECTIONFILE<cr>:'<,'>d<cr>
command! -range DONE execute "'<,'>:w! >> ".strftime("%Y-%m-%d.md")
nnoremap <leader>dd  V :DONE<CR> dd

nnoremap <leader>ev :e $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

"Remap autocompletion from Ctrl+Space to Enter when autocomplete menu active
":inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

"========PLUGINS SETTINGS======================================================

"Gitgutter
let g:gitgutter_sign_added = '█'
let g:gitgutter_sign_modified = '░'
let g:gitgutter_sign_removed = '█'
let g:gitgutter_sign_removed_first_line = '▀▀'
let g:gitgutter_sign_modified_removed = '┌─'
nmap <Leader>gp <Plug>GitGutterPreviewHunk

" Gutentags
set tags+=$HOME/.tags/**/tags
let g:gutentags_enabled = 0
let g:gutentags_cache_dir = expand('~/.tags/cache')

" Syntastic
" Change interpreter to Python 3 
let g:syntastic_python_python_exec = '/usr/local/Cellar/python3'

let g:vim_markdown_folding_disabled=1
" Netrw Tree view
let g:netrw_liststyle=3

" Lightline
let g:promptline_preset = {
        \'a' : [ promptline#slices#host() ],
        \'b' : [ '$USER'],
        \'y' : [ '%~', promptline#slices#vcs_branch() ],
        \'warn' : [ promptline#slices#last_exit_code() ]}

let g:lightline = {
            \   'colorscheme': 'powerline',
            \   'active': {
            \     'left':[ [ 'mode', 'paste' ],
            \              [ 'gitbranch', 'readonly', 'filename', 'modified' ]
            \     ]
            \   },
            \   'component': {
            \     'lineinfo': ' %3l:%-2v',
            \   },
            \   'component_function': {
            \     'gitbranch': 'fugitive#head',
            \   }
            \ }
let g:lightline.separator = {
            \   'left': '', 'right': ''
            \}
let g:lightline.subseparator = {
            \   'left': '', 'right': '' 
            \}
let g:lightline.tabline = {
            \   'left': [ ['tabs'] ],
            \   'right': [ ['close'] ]
            \ }
set showtabline=1  " Only if there are at least two tab pages
set guioptions-=e  " Don't use GUI tabline
set noshowmode      " Remove "INSERT, NORMAL, etc from status

" Calendar
let g:calendar_first_day = 'monday'
let calendar_action = 'MyCalAction'
let calendar_end = 'MyCalActionEnd'

" Vimwiki
let g:vimwiki_use_calendar=0
:map    <leader>cc  <Plug>VimwikiToggleListItem
:nmap   <Leader>u   <Plug>VimwikiDiaryPrevDay
:nmap   <Leader>d   <Plug>VimwikiDiaryNextDay
let g:vimwiki_list = [{'path': '$WIKI_DIR',
            \'index': 'main',
            \'syntax': 'markdown', 
            \'ext': '.md',
            \'auto_toc': 1},
            \{'path': '$WIKI_DIR_PROJECTS',
            \'index': 'main',
            \'syntax': 'markdown', 
            \'ext': '.md',
            \'auto_toc': 1}]
let g:vimwiki_ext2syntax = {'.md': 'markdown'}
let g:vimwiki_global_ext = 0
let g:vimwiki_ext = ".md"
let g:vimwiki_listsyms = ' ¼½¾x'
" let g:vimwiki_listsyms = '✖¼½¾✔'
"let g:vimwiki_listsyms = '✗○◐●✓'
" Autosave for vimwiki files(.md also)
let g:vimwiki_autowriteall = 0
let g:vimwiki_folding = 'custom'

" Default to Vimwiki's section folding options
autocmd FileType vimwiki setlocal fdm=indent

" Autocommands
" When new .md file is created load the template file.
"autocmd bufnewfile *.md execute ":put %"
"autocmd bufnewfile *.md execute ":put expand('%:t:r')"
"autocmd bufnewfile *.md source $HOME/Dropbox/text/notes_header.txt
"autocmd BufRead *.cpp setlocal makeprg=clang++\ -std=c++17\ -fcoroutines-ts\ -stdlib=libc++\ %\ -o\ %:r 
let $CXX='clang++'
let $CXXFLAGS='-std=c++17 -stdlib=libc++'
autocmd bufnewfile *.md source $HOME/Dropbox/text/notes_test.txt
autocmd BufNewFile,BufRead *.qs   set filetype=javascript
autocmd BufNewFile,BufRead *.qbs   set filetype=javascript
"autocmd bufnewfile *.md execute "1," . 5 . "g/Created:/s//Created:" . expand('<afile>')
"autocmd bufnewfile *.md execute "1," . 5 . "g/Created:/s//Created:" . expand('<afile>')
"autocmd bufnewfile *.md execute "1," . 2 . "g/#.*/s//#" .strftime("%Y%m%d%H%M%S%Z")

:autocmd FileType vimwiki map <leader>cd :call ToggleCalendar()<CR>

" fzf.vim - Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" fzf.vim - Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" notational-fzf-vim
let g:nv_search_paths = ['~/Dropbox/text']
"let g:nv_main_directory = ['~/Dropbox']
let g:nv_use_short_pathnames = 1

" Vim-Ledger
let g:ledger_maxwidth = 80
let g:ledger_align_at = 50
let g:ledger_date_format = '%Y-%m-%d'
let g:ledger_default_commodity = 'EUR'
let g:ledger_commodity_before = 1
let g:ledger_commodity_sep = ' '
let g:ledger_extra_options = '-f ~/Dropbox/text/Ledger/main.ledger'

"OmniSharp
let g:OmniSharp_server_stdio = 1
" Timeout in seconds to wait for a response from the server
let g:OmniSharp_timeout = 4
" Don't autoselect first omnicomplete option, show options even if there is only
" one (so the preview documentation is accessible). Remove 'preview' if you
" don't want to see any documentation whatsoever.
set completeopt=longest,menuone,preview

" XCode
let g:xcode_project_file = '/Volumes/Storage/Projects/PFX/pdfix/pdfix/platform/xcode/pdfix.xcodeproj'
"let g:xcode_project_file = '/Volumes/Storage/Projects/PFX/pdfix/utils/cpc/platform/xcode/cpc.xcodeproj'
"let g:xcode_runner_command = ':Make {cmd}'

" Fetch full documentation during omnicomplete requests.
" By default, only Type/Method signatures are fetched. Full documentation can
" still be fetched when you need it with the :OmniSharpDocumentation command.
"let g:omnicomplete_fetch_full_documentation = 1

" Tell ALE to use OmniSharp for linting C# files, and no other linters.
let g:ale_linters = { 'cs': ['OmniSharp'] }
" Update semantic highlighting on BufEnter and InsertLeave
let g:OmniSharp_highlight_types = 2
" Contextual code actions (uses fzf, CtrlP or unite.vim when available)
nnoremap <Leader><Space> :OmniSharpGetCodeActions<CR>
" Run code actions with text selected in visual mode to extract method
xnoremap <Leader><Space> :call OmniSharp#GetCodeActions('visual')<CR>

" " Rename with dialog
" nnoremap <Leader>nm :OmniSharpRename<CR>
" nnoremap <F2> :OmniSharpRename<CR>
" " Rename without dialog - with cursor on the symbol to rename: `:Rename newname`
" command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")
" 
" nnoremap <Leader>cf :OmniSharpCodeFormat<CR>
" 
" " Start the omnisharp server for the current solution
" nnoremap <Leader>ss :OmniSharpStartServer<CR>
" nnoremap <Leader>sp :OmniSharpStopServer<CR>
" 
" "let g:OmniSharp_server_path = fnamemodify(findfile('run',$HOME . '/.vscode/extensions/*/.omnisharp/*/'),':p')
" 
" augroup omnisharp_commands
"     autocmd!
" 
"     " Show type information automatically when the cursor stops moving
"     "autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()
" 
"     " The following commands are contextual, based on the cursor position.
"     autocmd FileType cs nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>
"     autocmd FileType cs nnoremap <buffer> <Leader>fi :OmniSharpFindImplementations<CR>
"     autocmd FileType cs nnoremap <buffer> <Leader>fs :OmniSharpFindSymbol<CR>
"     autocmd FileType cs nnoremap <buffer> <Leader>fu :OmniSharpFindUsages<CR>
" 
"     " Finds members in the current buffer
"     autocmd FileType cs nnoremap <buffer> <Leader>fm :OmniSharpFindMembers<CR>
" 
"     autocmd FileType cs nnoremap <buffer> <Leader>fx :OmniSharpFixUsings<CR>
"     autocmd FileType cs nnoremap <buffer> <Leader>tt :OmniSharpTypeLookup<CR>
"     autocmd FileType cs nnoremap <buffer> <Leader>dc :OmniSharpDocumentation<CR>
"     autocmd FileType cs nnoremap <buffer> <C-\> :OmniSharpSignatureHelp<CR>
"     autocmd FileType cs inoremap <buffer> <C-\> <C-o>:OmniSharpSignatureHelp<CR>
" 
"     " Navigate up and down by method/property/field
"     autocmd FileType cs nnoremap <buffer> <C-k> :OmniSharpNavigateUp<CR>
"     autocmd FileType cs nnoremap <buffer> <C-j> :OmniSharpNavigateDown<CR>
" 
"     " Find all code errors/warnings for the current solution and populate the quickfix window
"     autocmd FileType cs nnoremap <buffer> <Leader>cc :OmniSharpGlobalCodeCheck<CR>
" augroup END

if exists('g:ycm_filetype_blacklist')
    call extend(g:ycm_filetype_blacklist, { 'ledger': 1 })
endif

noremap <leader>e :call ledger#entry()<CR>
noremap <leader>r :call ledger#align_amount_at_cursor()<CR>
noremap <leader>t :call ledger#transaction_state_toggle(line('.'), ' *?!')<CR>

" functions
function RunScriptFile()
    :w
    "change wd for current file
    :lcd %:p:h
    let fileExtension = expand('%:e')
    if fileExtension == 'lua'
        !lua %
    elseif fileExtension == 'sh'
        !sh %
    elseif fileExtension == 'py'
        !python3 %
    elseif fileExtension == 'cs'
        !dotnet build && dotnet run
    elseif fileExtension == 'cpp'
        !clang++ -g -std=c++17 -fcoroutines-ts -stdlib=libc++ % -o %:r && ./%:r
    endif
endfunction

function FindDirWithFolder(folder)
    "change wd for current file
    :lcd %:p:h
    return fnamemodify(finddir(a:folder,'.;/Users'),':p:h:h')
endfunction

function! ToggleCalendar()
    let l:year = strftime("%Y")
    let l:month = strftime("%m")
    execute ":Calendar [[" . l:year . "] " . l:month . "] " . "-view=year -split=vertical -width=27"
    if exists("g:calendar_open")
        if g:calendar_open == 1
            execute "q"
            unlet g:calendar_open
        else
            g:calendar_open = 1
            execute "t"
        end
    else
        let g:calendar_open = 1
    end
endfunction

function! VimwikiLinkHandler(link)
    let link = a:link
    if link =~# '.*pdf$'
        silent exe "!" . "open " . $HOME . link
        return 1
    elseif link =~# '.*lgd$' || link =~# '.*ledger$'
        silent exe ":e!" . $HOME . link
        return 1
    elseif a:link =~ "command:"
        let command = a:link[8:]
        silent exe ":r!".command
        return 1
    else
        return 0
    endif
endfunction

function MyCalActionEnd()

endfunction

function MyCalAction(day,month,year,week,dir)
    "let @+ = printf('%04d-%02d-%02d', a:year, a:month, a:day)
    call calendar#close()
    call append(line('.'), printf('%04d-%02d-%02d', a:year, a:month, a:day))
    exe ":normal! JA"
endfunction
