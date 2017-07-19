"branch test
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
  
  call dein#add('Shougo/neocomplete.vim')
  call dein#add('Shougo/unite.vim')
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
set vb t_vb=
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

"Note: This option must be set in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
      \ 'default' : '',
          \ 'vimshell' : $HOME.'/.vimshell_hist',
              \ 'scheme' : $HOME.'/.gosh_completions'
                      \ }

                      " Define keyword.
                      if !exists('g:neocomplete#keyword_patterns')
                            let g:neocomplete#keyword_patterns = {}
                            endif
                            let g:neocomplete#keyword_patterns['default'] = '\h\w*'

                            " Plugin key-mappings.
                            inoremap <expr><C-g>     neocomplete#undo_completion()
                            inoremap <expr><C-l>     neocomplete#complete_common_string()

                            " Recommended key-mappings.
                            " <CR>: close popup and save indent.
                            inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
                            function! s:my_cr_function()
                              return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
                                " For no inserting <CR> key.
                                  "return pumvisible() ? "\<C-y>" : "\<CR>"
                                  endfunction
                                  " <TAB>: completion.
                                  inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
                                  " <C-h>, <BS>: close popup and delete backword char.
                                  inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
                                  inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
                                  " Close popup by <Space>.
                                  "inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

                                  " AutoComplPop like behavior.
                                  "let g:neocomplete#enable_auto_select = 1

                                  " Shell like behavior(not recommended).
                                  "set completeopt+=longest
                                  "let g:neocomplete#enable_auto_select = 1
                                  "let g:neocomplete#disable_auto_complete = 1
                                  "inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

                                  " Enable omni completion.
                                  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
                                  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
                                  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
                                  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
                                  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

                                  " Enable heavy omni completion.
                                  if !exists('g:neocomplete#sources#omni#input_patterns')
                                      let g:neocomplete#sources#omni#input_patterns = {}
                                      endif
                                      "let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
                                      "let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
                                      "let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

                                      " For perlomni.vim setting.
                                      " https://github.com/c9s/perlomni.vim
                                      let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

highlight Pmenu ctermbg=4 ctermfg=0
highlight PmenuSel ctermbg=1
highlight PMenuSbar ctermbg=none



" 補完ウィンドウの設定
set completeopt=menuone




" rsenseでの自動補完機能を有効化
let g:rsenseUseOmniFunc = 1
" let g:rsenseHome = '/usr/local/lib/rsense-0.3'

" auto-ctagsを使ってファイル保存時にtagsファイルを更新
let g:auto_ctags = 1

" 起動時に有効化
let g:neocomplcache_enable_at_startup = 1

" 大文字が入力されるまで大文字小文字の区別を無視する
let g:neocomplcache_enable_smart_case = 1

" _(アンダースコア)区切りの補完を有効化
let g:neocomplcache_enable_underbar_completion = 1

let g:neocomplcache_enable_camel_case_completion  =  1

" 最初の補完候補を選択状態にする
let g:neocomplcache_enable_auto_select = 1

" ポップアップメニューで表示される候補の数
let g:neocomplcache_max_list = 20

" シンタックスをキャッシュするときの最小文字長
let g:neocomplcache_min_syntax_length = 3

" 補完の設定
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
    endif
    let g:neocomplete#force_omni_input_patterns.ruby = '[^.*\t]\.\w*\|\h\w*::'

    if !exists('g:neocomplete#keyword_patterns')
              let g:neocomplete#keyword_patterns = {}
              endif
              let g:neocomplete#keyword_patterns['default'] = '\h\w*'

