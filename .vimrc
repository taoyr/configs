"""""""""""""""""""""""""default config""""""""""
set nocompatible
set backspace=indent,eol,start

if has("vms")
  set nobackup
else
  set backup
endif
set ruler
set showcmd
set incsearch

inoremap <C-U> <C-G>u<C-U>

if has("autocmd")
  filetype plugin indent on
  augroup vimrcEx
  au!
  autocmd FileType text setlocal textwidth=78
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
  augroup END
else
  set autoindent		" always set autoindenting on
endif

if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif
set cindent
"""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""setting"""""""""""
syntax on
colorscheme monokai

hi Search term=standout ctermfg=0 ctermbg=3 cterm=bold
set wildmenu
set wildmode=full
set guifont=Source\ Code\ Pro\ for\ Powerline:h14
set t_Co=256
set number
set statusline=2
set shiftwidth=4 " 设定 << 和 >> 命令移动时的宽度为 4
set softtabstop=4 " 使得按退格键时可以一次删掉 4 个空格
set history=200
set expandtab
set tabstop=4 " 设定 tab 长度为 4
set nobackup " 覆盖文件时不备份
set backupcopy=yes " 设置备份时的行为为覆盖
set ignorecase smartcase " 搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏感
set nowrapscan " 禁止在搜索到文件两端时重新搜索
set hlsearch " 搜索时高亮显示被找到的文本
set noerrorbells " 关闭错误信息响铃
set novisualbell " 关闭使用可视响铃代替呼叫
set t_vb= " 置空错误铃声的终端代码
set laststatus=2
set clipboard=unnamed
set completeopt-=preview
"""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""plug""""""""""""""
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-surround'
Bundle 'airblade/vim-gitgutter'
" Bundle 'terryma/vim-multiple-cursors'
Bundle 'sjl/gundo.vim'
Bundle 'dyng/ctrlsf.vim'
Bundle 'Tagbar'
Bundle 'Valloric/YouCompleteMe'
Bundle 'terryma/vim-expand-region'
Bundle 'L9'
Bundle 'The-NERD-tree'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'taglist.vim'
Bundle 'wesleyche/SrcExpl'
Bundle 'SuperTab'
Bundle 'bronson/vim-trailing-whitespace'
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'rizzatti/dash.vim'
Plugin 'tomasr/molokai'
Plugin 'tpope/vim-repeat'
Plugin 'scrooloose/syntastic'
Plugin 'godlygeek/tabular'
Plugin 'vim-scripts/Greplace.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'Yggdroot/indentLine'
Plugin 'wesleyche/Trinity'
Plugin 'tpope/vim-commentary'
Plugin 'plasticboy/vim-markdown'
" Plugin 'YankRing.vim'
" Bundle 'reedes/vim-colors-pencil'
" Plugin 'tpope/vim-fugitive'
" Plugin 'vim-scripts/winmanager'
" Plugin 'jiangmiao/auto-pairs'
" Plugin 'vim-scripts/matchit.zip'
" Bundle 'FuzzyFinder'
" Bundle 'Rykka/riv.vim'
" Bundle 'rizzatti/funcoo.vim'
" Bundle 'honza/vim-snippets'
" Bundle 'SirVer/ultisnips'
filetype plugin indent on

" call plug#begin('~/.vim/plugged')
" " Plug 'Shougo/vimproc.vim', {'do' : 'make'}
" call plug#end()
"""""""""""""""""""""""""""""""""""

"""""""""""""cscope""""""""""
set cscopequickfix=s-,c-,d-,i-,t-,e-

function! CSRESET()
    if filereadable("cscope.out")
        !cs
        cs reset
    else
        !cs
        if filereadable("cscope.out")
            cs add cscope.out
        elseif $CSCOPE_DB != ""
            cs add $CSCOPE_DB
        endif
    endif
endfunction

if has("cscope")
    set csprg=/Users/moon/bin/cscope.sh
    set csto=0
    set cst
    set nocsverb
    if filereadable("cscope.out")
        cs add cscope.out
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif
    set csverb
endif
"""""""""""""""""""""""""""""""""""""""

"""""""""""""key map"""""""""""""""
let mapleader=","
map \ ,
map H 0
map L $
" map <Space> m`#``
map <esc> :noh<cr>
map j gjzz
map k gkzz
map n nzz
xnoremap p pgvy
map <s-n> <s-n>zz
map * *``zz
map # #``zz
map <c-b> <c-b>zz
map <c-d> <c-d>zz
map <c-f> <c-f>zz
imap <C-h> <Left>
imap <C-j> <Down>
imap <C-k> <Up>
imap <C-l> <Right>
map <c-h> <c-w>hzz
map <c-i> <c-i>zz
map <c-j> <c-w>jzz
map <c-k> <c-w>kzz
map <c-l> <c-w>lzz
map <c-o> <c-o>zz
map <c-u> <c-u>zz
let g:EasyMotion_leader_key='<Space>'
nmap <c-n> :cn<CR>zz
nmap <c-p> :cp<CR>zz

map <leader>1 :b 1<CR>
map <leader>2 :b 2<CR>
map <leader>2 :b 2<CR>
map <leader>4 :b 4<CR>
map <leader>5 :b 5<CR>
map <leader>6 :b 6<CR>
map <leader>7 :b 7<CR>
map <leader>8 :b 8<CR>
map <leader>9 :b 9<CR>
let g:ctrlp_map='<leader>a'
map <leader>b :cs find
map <leader>c :cs find c <C-R>=expand("<cword>")<CR><CR>
map <leader>d :cs find d <C-R>=expand("<cword>")<CR><CR>
map <leader>e :cs find e <C-R>=expand("<cword>")<CR><CR>
map <leader>f :cs find f <C-R>=expand("<cword>")<CR><CR>
map <leader>g :cs find g <C-R>=expand("<cword>")<CR><CR>
map <leader>h :Dash <C-R>=expand("<cword>")<CR><CR>
map <leader>i :cs find i ^<C-R>=expand("<cword>")<CR>$<CR>
map <leader>j <Plug>CtrlSFPrompt
map <leader>k :Errors<cr>
map <leader>l :lclose<cr>
" let g:multi_cursor_start_key='g<C-m>'
" let g:multi_cursor_start_word_key='<C-m>'
map <leader>n :set nopaste<cr>
map <leader>p :set paste<cr>
map <leader>r :call CSRESET()<CR><cr><cr>
map <leader>s :cs find s <C-R>=expand("<cword>")<CR><CR>
map <leader>t :cs find t <C-R>=expand("<cword>")<CR><CR>
map <leader>y :w !pbcopy<CR><CR>

map <leader><leader>c :cclose<cr>
map <leader><leader>g :GundoToggle<cr>
map <leader><leader>i :TrinityToggleAll<CR>
map <leader><leader>k :NERDTreeToggle<cr>
map <leader><leader>l :TlistToggle<CR>
map <leader><leader>s :SrcExplToggle<CR><CR>
map <leader><leader>t :TagbarToggle<CR>
map <leader><leader>w :cw<CR>

map <silent> <leader>ss :source ~/.vimrc<cr>
map <silent> <leader>ee :e ~/.vimrc<cr>

vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

cmap <C-p> <Up>
cmap <C-n> <Down>

" map <leader><leader>y :YRShow<CR>
" nmap <leader>t :FufTag<cr>
" nmap <leader>f :FufFile **/<cr>
" let g:yankring_replace_n_pkey = '<leader>m'
" let g:yankring_replace_n_pkey = '<leader>n'
" nmap <C-i> :IndentLinesToggle<CR>
" nmap <leader>s :call ToggleErrors()<cr>
" nmap <leader>w :%s/\s\+$//<cr>:let @/=''<CR>
"""""""""""""""""""""""""""""""""""""""

""""""""""""plug setting"""""""""""""""
let g:carlp_cmd='CtrlP'
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let g:ctrlsf_ackprg = 'ag'
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_add_preview_to_completeopt = 0
let g:airline_powerline_fonts = 0
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:tagbar_ctags_bin = 'ctags'
let g:tagbar_width = 60

let g:yankring_history_dir = $HOME.'/.vim/'
let g:yankring_history_file = '.yankring_history'

let g:indentLine_char = '¦'
let g:indentLine_color_term = 239

let g:NERDSpaceDelims=1

let g:syntastic_enable_signs = 0
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:vim_markdown_frontmatter=1
let g:vim_markdown_folding_disabled = 1

let g:ycm_show_diagnostics_ui = 0

" highlight SyntasticErrorSign guifg=white guibg=red
