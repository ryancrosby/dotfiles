set nocompatible          " get rid of Vi compatibility mode. SET FIRST!

" TODO: Add jump to header file
" TODO: Buffer Jumping
" TODO: ack integration
" TODO: Jump to file under cursor

" Must have this next line for vundler
filetype off                   " required!

" set the runtime path to include Vundle and initialize
" set rtp+=~/.vim/bundle/Vundle.vim
" call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required
" Plugin 'VundleVim/Vundle.vim'
"

set rtp+=~/dotfiles/vim/bundle/vundle
call vundle#begin('~/dotfiles/vim/bundle')

" let Vundle manage Vundle
" required! 
Plugin 'gmarik/vundle'

" My custom bundles
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'mileszs/ack.vim'
Plugin 'Keithbsmiley/swift.vim'
Plugin 'elzr/vim-json'
Plugin 'pangloss/vim-javascript'
Plugin 'tmux-plugins/vim-tmux'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Bundle 'Rip-Rip/clang_complete'
" Bundle 'stephenprater/cocoa.vim'

" Requires additional config lines in this file
" Bundle 'altercation/vim-colors-solarized'

" Bundle '/Users/rcrosby/development/pragmatic-objc/.git'
" Plugin 'scrooloose/syntastic'
" Bundle 'majutsushi/tagbar'
" Bundle 'tpope/vim-fugitive'
" Bundle 'tpope/vim-markdown'
" Bundle 'wincent/Command-T'
" Bundle 'xolox/vim-easytags'
" Bundle 'abudden/TagHighlight'

" This one requires additional setup, I removed the config lines
" see github page for more info
" Bundle 'Valloric/YouCompleteMe'

" All of your Plugins must be added before the following line
call vundle#end()            " required

" User Powerline for prompt
"python from powerline.vim import setup as powerline_setup
"python powerline_setup()
"python del powerline_setup

" Must have this next line for vundler
filetype plugin indent on     " required!

" Turn syntax on
syntax enable

set background=dark
colorscheme slate       " Dark Color, decent
" colorscheme shine   " Light Color
" colorscheme evening " Sucks

" set guifont="Anonymice Powerline"
set guifont="Sauce Code"

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
"let g:ctrlp_root_markers = ['.ycm_extra_conf.py']
" CtrlPClearCache

nnoremap <leader>b :CtrlPBuffer<CR>

" cocoa.vim Mappings
map <leader>m :ListMethods<CR>

" Tagbar mappings
" nmap <F8> :TagbarToggle<CR>

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
"let g:netrw_home=$HOME . "/.vimfiles"

" My Custom Settings
set wildignore=*.o,*.obj,*.d  " ignore files for autocompletion, this helps Command-T not show unwanted results
nmap <silent>,/ :nohlsearch<CR>    " Clear higlighted search terms
noremap ; :

if has("autocmd")
 " Make sure all markdown files have the correct filetype set and
 "       setup wrapping
 au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} setf markdown

 " Treat JSON files like JavaScript
 " au BufNewFile,BufRead *.json set ft=javascript

 " set .h, .m file types to Objective-C
 au BufNewFile,BufRead *.{h,m} set ft=objc

 " set .podspec, .podfile file types to ruby
 au BufNewFile,BufRead *.podspec,Podfile set ft=ruby

 " Objective-C identation settings
 au FileType objc set softtabstop=4 tabstop=4 shiftwidth=4

endif

" Change the cursor when in insert/visual mode, only works in iTerm2
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" set statusline=%y\ %f\ %h%m%r%=%-14.(%l,%c%V%)\ %P     " Make the status line show the current filetype, whether it is modified, and be like a default ruler

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
set tabstop=2             " tab spacing
set softtabstop=2         " unify
set shiftwidth=2          " indent/outdent by 4 columns
set shiftround            " always indent/outdent to the nearest tabstop
set expandtab             " use spaces instead of tabs
set smarttab              " use tabs at the start of a line, spaces elsewhere
set nowrap                " don't wrap text

au FileType python set softtabstop=4 tabstop=4 shiftwidth=4
"set list
"set listchars=tab:▸\ ,eol:¬ " Use symbols for tabstops and EOLs

" Disable folding
" autocmd Syntax objc normal zR

"
"
" ===================== Clang Complete ===================
"
"
" http://ap4y.github.io/2013/11/10/vim-for-ios-developers.html

let g:clang_library_path='/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib'
let g:clang_auto_user_options="compile_commands.json, path, .clang_complete"
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
let g:clang_snippets = 1
let g:clang_auto_select = 1
"let g:clang_snippets_engine = 'clang_complete'

"let g:clang_periodic_quickfix = 1  
