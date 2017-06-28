set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()




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

set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem,node_modules
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
Plugin 'VundleVim/Vundle.vim'

" My Plugins here:
"
" original repos on github
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'groenewege/vim-less'
Plugin 'digitaltoad/vim-jade'
Plugin 'nono/vim-handlebars'
Plugin 'ervandew/supertab'
Plugin 'wavded/vim-stylus'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'scrooloose/syntastic'
Plugin 'kennethzfeng/vim-raml'
Plugin 'goatslacker/mango.vim'
Plugin 'suan/vim-instant-markdown'
Plugin 'tpope/vim-sleuth'
" vim-scripts repos
Plugin 'L9'
Plugin 'FuzzyFinder'
Plugin 'vim-coffee-script'
" non github repos
Plugin 'git://git.wincent.com/command-t.git'
" ...
"
call vundle#end()

filetype plugin indent on     " required!

let s:rootDir = fnamemodify(expand("<sfile>"), ":h")

let g:syntastic_javascript_checkers = ['eslint']

if filereadable(expand("~/.vimrc.before"))
  source ~/.vimrc.before
endif

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'rc'

let g:jsx_ext_required = 0
let g:jsx_pragma_required = 0

syntax enable
set autoindent cindent smartindent

autocmd BufNewFile,BufRead *.coffee set filetype=coffee
autocmd BufNewFile,BufReadPost *.jade set filetype=jade
autocmd BufNewFile,BufRead *.less setf less
autocmd BufNewFile,BufRead *.styl setf stylus
autocmd BufNewFile,BufRead *.md setf markdown
if has("autocmd")
  au BufNewFile,BufRead *.handlebars,*.hbs,*.hb set filetype=handlebars
endif
autocmd BufNewFile,BufRead *.ts set filetype=typescript
autocmd BufNewFile,BufRead *.js,*.jsx set filetype=javascript.jsx

noremap <Left> :tabp<CR>
noremap <Right> :tabn<CR>


"" GVIM
if has('gui_running')
  set guifont="Source Code Pro Medium 10"
  set background=light
else
  set background=dark
endif
colorscheme mango

" Brief help
" :PluginList          - list configured bundles
" :PluginInstall(!)    - install(update) bundles
" :PluginSearch(!) foo - search(or refresh cache first) for foo
" :PluginClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Plugin command are not allowed..
