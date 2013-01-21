" Use Vim settings, don't use Vi settings,
" this affects other settings so it must be first
set nocompatible          " get rid of Vi compatibility mode. SET FIRST!

" Call Pathogen to load bundles
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" Solarized
syntax enable
if has('gui_running')
  set background=dark
else
  set background=dark
endif
let g:soloarized_termtrans=1
let g:solarized_termcolors=256
let g:solarized_contrast="high"

let g:solarized_visibility="high"
colorscheme solarized

" NERDTree
nmap <silent> <c-n> :NERDTreeToggle<CR>

" My mappings
let mapleader=","
let g:mapleader=","

imap ii <Esc>

" some files git always wants to commit
" move them outside the repo
let g:netrw_home=$HOME . "/.vimfiles"

filetype plugin indent on " filetype detection[ON] plugin[ON] indent[ON]
set t_Co=256              " enable 256-color mode.
set number                " show line numbers
set laststatus=2          " last window always has a statusline
filetype indent on        " activates indenting for files
set nohlsearch            " Don't continue to highlight searched phrases.
set incsearch             " But do highlight as you type your search.
set ignorecase            " Make searches case-insensitive.
set ruler                 " Always show info along bottom.
set autoindent            " auto-indent
set tabstop=4             " tab spacing
set softtabstop=4         " unify
set shiftwidth=4          " indent/outdent by 4 columns
set shiftround            " always indent/outdent to the nearest tabstop
set expandtab             " use spaces instead of tabs
set smarttab              " use tabs at the start of a line, spaces elsewhere
set nowrap                " don't wrap text
"set listchars=tab:▸\ ,eol:¬ " Use symbols for tabstops and EOLs
"
"
" ===================== Clang Complete ===================
"

"let g:library_path='/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib'
"let g:clang_user_options='-fblocks -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator6.0.sdk -D __IPHONE_OS_VERSION_MIN_REQUIRED=60000'
"let g:clang_complete_include_current_directory_recursively=1

" Enable auto clang complete
" let g:clang_complete_auto = 1
"
" " Show clang errors in the quickfix window
" let g:clang_hl_errors = 1
"
" " Automatically complete after ., ::, ->
" let g:clang_complete_copen = 1
"
" " Disable omnicomplete scratch/preview window
" set completeopt-=preview
"
" " Enable snippets
" let g:clang_snippets = 1
" let g:clang_snippets_engine = 'clang_complete'
"
" let g:clang_periodic_quickfix = 1  
