set nocompatible

so $HOME/dotfiles/.vim/plugins.vim

syntax enable
set backspace=indent,eol,start			"Make backspace behave like it should
let mapleader=','				"The default leader is backslash but a comma is better

"----------------Visuals-----------------"
colorscheme atom-dark

set number 					"Let's activate line number
set noerrorbells visualbell t_vb= "No error bells
set linespace=17				"Line space in macvim
set macligatures				"Pretty symbols
set guifont=Fira_Code:h14			"Set font and font size
set t_CO=256
set guioptions-=e
set guioptions-=l			"Remove scrollbar on lefthandside
set guioptions-=L
set guioptions-=r
set guioptions-=R

" Tabs and spacing
set tabstop=4 
set shiftwidth=4 
set softtabstop=4
set expandtab
set smarttab

set ignorecase				"Ignore case if searcing
set smartcase				"Ignore case if all lowercase
set autoindent
set copyindent
set autowriteall
set complete=.,w,b,u        "set our desired autocomplete matching


"----------------Searching-----------------"
set hlsearch
set incsearch


"----------------Commenting-----------------"
nmap <leader>c :call CommentLine()<cr>
nmap <leader>cc :call UnCommentLine()<cr>

vnoremap <leader>cb :call RangeCommentLine()<cr>
vnoremap <leader>ccb :call RangeUnCommentLine()<cr>


"----------------Plugin-----------------"
"/
"/ CtrP
"/
nmap <D-r> :CtrlPBufTag<cr>
nmap <D-e> :CtrlPMRUFiles<cr>
nmap <D-p> :CtrlP<cr>
" I don't want to pull up these folders/files when calling CtrlP
set wildignore+=*/public/**


"Ignore in search
let g:trlp_custom_ignore = 'node_modules\DS_Store\|git'
"Order search results
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

"/
"/ NERDTreee
"/
let NERDTreeHijackNertrw = 0

"/
"/ Insert Use PHP
"/
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>n <Esc>:call IPhpInsertUse()<cr>
autocmd FileType php noremap <Leader>n :call PhpInsertUse()<cr>

function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a', 'n')
endfunction
autocmd FileType php inoremap <Leader>nf <Esc>:call IPhpExpandClass()<cr>
autocmd FileType php noremap <Leader>nf :call PhpExpandClass()<cr>

"/
"/ vim-php-cs-fixer
"/
let g:php_cs_fixer_level = "psr2"
let g:php_cs_fixer_rules = "@PSR2" 

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
"Make it easy to add snippets
nmap <Leader>es :e ~/.vim/snippets/
nmap <Leader>rs :call ReloadAllSnippets()<cr>
"Clear highlight in search
nmap <Leader><space> :nohlsearch<cr>
"Make NERDTree easier to toggle
nmap <D-1> :NERDTreeToggle<cr>
"Search tags
nmap <Leader>f :tags<space>
" Fast saves
nmap <leader>w :w!<cr>
"Fast close buffer
nmap <leader>x :bd<cr>

"Testing
nmap <Leader>t :!php artisan dusk<cr>
nmap <Leader>tf :!php artisan dusk filter %<cr>

"----------------Macros-----------------"


"Sort PHP use statements
"http://stackoverflow.com/questions/11531073/how-do-you-sort-a-range-of-lines-by-length
vmap <Leader>su ! awk '{ print length(), $0 \| "sort -n \| cut -d\\  -f2-" }'<cr>

"cs fixer
nnoremap <silent><leader>pf :call PhpCsFixerFixFile()<CR>

"----------------Laravel specific-----------------"
nmap <Leader>lm :!php artisan make:
nmap <Leader><Leader>c :CtrlP app/Http/Controllers/<cr>
nmap <Leader><Leader>m :CtrlP app/<cr>
nmap <Leader><Leader>v :CtrlP resources/views/<cr>
nmap <Leader><Leader>t :CtrlP tests/<cr>
nmap <Leader><Leader>js :CtrlP resources/assets/js<cr>
nmap <Leader><Leader><leader>c :CtrlP resources/assets/sass<cr>


nmap <Leader><Leader>vd :CtrlP vendor/<cr>

"----------------Autocommand-----------------"
"Automatically soruce the Vimrc file on save.
augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END




"----------------Functions-----------------"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RENAME CURRENT FILE (thanks Gary Bernhardt)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
map <Leader>rn :call RenameFile()<cr>
