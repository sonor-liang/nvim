" stdpath('config')=C:\Users\小米笔记本\AppData\Local\nvim
" stdpath('data')=C:\Users\小米笔记本\AppData\Local\nvim-data
"
" 常用设置
" 
"
let $LEARNINGNOTES="R:\\LearningNotes\\"
"
" 设置行号
set number
" 设置颜色主题
"colorscheme slate
syntax enable
set background=light
colorscheme solarized
" 按F2进入粘贴模式
set pastetoggle=<F2>

"新建标签页
nnoremap <C-n> :tabnew newTab
" 缩进问题
inoremap <tab> <space><space><space><space>
inoremap {<CR> {<CR><CR><backspace>}<up><tab>
set tabstop=4 "设定tab宽度为4个字符
set shiftwidth=4 "设定自动缩进为4个字符
" 高亮搜索
set hlsearch
"在Vim插入模式下按下 Tab 键时，输入到Vim中的都是空格
set expandtab
" 寄存器和系统粘贴板
set clipboard=unnamed
"设置折叠方式
set foldmethod=indent
"
"
"
"
"
"
" 一些方便的映射
let mapleader=','
let g:mapleader=','
inoremap <A-l> <right>
inoremap <A-k> <up>
inoremap <A-j> <down>
inoremap <A-h> <left>
"使用jj进入normal模式
inoremap jj <esc>`^
"使用leader+w直接保存
inoremap <leader>w <Esc>:w<cr>
noremap <leader>w :w<cr>

"切换buffer
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> [n :bnext<CR>

"使用ctrl+h/j/k/l 切换窗口
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" 插入模式下删除整行
inoremap <C-d> <Esc>ddi
"sudo to write
"cnoremap w!! w !sudo tee % >/dev/null

" json格式化
" com! FormatJSON %!python3 -m json.tool
"
"
"
"
"
"插件管理
"
"
"
"
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'https://github.com/mhinz/vim-startify.git',

Plug 'https://github.com/tomasr/molokai.git'
let g:rehash256 = 1
"原始背景色"
"let g:molokai_original = 1

Plug 'https://github.com/preservim/nerdtree.git',{'on':'NERDTreeToggle'}
nnoremap <silent> <F9> :NERDTreeToggle<CR> 

Plug 'https://github.com/vim-airline/vim-airline'
"" 设置状态栏
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_alt_sep = '|'
"let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#formatter = 'default'
"
"Plug 'https://github.com/preservim/tagbar.git'
"nnoremap <silent> <F10> :TagbarToggle<CR> 
"let g:tagbar_ctags_bin = 'ctags'        "tagbar依赖ctags插件
"let g:tagbar_left = 1                   "让tagbar在页面左侧显示，默认右边
"let g:tagbar_width = 30                 "设置tagbar的宽度为30列，默认40
"let g:tagbar_autofocus = 1              "这是tagbar一打开，光标即在tagbar页面内，默认在vim打开的文件内
"let g:tagbar_sort = 0                   "设置标签不排序，默认排序


" MarkDown插件
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}





" MarkDown配置
"---------------------------------------------------------------------------
" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" default: ''
let g:mkdp_browser = 'chrome'

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default: v:false
" disable_filename: if disable filename header for preview page, default: 0
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0
    \ }

" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''

" use a custom port to start server or random for empty
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'

" recognized filetypes
" these filetypes will have MarkdownPreview... commands
let g:mkdp_filetypes = ['markdown']


" normal/insert
"<Plug>MarkdownPreview
"<Plug>MarkdownPreviewStop
"<Plug>MarkdownPreviewToggle

" example
nmap <F5> <Plug>MarkdownPreview
nmap <F6> <Plug>MarkdownPreviewStop
nmap <F7> <Plug>MarkdownPreviewToggle
"
"
"MarkDown语法，映射快捷键
"
"加粗
inoremap <A-1> ****<left><left>
"斜体
inoremap <A-2> **<left>
"粗斜体
inoremap <A-3> ******<left><left><left> 
"多选框
inoremap <A-4> - [<space>]<space>
"全局字体样式
inoremap <A-5> <font face="仿宋" size=4 color="SaddleBrown">    
"字体样式
inoremap <A-6> <font face="Times" color="cadetblue">
"居中文字
inoremap <A-7> <center></center><left><left><left><left><left><left><left><left><left>
"下划线,html表示
inoremap <A-8> </u<left><backspace><right>></u><left><left><left><left>
" 引用块
inoremap <A-9> ><space>
nnoremap <A-9> I><space><esc>
"空格（一个汉字的宽度）
inoremap <A-0> &emsp;
nnoremap <A-0> i&emsp;&emsp;<esc>

"三级标题
inoremap <C-1> ###<space>
"四级标题
inoremap <C-2> ####<space>
"五级标题
inoremap <C-3> #####<space>
"六级标题
inoremap <C-4> ######<space>

"---------------------------------------------------------------------------




" Initialize plugin system
call plug#end()

" 插件相关配置
" 禁止startify自动切换目录
let g:startify_change_to_dir=0

" nerdtree
nmap ,v :NERDTreeFind<cr>
nmap ,g :NERDTreeToggle<cr>

" 定义函数
" func test()
	
" endfunc
