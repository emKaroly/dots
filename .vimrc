" Enable iMproved functions
set nocompatible
set wildmenu
set wildmode=list:longest,list:full
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required

"========PLUGINS==============================================================
Plugin 'VundleVim/Vundle.vim'
" Appearance 
Plugin 'flazz/vim-colorschemes'
Plugin 'itchyny/lightline.vim'
" Wiki
Plugin 'vimwiki/vimwiki'
"Plugin 'lervag/wiki'
Plugin 'godlygeek/tabular'
Plugin 'itchyny/calendar.vim'
" Search
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'Alok/notational-fzf-vim'
Plugin 'CoatiSoftware/vim-sourcetrail'
" Git
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
" cTags
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'majutsushi/tagbar'
" Code completion
Plugin 'w0rp/ale'
Plugin 'Valloric/YouCompleteMe'
" Misc
Plugin 'ledger/vim-ledger'
Plugin 'sk1418/HowMuch'
"A Plugin to show a diff, whenever recovering a buffer
Plugin 'chrisbra/Recover.vim'
" Filetype
Plugin 'chrisbra/csv.vim'

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
"show existing tab with 4 spaces width
set tabstop=4
"when indenting with '>', use 4 spaces width
set shiftwidth=4
set nofoldenable
set foldmethod=indent
"On pressing tab, insert 4 spaces
set expandtab

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

"========COMMANDS==============================================================
" Find TODO in current folder recursive
command Todo noautocmd vimgrep /TODO\|FIXME/j ** | cw
" Find TODO in current File
command Td noautocmd vimgrep /TODO\|FIXME/j % | cw
command R !python3 %
command S !screen -S logWindow -X exec python3 %:p

"Markdown Preview
command MKD :silent !open -a "Marked 2.app" %:p
command MDP !python -m markdown2 %:p > tempMarkdownPreview.html && open tempMarkdownPreview.html
command MD :silent !pandoc %:p -f markdown -t html -s -o /tmp/tmp.html && open /tmp/tmp.html
command MDnum !pandoc %:p -f markdown --number-sections -t html -s -o /tmp/tmp.html && open /tmp/tmp.html
command MDrtf !pandoc %:p -f markdown --number-sections -t rtf -s -o /tmp/tmp.rtf && open /tmp/tmp.rtf

command! -nargs=+ Silent
            \   execute 'silent <args>'
            \ | redraw!

"If you prefer the Omni-Completion tip window to close when a selection is made,
"these lines close it on movement in insert mode or when leaving insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

"MacVim Settings
:set guifont=DejaVu_Sans_Mono_for_Powerline:h16
set guioptions=

"VIM Shortcuts
let mapleader = ';'
"Shortcut for buffer switching  (\ + l)
nnoremap <leader>l :ls<CR>:b<space> 
"Toggle relative line numbers (\ + n)
nnoremap <silent><leader>n :set relativenumber!<cr>
"Tabnext (; + j)
nnoremap <leader>k :tabnext<CR>
"Tabprevious (; + k)
nnoremap <leader>j :tabprevious<CR>
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

nnoremap <leader>ev :tabe $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

"Remap autocompletion from Ctrl+Space to Enter when autocomplete menu active
":inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

"========PLUGINS SETTINGS======================================================

" Syntastic
" Change interpreter to Python 3 
let g:syntastic_python_python_exec = '/usr/local/Cellar/python3'

let g:vim_markdown_folding_disabled=1
" Netrw Tree view
let g:netrw_liststyle=3

" Lightline
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
set showtabline=2  " Show tabline
set guioptions-=e  " Don't use GUI tabline
set noshowmode      " Remove "INSERT, NORMAL, etc from status

" Calendar
let g:calendar_first_day = 'monday'

" Vimwiki
let g:vimwiki_use_calendar=1
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

" Autocommands
" When new .md file is created load the template file.
"autocmd bufnewfile *.md execute ":put %"
"autocmd bufnewfile *.md execute ":put expand('%:t:r')"
"autocmd bufnewfile *.md source $HOME/Dropbox/text/notes_header.txt
autocmd bufnewfile *.md source $HOME/Dropbox/text/notes_test.txt
autocmd BufNewFile,BufRead *.qs   set filetype=javascript
autocmd BufNewFile,BufRead *.qbs   set filetype=javascript
"autocmd bufnewfile *.md execute "1," . 5 . "g/Created:/s//Created:" . expand('<afile>')
"autocmd bufnewfile *.md execute "1," . 5 . "g/Created:/s//Created:" . expand('<afile>')
"autocmd bufnewfile *.md execute "1," . 2 . "g/#.*/s//#" .strftime("%Y%m%d%H%M%S%Z")

function! ToggleCalendar()
  execute ":Calendar -view=year -split=vertical -width=27"
  if exists("g:calendar_open")
    if g:calendar_open == 1
      execute "q"
      unlet g:calendar_open
    else
      g:calendar_open = 1
    end
  else
    let g:calendar_open = 1
  end
endfunction
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
let g:nv_search_paths = ['$HOME/Dropbox/text']
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

if exists('g:ycm_filetype_blacklist')
    call extend(g:ycm_filetype_blacklist, { 'ledger': 1 })
endif

noremap <leader>e :call ledger#entry()<CR>
noremap <leader>r :call ledger#align_amount_at_cursor()<CR>
noremap <leader>t :call ledger#transaction_state_toggle(line('.'), ' *?!')<CR>
