" vim: set foldmarker={,} foldlevel=0 foldmethod=marker:
" Description: 适合自己使用的vimrc文件
" Author: Stonelee - istonelee@gmail.com
" Blog: stonelee.info

" 插件 {
  " 关闭 vi 兼容模式
  set nocompatible
  filetype off

  " 使用vundle管理插件
  set rtp+=~/.vim/bundle/vundle/
  call vundle#rc()

  " :BundleList          - list configured bundles
  " :BundleInstall(!)    - install(update) bundles
  " :BundleSearch(!) foo - search(or refresh cache first) for foo
  " :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
  Bundle 'gmarik/vundle'

  "颜色样式
  Bundle 'altercation/vim-colors-solarized'

  " 目录树
  Bundle 'scrooloose/nerdtree'
  Bundle 'jistr/vim-nerdtree-tabs'

  "session管理
  Bundle 'vim-scripts/sessionman.vim'
  " buffer管理
  Bundle 'corntrace/bufexplorer'

  "语法检查,js检查可以安装jshint，node
  Bundle 'scrooloose/syntastic'

  "快速移动,<leader><leader>w or <leader><leader>f{char}
  Bundle 'Lokaltog/vim-easymotion'
  " 对%命令进行扩展使得能在嵌套标签和语句之间跳转
  Bundle 'matchit.zip'

  "通过文件名模糊查找file，buffer，mru，tag
  "ctrl+p
  Bundle 'kien/ctrlp.vim'

  if executable('ack')
    "通过内容查找,需要安装ack
    "Ack content
    Bundle 'mileszs/ack.vim'
  endif

  " git集成
  Bundle 'tpope/vim-fugitive'

  " 代码片段
  Bundle "MarcWeber/vim-addon-mw-utils"
  Bundle "tomtom/tlib_vim"
  Bundle "MarcWeber/ultisnips"
  Bundle "stonelee/vim-snippets"

  " html
  Bundle 'mattn/zencoding-vim'

  " 注释
  Bundle 'scrooloose/nerdcommenter'

  " 格式规整
  " :Tabularize /"
  Bundle 'godlygeek/tabular'

  " 增删改标签, 配合repeat.vim实现.重复操作。
  " ds” 删除两端的”“
  " dst 删除两端的标签
  " cs”{ 将两端的“”改为{  } 有空格
  " cs”} 将两端的“”改为{} 无空格
  " cs'<q> 将'Hello world!'改为 <q>Hello world!</q>
  " yss) 两端加上()
  " ysiw） 将光标所在单词两端加上（）
  " V可视化后,S然后<div>整行加div标签
  Bundle 'tpope/vim-surround'
  Bundle 'tpope/vim-repeat'

  "auto-close chars
  Bundle 'Townk/vim-autoclose'

  " 美化js,html,css代码
  Bundle 'maksimr/vim-jsbeautify'
  "markdown
  Bundle 'plasticboy/vim-markdown'

  "handlebars
  Bundle 'nono/vim-handlebars'

  "less
  Bundle 'groenewege/vim-less'
  "scss
  Bundle 'cakebaker/scss-syntax.vim'

  filetype plugin indent on
" }

" 基本设置 {
  syntax on                " 开启语法着色

  set mouse=a              " 如果不设置鼠标操作会出现各种问题

  set fileencodings=utf-8,gbk,ucs-bom,cp936 "打开文件时按照这个列表解码
  "set encoding=utf-8                       "设置vim以何种编码显示文件.如果设置会导致window下中文菜单和提示乱码
  "set fileencoding=utf-8                   "保存时使用,可以使用这个命令更改文件格式

  set guifont=Consolas:h13 " 字体
  set cursorline           " 高亮鼠标当前行
  if v:version>702
    set relativenumber     " 显示相对行号
  else
    set number             " 显示行号
  endif

  set incsearch            " 输入搜索词时实时自动寻找
  set hlsearch             " 高亮搜索的词
  set ignorecase smartcase " 大小写不敏感,但如果有大写字母则大小写敏感

  set list                 " 可视化不可见字符
  "trail为空格,eol为末尾。tab:xy,其中x只显示一次，y则占有剩余的空间
  set listchars=tab:>-,trail:.,eol:$

  set expandtab                  " tabs代替space
  set tabstop=2                  " tab宽度
  set softtabstop=2              " Backspace时一次后退宽度
  set shiftwidth=2               " 缩进[>]宽度

  set nowrap                     " 不自动换行

  set backspace=indent,eol,start " 不设定在插入状态无法用退格键和 Delete 键删除回车符

  " 状态栏{
  set laststatus=2

  set statusline=%<%F                        " 文件路径
  set statusline+=\ %w%h%m%r                 " Options
  set statusline+=\ %{fugitive#statusline()} " Git
  set statusline+=%=                         " 右对齐
  set statusline+=[%{&ff}/%Y]                " 文件格式/文件类型
  set statusline+=\ [%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}] "encoding&BOM
  set statusline+=\ %l,%c\ %P,%L             " 坐标以及文件行数
  " }

" }

" 按键设置 {
  let mapleader=','

  "ESC太远啦
  imap jj <ESC>

  "模拟通常的编辑器操作
  vmap <C-x> "+x
  vmap <C-c> "+y
  map <C-v> "+p
  map <C-a> ggVG

  "折叠
  nmap <space> za

  "跳转
  nmap <tab> %

  "窗口间移动
  nmap <C-h> <C-w>h
  nmap <C-j> <C-w>j
  nmap <C-k> <C-w>k
  nmap <C-l> <C-w>l
  "打开新窗口
  nmap <leader>w <C-w>v<C-w>l

  "tab间移动
  map <S-H> gT
  map <S-L> gt

  "连续移动代码块
  vnoremap < <gv
  vnoremap > >gv

  " Easier horizontal scrolling
  map zl zL
  map zh zH

  " 全文搜索选中的文字
  " 向下搜索
  vmap <silent> <leader>f y/<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>
  " 向上搜索
  vmap <silent> <leader>F y?<c-r>=escape(@", '\\/.*$^~[]')<cr><cr>

  " 删除所有行末尾空格
  nmap <F12> :%s/[ \t\r]\+$//g<CR>

  " w!!使用sudo保存文件
  cmap w!! w !sudo tee %

  " json -> js
  autocmd BufRead,BufNewFile *.json set filetype=javascript
" }

" 插件设置 {

  "快速打开.vimrc
  if has('win32') || has('win64')
    nmap <leader>ee :edit ~/vimrc/vimrc<cr>
    autocmd! bufwritepost .vimrc source ~/_vimrc "自动更新
  else
    nmap <leader>ee :edit ~/.vimrc<cr>
    autocmd! bufwritepost vimrc source ~/.vimrc "自动更新
  endif

  " nerdtree {
      " 打开tree并复制上次的
      map <C-e> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
      let NERDTreeQuitOnOpen=1 "打开文件后关闭Tree
      let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']

      let nerdtree_tabs_open_on_gui_startup = 0 "防止启动时出现Tree
  " }

  " sessionman {
      set sessionoptions=blank,buffers,curdir,folds,tabpages,winsize
      nmap <leader>sl :SessionList<CR>
      nmap <leader>ss :SessionSave<CR>
  " }

  " vim-colors-solarized {
      set background=dark
      colorscheme solarized " 配色
      let g:solarized_termtrans=1
      let g:solarized_termcolors=256
      let g:solarized_contrast="high"
      let g:solarized_visibility="high"
      set t_Co=256
  "}

  " vim-jsbeautify {
    autocmd FileType javascript noremap <buffer> <leader>ff :call JsBeautify()<cr>
    " for html
    autocmd FileType html noremap <buffer> <leader>ff :call HtmlBeautify()<cr>
    " for css or scss
    autocmd FileType css noremap <buffer> <leader>ff :call CSSBeautify()<cr>

    "~/.editorconfig中进行配置

    "[**.js]
    "indent_style = space
    "indent_size = 2

    "[**.css]
    "indent_style = space
    "indent_size = 2

    "[**.html]
    "indent_style = space
    "indent_size = 2
    "max_char = 78
    "brace_style = expand
  "}

  " vim-handlebars {
    "将扩展名为tpl的文件的filetype识别为handlebars
    au BufRead,BufNewFile * if &ft == 'smarty' | set ft=handlebars | endif
  "}

" }

" function {
function! InitializeDirectories()
    let separator = "."
    let parent = $HOME
    let prefix = '.vim'
    let dir_list = {
                \ 'backup': 'backupdir',
                \ 'views': 'viewdir',
                \ 'swap': 'directory' }

    if has('persistent_undo')
        let dir_list['undo'] = 'undodir'
    endif

    for [dirname, settingname] in items(dir_list)
        let directory = parent . '/' . prefix . dirname . "/"
        if exists("*mkdir")
            if !isdirectory(directory)
                call mkdir(directory)
            endif
        endif
        if !isdirectory(directory)
            echo "Warning: Unable to create backup directory: " . directory
            echo "Try: mkdir -p " . directory
        else
            let directory = substitute(directory, " ", "\\\\ ", "g")
            exec "set " . settingname . "=" . directory
        endif
    endfor
endfunction
call InitializeDirectories()
" }
