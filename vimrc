set nocompatible              " 不兼容vi老版本
filetype off                  " vundle required

" vundle setup
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" my bundles
Bundle 'scrooloose/nerdtree'
Bundle 'kevinw/pyflakes-vim'
Bundle 'hdima/python-syntax'
Bundle 'Valloric/YouCompleteMe'
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/powerline'
Bundle 'wincent/Command-T'
Bundle 'jeffkreeftmeijer/vim-numbertoggle'
Bundle 'alfredodeza/pytest.vim'
Bundle 'mileszs/ack.vim'
Bundle 'taglist.vim'

colorscheme pychimp

set lines=45 columns=150      " 设置vim工作区大小
set number                    " 默认显示行号

set expandtab                 " 把所有输入的tab转换成空格
set tabstop=4                 " 1tab=4空格
set softtabstop=4             " 退格删除缩进
set shiftwidth=4              " 设置缩进为4空格
set backspace=indent,eol,start  " fix backspace not working

set autoindent                " 自动缩进, 开始新行时自动复制上一行的缩进
set smartindent               " 智能缩进
set smarttab                  " 根据shiftwidth设置缩进

set mouse=a                   " 开启鼠标模式
set history=100               " 最大 历史操作记录数

set showmatch
set hlsearch
set title

let mapleader=","             " 将','绑定为leader键
nnoremap ; :

syntax on                     " 开启语法高亮
filetype on
filetype plugin on
filetype plugin indent on

" 高亮当前行列
set cursorline
set cursorcolumn
hi CursorLine   cterm=bold ctermbg=235
hi CursorColumn cterm=bold ctermbg=235

" ,ee打开vim配置文件
map <silent> <leader>ee :e ~/.vim/vimrc<CR>

" 区域间切换
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" NERDTree
map <F1> :NERDTreeToggle<CR>
au VimEnter * NERDTree          " 自动开启NERDTree
au VimEnter * wincmd p          " 文件自动获取焦点
let NERDTreeDirArrows=1         " 箭头美化
let NERDTreeWinSize=31          " 窗口大小
let NERDTreeIgnore = ['\.pyc', '\.git', '\.hg', '\.svn', 'tags']  " 不在NERDTree中显示这些文件

" pyflakes
hi SpellBad term=reverse ctermbg=1

" python-syntax
let python_highlight_all = 1

" powerline
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim

" YouCompleteMe
nnoremap <leader>q :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>w <C-o>

" Command-T
noremap <leader>o <Esc>:CommandT<CR>
noremap <leader>m <Esc>:CommandTBuffer<CR>

"remember last login cursor
set viminfo='10,\"100,:20,%,n~/.viminfo

function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

"highlight chars after col 80
let &colorcolumn=join(range(81,999),",")
hi ColorColumn ctermbg=235

"higglight extra TAB and spaces
set list
set listchars=tab:»·,trail:·

"highlight current word under cursor
autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))
hi IncSearch ctermbg=240

"use za to fold/unfold code
set foldmethod=indent
set foldlevel=99

"move faster through buffers
map <S-right> <ESC>:bn<CR>
map <S-left> <ESC>:bp<CR>

" NumberToggle
let g:NumberToggleTrigger="<F2>"

" Pytest, only file test needed currently
nmap <silent><Leader>f <Esc>:Pytest file<CR>
"nmap <silent><Leader>c <Esc>:Pytest class<CR>
"nmap <silent><Leader>m <Esc>:Pytest method<CR>

" taglist
let Tlist_Use_Right_Window = 1
let Tlist_GainFocus_On_ToggleOpen = 1
noremap <leader>l <ESC>:TlistToggle<CR>
