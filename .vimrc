set nocompatible

so ~/.vim/plugins.vim

syntax enable
set backspace=indent,eol,start			"Make backspace behave like it should
let mapleader = ','				"The default leader is backslash but a comma is better

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

"----------------Searching-----------------"
set hlsearch
set incsearch


"----------------Plugin-----------------"
"/
"/ CtrP
"/
let g:ctrlp_custom_ignore = 'node_modules\DS_Store\|git'		"Ignore in search
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'	"Order search results

"/
"/ NERDTreee
"/
let NERDTreeHijackNertrw = 0

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
nmap <c-r> :CtrlPBufTag<cr>
nmap <D-e> :CtrlPMRUFiles<cr>
nmap <D-p> :CtrlP<cr>


"----------------Autocommand-----------------"
"Automatically soruce the Vimrc file on save.
augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END
