"動いてないの多め。deinが全部addでいいのかとかtomlって何、とかvimrcの言語（シェルじゃないと思うんだけど）からある程度勉強しておきたい。
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  let g:rc_dir = expand('~/.vim/rc')
  let s:toml = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'
  
  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#load_toml(s:lazy_toml,{'lazy': 1})

  call dein#add('Shougo/dein.vim')
  call dein#add('Shougo/vimproc.vim' , {'build': 'make'})
  call dein#add('Shougo/neocomplete.vim')
  call dein#add('Shougo/neomru.vim')
  call dein#add('Shougo/neosnippet')
  call dein#add('ctrlpvim/ctrlp.vim')
  call dein#add('scrooloose/nerdtree')
  call dein#add('Shougo/unite.vim')
  call dein#add('Shougo/unite-outline')
  call dein#add('osyo-manga/vim-brightest')
  call dein#add('junegunn/vim-easy-align')
  call dein#add('mattn/emmet-vim')
  call dein#add('rking/ag.vim')
  call dein#add('kana/vim-submode')
  call dein#add('altercation/vim-colors-solarized')
  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

syntax on
set background=dark
"set lines=55
"set columns=180
colorscheme solarized
set backspace=start,eol,indent
set whichwrap=b,s,[,],,~
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4
set cursorline
"set number
set fenc=utf-8
" バックアップファイルを作らない
set nobackup
" " スワップファイルを作らない
set noswapfile
" " 編集中のファイルが変更されたら自動で読み直す
set autoread
" " バッファが編集中でもその他のファイルを開けるように
set hidden
" " 入力中のコマンドをステータスに表示する
set showcmd
"
"
" " 見た目系
" " 行番号を表示
" " set number
" " 現在の行を強調表示
set cursorline
" " 現在の行を強調表示（縦）
set cursorcolumn
" " 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" " インデントはスマートインデント
set smartindent
" " ビープ音を可視化
set visualbell
" " 括弧入力時の対応する括弧を表示
set showmatch
" " ステータスラインを常に表示
set laststatus=2
" " コマンドラインの補完
set wildmode=list:longest
" " 折り返し時に表示行単位での移動できるようにする
set guifont=Ricty-RegularForPowerline:h14
nnoremap j gj
nnoremap k gk
"
"
" " Tab系
" " 不可視文字を可視化(タブが「▸-」と表示される)
" " 多分これも機能してない。.tmux.confのせい（で競合してるの）だと思うのだけれどvimrcは機能してないものが多い。
set list listchars=tab:\▸\-
" " Tab文字を半角スペースにする
set expandtab
" " 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=2
" " 行頭でのTab文字の表示幅
set shiftwidth=2
"
"
" " 検索系
" " 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" " 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" " 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" " 検索時に最後まで行ったら最初に戻る
set wrapscan
" " 検索語をハイライト表示
set hlsearch
" " ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>
nnoremap <silent><C-e> :NERDTreeToggle<CR>
inoremap<silent>jj <ESC>


"画面分割周り
"書いてはいるけど機能しない。tmuxが原因？画面分割はC-a（Prefix）＋| or  - で。
nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap sn gt
nnoremap sp gT
nnoremap sr <C-w>r
nnoremap s= <C-w>=
nnoremap sw <C-w>w
nnoremap so <C-w>_<C-w>|
nnoremap sO <C-w>=
nnoremap sN :<C-u>bn<CR>
nnoremap sP :<C-u>bp<CR>
nnoremap st :<C-u>tabnew<CR>
nnoremap sT :<C-u>Unite tab<CR>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>q<CR>
nnoremap sQ :<C-u>bd<CR>
nnoremap sb :<C-u>Unite buffer_tab -buffer-name=file<CR>
nnoremap sB :<C-u>Unite buffer -buffer-name=file<CR>
noremap ; :
noremap : ;
call submode#enter_with('bufmove', 'n', '', 's>', '<C-w>>')
call submode#enter_with('bufmove', 'n', '', 's<', '<C-w><')
call submode#enter_with('bufmove', 'n', '', 's+', '<C-w>+')
call submode#enter_with('bufmove', 'n', '', 's-', '<C-w>-')
call submode#map('bufmove', 'n', '', '>', '<C-w>>')
call submode#map('bufmove', 'n', '', '<', '<C-w><')
call submode#map('bufmove', 'n', '', '+', '<C-w>+')
call submode#map('bufmove', 'n', '', '-', '<C-w>-')
