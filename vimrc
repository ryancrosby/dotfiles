" Use Vim settings, don't use Vi settings,
" this affects other settings so it must be first
set nocompatible          " get rid of Vi compatibility mode. SET FIRST!

" Call Pathogen to load bundles
" Note: Calling infect, enables bundles to be disabled
call pathogen#infect()
" call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

let g:pathogen_disabled = []
call add(g:pathogen_disabled, 'tagbar') " This seems to conflict with command-T
call add(g:pathogen_disabled, 'vim-ios') " This seems to conflict with command-T
call add(g:pathogen_disabled, 'cocoa.vim') " This seems to conflict with command-T

" Solarized
syntax enable
if has('gui_running')
  set background=dark
else
  set background=dark
endif
let g:solarized_termtrans=1
let g:solarized_termcolors=256
let g:solarized_contrast="high"

let g:solarized_visibility="high"
colorscheme solarized

" NERDTree
nmap <silent> <c-n> :NERDTreeToggle<CR>

" Change Leader to a ,
let mapleader=","
let g:mapleader=","

" cocoa.vim Mappings
map <leader>l :ListMethods<CR>

" Command-T Settings
" nmap <silent> <leader>l :CommandTTag<CR>   " This is crashing for some
" reason
let g:CommandTMaxHeight=25
let g:CommandTMinHeight=25
let g:CommandTAlwaysShowDotFiles=0 " Shows . files, this is default placing it here to remember it is an option

" let g:easytags_cmd="/usr/local/bin/ctags"
let g:easytags_cmd = '/usr/local/bin/ctags'

" Tagbar mappings
nmap <F8> :TagbarToggle<CR>

" Vim Mappings
imap jj <Esc>

" some files git always wants to commit
" move them outside the repo
let g:netrw_home=$HOME . "/.vimfiles"

" set tags=~/.vimtags/Tumbleweed

" add a definition for Objective-C to tagbar
"let g:tagbar_type_objc = {
"    \ 'ctagstype' : 'ObjectiveC',
"    \ 'kinds'     : [
"        \ 'i:interface',
"        \ 'I:implementation',
"        \ 'p:Protocol',
"        \ 'm:Object_method',
"        \ 'c:Class_method',
"        \ 'v:Global_variable',
"        \ 'F:Object field',
"        \ 'f:function',
"        \ 'p:property',
"        \ 't:type_alias',
"        \ 's:type_structure',
"        \ 'e:enumeration',
"        \ 'M:preprocessor_macro',
"    \ ],
"    \ 'sro'        : ' ',
"    \ 'kind2scope' : {
"        \ 'i' : 'interface',
"        \ 'I' : 'implementation',
"        \ 'p' : 'Protocol',
"        \ 's' : 'type_structure',
"        \ 'e' : 'enumeration'
"    \ },
"    \ 'scope2kind' : {
"        \ 'interface'      : 'i',
"        \ 'implementation' : 'I',
"        \ 'Protocol'       : 'p',
"        \ 'type_structure' : 's',
"        \ 'enumeration'    : 'e'
"    \ }
"\ }

" My Custom Settings
set wildignore=*.o,*.obj,*.d  " ignore files for autocompletion, this helps Command-T not show unwanted results
nmap <silent>,/ :nohlsearch<CR>    " Clear higlighted search terms
noremap ; :

" Change the cursor when in insert/visual mode, only works in iTerm2
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

set statusline=%y\ %f\ %h%m%r%=%-14.(%l,%c%V%)\ %P     " Make the status line show the current filetype, whether it is modified, and be like a default ruler

" Settings I started using because I found them on the interwebs
" I am slowly figuring out if I actually want these and then they go
" up under 'My Custom Settings'
filetype plugin indent on " filetype detection[ON] plugin[ON] indent[ON]
set t_Co=256              " enable 256-color mode.
set number                " show line numbers
set laststatus=2          " last window always has a statusline
filetype indent on        " activates indenting for files
"set nohlsearch            " Don't continue to highlight searched phrases.
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

"set list
"set listchars=tab:▸\ ,eol:¬ " Use symbols for tabstops and EOLs

" Disable folding
" autocmd Syntax objc normal zR

"
"
" ===================== Clang Complete ===================
"

let g:library_path='/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib'
let g:clang_user_options='-fblocks -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator6.0.sdk -D __IPHONE_OS_VERSION_MIN_REQUIRED=60000'
let g:clang_complete_include_current_directory_recursively=1

"Enable auto clang complete
let g:clang_complete_auto = 1

" Show clang errors in the quickfix window
let g:clang_hl_errors = 1

" Automatically complete after ., ::, ->
let g:clang_complete_copen = 1

" Disable omnicomplete scratch/preview window
set completeopt-=preview

" Enable snippets
"let g:clang_snippets = 1
"let g:clang_snippets_engine = 'clang_complete'

"let g:clang_periodic_quickfix = 1  
