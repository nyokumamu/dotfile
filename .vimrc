" vim basic settings

syntax on
filetype plugin indent on

set number
set ruler
set title
set nobackup
set noswapfile
" show invisible character
set list
set listchars=tab:>\ ,extends:<
" beep
set visualbell
" add multibyte in text option
set formatoptions=lmoq
" enable delete former line by backspace
set backspace=2
" not to stop line top and end
set whichwrap=b,s,h,l,<,>,[,]
" 対応するカッコを強調
set showmatch
" 対応するカッコを補完
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
vnoremap { "zdi^V{<C-R>z}<ESC>
vnoremap [ "zdi^V[<C-R>z]<ESC>
vnoremap ( "zdi^V(<C-R>z)<ESC>
vnoremap " "zdi^V"<C-R>z^V"<ESC>
vnoremap ' "zdi'<C-R>z'<ESC>

highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/
autocmd WinEnter * match WhitespaceEOL /\s\+$/

"" status line
" show current vim mode
set showmode

"" show encoding and EOF
if winwidth(0) >= 120
    set statusline=%<[%n]%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%y\%F%=[%<%{fnamemodify(getcwd(),':~')}][%{GetB()}]\ %l,%c%V%8P
else
    set statusline=%<[%n]%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%y\%f%=[%<%{fnamemodify(getcwd(),':~')}][%{GetB()}]\ %l,%c%V%8P
endif

function! GetB()
    let c = matchstr(getline('.'), '.', col('.') - 1)
    let c = iconv(c, &enc, &fenc)
    return String2Hex(c)
endfunction
" help eval-examples
" The function Nr2Hex() returns the Hex string of a number.
func! Nr2Hex(nr)
    let n = a:nr
    let r = ""
    while n
        let r = '0123456789ABCDEF'[n % 16] . r
        let n = n / 16
    endwhile
    return r
endfunc
" The function String2Hex() converts each character in a string to a two
" character Hex string.
func! String2Hex(str)
    let out = ''
    let ix = 0
    while ix < strlen(a:str)
        let out = out . Nr2Hex(char2nr(a:str[ix]))
        let ix = ix + 1
    endwhile
    return out
endfunc

"" search
" when use small letter ignore case
set ignorecase
set smartcase
" indent setting
set smartindent
" highlight searchword
set hlsearch
" when search end return top
set wrapscan
" inc search
set incsearch
" hide highlight seachword
" nmap <esc><esc> ;nohlsearch<CR><esc>

" split right or below
set splitright
set splitbelow
" tab setting
set tabstop=4
set shiftwidth=4
set softtabstop=4
set laststatus=2
" clipboard use in OS
set clipboard+=unnamed
" esc key map
imap <C-g> <esc>
vmap <C-g> <esc>

 omit t when you use ( or )
" don't move. because of original command live
" onoremap ) t)
" onoremap ( t(
" vnoremap ) t)
" vnoremap ( t(

" set filetype
autocmd BufNewFile,BufRead *.wsgi set filetype=python
autocmd BufNewFile,BufRead *.vimrc set filetype=vim
autocmd BufNewFile,BufRead *.vimperatorrc set filetype=vim
autocmd BufNewFile,BufRead *.vrapperrc set filetype=vim
autocmd BufNewFile,BufRead *.go set filetype=go

" Enable omni completion.
autocmd FileType eruby,html,markdown setlocal expandtab omnifunc=htmlcomplete#CompleteTags
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType ruby setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2

augroup MyXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype eruby inoremap <buffer> </ </<C-x><C-o>
augroup END

""
" Ruby
" extra space
let ruby_space_errors=1

""
" PHP
" sql syntax in string
let php_sql_query=1
" html syntax in string
let php_htmlInStrings=1
" ban short tag
let php_noShortTags=1

"""
" plugins

" jslint.vim
"function! s:javascript_filetype_settings()
" autocmd BufLeave     <buffer> call jslint#clear()
" autocmd BufWritePost <buffer> call jslint#check()
" autocmd CursorMoved  <buffer> call jslint#message()
"endfunction
"autocmd FileType javascript call s:javascript_filetype_settings()


""
" neocomplecache
"
"" Use neocomplcache.
"let g:neocomplcache_enable_at_startup = 1
"" Use smartcase.
"let g:neocomplcache_enable_smart_case = 1
"" Use auto select
""let g:neocomplcache_enable_auto_select = 1
"" Use camel case completion.
"let g:neocomplcache_enable_camel_case_completion = 1
"" Use underbar completion.
"let g:neocomplcache_enable_underbar_completion = 1
"" Set minimum syntax keyword length.
"let g:neocomplcache_min_syntax_length = 3
"" Set manual completion length.
"let g:neocomplcache_manual_completion_start_length = 0
"
"" " Define dictionary.
" let g:neocomplcache_dictionary_filetype_lists = {
"\'default' : '',
"\ 'java' : $HOME.'/.vim/dict/java.dict',
"\ 'cpp' : $HOME.'/.vim/dict/cpp.dict',
"\ 'javascript' : $HOME.'/.vim/dict/javascript.dict',
"\ 'css' : $HOME.'/.vim/dict/css.dict',
"\ 'ocaml' : $HOME.'/.vim/dict/ocaml.dict',
"\ 'perl' : $HOME.'/.vim/dict/perl.dict',
"\ 'php' : $HOME.'/.vim/dict/php.dict',
"\ 'ruby' : $HOME.'/.vim/dict/ruby.dict',
"\ 'python' : $HOME.'/.vim/dict/python.dict',
"\ 'vim' : $HOME.'/.vim/dict/vim.dict'
"\ }

"" Define keyword.
"if !exists('g:neocomplcache_keyword_patterns')
"   let g:neocomplcache_keyword_patterns = {}
"endif
"let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
""
""let g:neocomplcache_snippets_dir = $HOME.'/snippets'

hi Pmenu ctermbg=white ctermfg=darkgray
hi PmenuSel ctermbg=blue ctermfg=white
hi PmenuSbar ctermbg=0 ctermfg=9

hi Search ctermbg=white ctermfg=darkgray

:set tags=tags

:source $VIMRUNTIME/macros/matchit.vim
let b:match_words = "\<begin\>:\<end\>"


set fileencoding=utf-8
set fileencodings=utf-8,cp932,euc-jp,iso-2022-jp,cp943,

" ターミナルに出力する時に利用するエンコーディング
" 特に指定しなければencodingが使われる
set termencoding=utf-8

" vim 内部で扱うエンコーディング
set encoding=utf-8

set expandtab

" もろもろの設定
autocmd FileType html,js,css,yaml,sql,gs :set expandtab
autocmd FileType html,js,css,yaml,sql,gs :set fileencoding=utf-8
autocmd FileType html,js,css,yaml,sql,gs :set fileencodings=utf-8,cp932,euc-jp,iso-2022-jp,cp943,cp932
autocmd FileType html,js,css,yaml,sql,gs :set swapfile
autocmd FileType perl :set expandtab
autocmd FileType perl :set ts=4 sw=4 sts=0
autocmd FileType perl :set fileencoding=utf-8
autocmd FileType perl :set fileencodings=utf-8,euc-jp,cp932,iso-2022-jp,cp943,cp932
autocmd FileType perl :set swapfile
autocmd FileType sql :set expandtab
autocmd FileType sql :set ts=2 sw=2 sts=2
autocmd FileType sql :set enc=utf8

set tabline=%!MyTabLine()

function! MyTabLine()
  let s = ''
  for i in range(tabpagenr('$'))
    " select the highlighting
    if i + 1 == tabpagenr()
      let s .= '%#TabLineSel#'
    else
      let s .= '%#TabLine#'
    endif

    " set the tab page number (for mouse clicks)
    let s .= '%' . (i + 1) . 'T'

    " the label is made by MyTabLabel()
    let s .= ' %{MyTabLabel(' . (i + 1) . ')} '
  endfor

  " after the last tab fill with TabLineFill and reset tab page nr
  let s .= '%#TabLineFill#%T'

  " right-align the label to close the current tab page
  if tabpagenr('$') > 1
    let s .= '%=%#TabLine#%999XClose'
  endif

  return s
endfunction

let g:use_Powerline_dividers = 1

function! MyTabLabel(n)
    let buflist = tabpagebuflist(a:n)
    let winnr = tabpagewinnr(a:n)
    let altbuf = bufname(buflist[winnr - 1])

    " $HOME を消す
    let altbuf = substitute(altbuf, expand('$HOME/'), '', '')

    let altbuf = '|' . altbuf . '|'

    " タブ番号を付加
    let altbuf = a:n . ':' . altbuf

    return altbuf
endfunction

" n で検索した時に、 検索結果を画面の真ん中に
nmap n nzz
" ↑の逆
nmap N Nzz
" ハイライトした検索ワードを画面の真ん中に
nmap * *zz
" ↑の逆
nmap # #zz

set cursorline


set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'
" My Bundles here:
"
" original repos on github
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'tpope/vim-rails.git'
Bundle 'Shougo/unite.vim'
Bundle 'scrooloose/syntastic.git'

let g:syntastic_mode_map = {
\  "mode": "passive",
\  "active_filetypes": ["javascript"],
\  "passive_filetypes": ["html", "perl"],
\}

" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'nathanaelkane/vim-indent-guides'
" ...
filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..


" vim-indent-guides
colorscheme elflord
let g:indent_guides_auto_colors=0
let g:indent_guides_enable_on_vim_startup=1
hi IndentGuidesOdd   ctermbg=cyan
hi IndentGuidesEven  ctermbg=yellow
let g:indent_guides_start_level=1
let g:indent_guides_guide_size=1

" vimを閉じた時に自動的にsyntax_check
" これをvimrcにかくと、:w時にチェックしてくれる
" lperlでSyntaxチェック
function! _CheckPerl()
    exe ":! /home/game/git/sg-liar/script/devtool/lperl %"
endfunction

command! CheckCode call _CheckPerl()
autocmd BufWritePre *.pm :CheckCode
