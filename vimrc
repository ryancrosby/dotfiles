set nocompatible          " get rid of Vi compatibility mode. SET FIRST!

" TODO: Add jump to header file
" TODO: Buffer Jumping
" TODO: ack integration
" TODO: Jump to file under cursor

" Must have this next line for vundler
filetype off                   " required!

set rtp+=~/dotfiles/vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My custom bundles
Bundle 'altercation/vim-colors-solarized'
Bundle '/Users/ryancrosby/Developer/pragmatic-objc/.git'
Bundle 'kien/ctrlp.vim'
Bundle 'stephenprater/cocoa.vim'
Bundle 'Valloric/YouCompleteMe'
Bundle 'scrooloose/syntastic'
" Bundle 'majutsushi/tagbar'
Bundle 'mileszs/ack.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-markdown'
" Bundle 'wincent/Command-T'
" Bundle 'xolox/vim-easytags'
" Bundle 'abudden/TagHighlight'

" Must have this next line for vundler
filetype plugin indent on     " required!

"echo "Welcome Ryan"

" Solarized
"syntax enable
"if has('gui_running')
" set background=dark
"else
"  set background=dark
"endif
"let g:solarized_termtrans=1
"let g:solarized_termcolors=256
"let g:solarized_contrast="high"
"
"let g:solarized_visibility="high"
"colorscheme solarized


" Turn syntax on
syntax enable


set background=dark
colorscheme slate       " Dark Color, decent
" colorscheme evening " Sucks
" colorscheme shine   " Light Color

"map <F11>  :sp tags<CR>:%s/^\([^   :]*:\)\=\([^    ]*\).*/syntax keyword Tag \2/<CR>:wq! tags.vim<CR>/^<CR><F12>
"map <F12>  :so tags.vim<CR>

" NERDTree
nmap <silent> <c-n> :NERDTreeToggle<CR>

" Change Leader to a ,
let mapleader=","
let g:mapleader=","

" Command-P Settings
let g:ctrlp_map = '<c-p>'

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" Let Command P work with project directories
let g:ctrlp_root_markers = ['.ycm_extra_conf.py']
" CtrlPClearCache


nnoremap <leader>b :CtrlPBuffer<CR>

" YouCompleteMe Settings
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
let g:ycm_allow_changing_updatetime = 0
let g:ycm_min_num_of_chars_for_completion = 99
"nnoremap <F4> :call ycm_key_invoke_completion()<CR>
let g:ycm_key_invoke_completion = '<leader>c'  
" let g:ycm_key_invoke_completion = '<C-Space>'

" cocoa.vim Mappings
map <leader>m :ListMethods<CR>

" Tagbar mappings
nmap <F8> :TagbarToggle<CR>

" Ack.vim mappings
nnoremap <leader>f :Ack

" Vim Mappings
imap jj <Esc>

" Insert double quotes around word
noremap <leader>" viw<esc>a"<esc>hbi"<esc>lel

" Use easier regex
noremap / /\v
vnoremap / /\v

" Insert single quotes around selection
"vnoremap <leader>' `<i'<esc>`>a'<esc>
"

" Jump to start of line
nnoremap H ^
nnoremap L $

" Window navigation
function! WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr()) "we haven't moved
        if (match(a:key,'[jk]'))
            wincmd v
        else
            wincmd s
        endif
        exec "wincmd ".a:key
    endif
endfunction

map <leader>h :call WinMove('h')<cr>
map <leader>k :call WinMove('k')<cr>
map <leader>l :call WinMove('l')<cr>
map <leader>j :call WinMove('j')<cr>

" Open up vimrc in right pain, or source vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" some files git always wants to commit
" move them outside the repo
let g:netrw_home=$HOME . "/.vimfiles"

set tags=./tags,tags,~/.vimtags/commontags

        "\ 'M:preprocessor_macro',
" add a definition for Objective-C to tagbar
let g:tagbar_type_objc = {
    \ 'ctagstype' : 'ObjectiveC',
    \ 'kinds'     : [
        \ 'i:interface',
        \ 'I:implementation',
        \ 'M:Object_method',
        \ 'm:Object_method',
        \ 'c:Class_method',
        \ 'v:Global_variable',
        \ 'F:Object field',
        \ 'f:function',
        \ 'p:property',
        \ 't:type_alias',
        \ 's:type_structure',
        \ 'e:enumeration',
    \ ],
    \ 'sro'        : ' ',
    \ 'kind2scope' : {
        \ 'i' : 'interface',
        \ 'I' : 'implementation',
        \ 's' : 'type_structure',
        \ 'e' : 'enumeration'
    \ },
    \ 'scope2kind' : {
        \ 'interface'      : 'i',
        \ 'implementation' : 'I',
        \ 'type_structure' : 's',
        \ 'enumeration'    : 'e'
    \ }
\ }

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

"let g:library_path='/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib'
"let g:clang_user_options='-fblocks -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator6.0.sdk -D __IPHONE_OS_VERSION_MIN_REQUIRED=60000'
"let g:clang_complete_include_current_directory_recursively=1

"Enable auto clang complete
"let g:clang_complete_auto = 1

" Show clang errors in the quickfix window
"let g:clang_hl_errors = 1

" Automatically complete after ., ::, ->
"let g:clang_complete_copen = 1

" Disable omnicomplete scratch/preview window
"set completeopt-=preview

" Enable snippets
"let g:clang_snippets = 1
"let g:clang_snippets_engine = 'clang_complete'

"let g:clang_periodic_quickfix = 1  
