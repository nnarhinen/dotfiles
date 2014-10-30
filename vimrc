set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()




set nocompatible      " Use vim, no vi defaults
set number            " Show line numbers
set ruler             " Show line and column number
syntax enable         " Turn on syntax highlighting allowing local overrides
set encoding=utf-8    " Set default encoding to UTF-8

""
"" Whitespace
""

set nowrap                        " don't wrap lines
set tabstop=2                     " a tab is two spaces
set shiftwidth=2                  " an autoindent (with <<) is two spaces
set expandtab                     " use spaces, not tabs
set list                          " Show invisible characters
set backspace=indent,eol,start    " backspace through everything in insert mode

if exists("g:enable_mvim_shift_arrow")
  let macvim_hig_shift_movement = 1 " mvim shift-arrow-keys
endif

  " List chars
set listchars=""                  " Reset the listchars
set listchars=tab:\ \             " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:.            " show trailing spaces as dots
set listchars+=extends:>          " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
set listchars+=precedes:<         " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
  "
  "                                                                     ""
  "" Searching
  ""

set hlsearch    " highlight matches
set incsearch   " incremental searching
set ignorecase  " searches are case insensitive...
set smartcase   " ... unless they contain at least one capital letter

set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*
set wildignore+=*.swp,*~,._*
  "
  " ""
  " "" Backup and swap files
  " ""
  "
set backupdir=~/.vim/_backup//    " where to put backup files.
set directory=~/.vim/_temp//      " where to put swap files.


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
Bundle 'scrooloose/nerdtree'
Bundle 'basepi/vim-conque'
Bundle 'skwp/vim-ruby-conque'
Bundle 'kien/ctrlp.vim'
Bundle 'groenewege/vim-less'
Bundle 'digitaltoad/vim-jade'
Bundle 'nono/vim-handlebars'
Bundle 'ervandew/supertab'
Bundle 'guns/vim-clojure-static'
Bundle 'wavded/vim-stylus'
Bundle 'tpope/vim-fireplace'
Bundle 'flazz/vim-colorschemes'
Bundle 'mxw/vim-jsx'
Bundle 'pangloss/vim-javascript'
Bundle 'scrooloose/syntastic'
" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'vim-coffee-script'
Bundle 'haskell.vim'
" non github repos
Bundle 'git://git.wincent.com/command-t.git'
" ...

filetype plugin indent on     " required!

let s:rootDir = fnamemodify(expand("<sfile>"), ":h")

let g:syntastic_javascript_checkers = ['jsxhint']

nmap <silent> <Leader>rcrr :call RunRubyCurrentFileConque()<CR>
nmap <silent> <Leader>rcss :call RunRspecCurrentFileConque()<CR>
nmap <silent> <Leader>rcll :call RunRspecCurrentLineConque()<CR>
nmap <silent> <Leader>rccc :call RunCucumberCurrentFileConque()<CR>
nmap <silent> <Leader>rccl :call RunCucumberCurrentLineConque()<CR>
nmap <silent> <Leader>rcRR :call RunRakeConque()<CR>
nmap <silent> <Leader>rcrl :call RunLastConqueCommand()<CR>

nnoremap <silent> <C-s> :call RelatedSpecVOpen()<CR>
nnoremap <silent> ,<C-s> :call RelatedSpecOpen()<CR>
" Cmd-Shift-R for RSpec
nmap <silent> <D-R> :call RunRspecCurrentFileConque()<CR>
" " Cmd-Shift-L for RSpec Current Line
nmap <silent> <D-L> :call RunRspecCurrentLineConque()<CR>
" " ,Cmd-R for Last conque command
nmap <silent> ,<D-R> :call RunLastConqueCommand()<CR>

if filereadable(expand("~/.vimrc.before"))
  source ~/.vimrc.before
endif

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'rc'

syntax enable
set autoindent cindent smartindent

autocmd BufNewFile,BufRead *.coffee set filetype=coffee
autocmd BufNewFile,BufReadPost *.jade set filetype=jade
autocmd BufNewFile,BufRead *.clj,*.cljs set filetype=clojure
autocmd BufNewFile,BufRead *.less setf less
autocmd BufNewFile,BufRead *.styl setf stylus
if has("autocmd")
  au BufNewFile,BufRead *.handlebars,*.hbs,*.hb set filetype=handlebars
endif
autocmd BufNewFile,BufRead *.ts set filetype=typescript

noremap <Left> :tabp<CR>
noremap <Right> :tabn<CR>


"" GVIM
if has('gui_running')
  colorscheme desert
  set guifont="Source Code Pro Medium 10"
else
  colorscheme bluegreen
endif

" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..