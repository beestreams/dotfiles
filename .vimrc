set nocompatible

so $HOME/dotfiles/.vim/plugins.vim

syntax enable
set backspace=indent,eol,start			"Make backspace behave like it should
let mapleader=','				"The default leader is backslash but a comma is better

"----------------Visuals-----------------"
colorscheme atom-dark

set number 					"Let's activate line number
set linespace=17				"Line space in macvim
set macligatures				"Pretty symbols
set guifont=Fira_Code:h14			"Set font and font size
set t_CO=256
set guioptions-=e
set guioptions-=l			"Remove scrollbar on lefthandside
set guioptions-=L
set guioptions-=r
set guioptions-=R
set tabstop=4
set ignorecase				"Ignore case if searcing
set smartcase				"Ignore case if all lowercase
set autoindent
set copyindent

"----------------Searching-----------------"
set hlsearch
set incsearch


"----------------Plugin-----------------"
"/
"/ CtrP
"/
nmap <D-r> :CtrlPBufTag<cr>
nmap <D-e> :CtrlPMRUFiles<cr>
nmap <D-p> :CtrlP<cr>

"Ignore in search
let g:trlp_custom_ignore = 'node_modules\DS_Store\|git'
"Order search results
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'

"/
"/ NERDTreee
"/
let NERDTreeHijackNertrw = 0

"/
"/ Markdown
"/
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_frontmatter = 1

"----------------Split Management-----------------"
set splitbelow
set splitright
"Map splitting to simpler commands
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>

"----------------Mappings-----------------"
"Make it easy to edit vimrc file"
nmap <Leader>ev :tabedit $MYVIMRC<cr>
"Clear highlight in search
nmap <Leader><space> :nohlsearch<cr>
"Make NERDTree easier to toggle
nmap <D-1> :NERDTreeToggle<cr>
"Search tags
nmap <Leader>f :tags<space>

"----------------Autocommand-----------------"
"Automatically soruce the Vimrc file on save.
augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END
