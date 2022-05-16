" vim: foldlevelstart=0 foldcolumn=1
" |Vundle configuration| {{{

set nocompatible    " switch VI compatibility off
filetype off        " turn off filetype detection. Required by Vundle

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

" let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'

" UI {{{

"      best solorscheme ever
if has('nvim')
    Plugin 'iCyMind/NeoSolarized'
else
    Plugin 'altercation/vim-colors-solarized'
endif

"      status line enhancement
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

"      indent guides
Plugin 'nathanaelkane/vim-indent-guides'

" }}}

" Navigation {{{

"      simplify document navigation
" Plugin 'Lokaltog/vim-easymotion'

"      tmux interaction
" Plugin 'benmills/vimux'

"      jump between words in camel-cased word
" Plugin 'bkad/CamelCaseMotion'

"      simplify column manipulation
" Plugin 'coderifous/textobj-word-column.vim'

"      fuzzy file finder
Plugin 'kien/ctrlp.vim'

"      tag list for current file
Plugin 'majutsushi/tagbar'

"      vim text object for lines on same indent level
" Plugin 'michaeljsmith/vim-indent-object'

"      file system navigation
Plugin 'scrooloose/nerdtree'

"      single nerdtree instance for all tabs
Plugin 'jistr/vim-nerdtree-tabs'

"      visualize undo tree
" Plugin 'sjl/gundo.vim'

"      tiled window management
" Plugin 'spolu/dwm.vim'

"      list of opened buffers
Plugin 'vim-scripts/bufexplorer.zip'

"      git support
if executable('git')
    Plugin 'tpope/vim-fugitive'
endif

"      fast alternative to grep
if executable('ack-grep') || executable('ack')
    Plugin 'mileszs/ack.vim'
endif

" }}}

" Completion {{{

"      keyword completion
Plugin 'Shougo/deoplete.nvim'
if !has('nvim')
    Plugin 'roxma/nvim-yarp'
    Plugin 'roxma/vim-hug-neovim-rpc'
endif
set runtimepath+=~/.vim/bundle/deoplete.nvim/
let g:deoplete#enable_at_startup = 1
if has('win32') || has('win64')
    Plugin 'tbodt/deoplete-tabnine', { 'do': 'powershell.exe .\install.ps1' }
else
    Plugin 'tbodt/deoplete-tabnine', { 'do': './install.sh' }
endif

"      awesome snippets
if has('nvim')
    Plugin 'Shougo/deoppet.nvim'
endif

"      on the fly syntax check
Plugin 'scrooloose/syntastic'

"      file formatting
Plugin 'sbdchd/neoformat'

"      automatic tag creation
if executable('ctags')
    " easytags dependency
    Plugin 'xolox/vim-misc'
    Plugin 'xolox/vim-easytags'
endif

" }}}

" Utility {{{

"      switch between a single line expression and multiline one
" Plugin 'AndrewRadev/splitjoin.vim'

"      terminal in vim buffer
Plugin 'acx0/Conque-Shell'

"      sudo support
Plugin 'gmarik/sudo-gui.vim'

"      text alignment in columns
" Plugin 'godlygeek/tabular'

"      swap function parameters
" Plugin 'mutewinter/swap-parameters'

"      easy comment toggling
Plugin 'scrooloose/nerdcommenter'

"      repeating operations performed by plugins
Plugin 'tpope/vim-repeat'

"      increment/decrement dates
" Plugin 'tpope/vim-speeddating'

"      simplify surround operations
Plugin 'tpope/vim-surround'

"      encode/decode various formats
" Plugin 'tpope/vim-unimpaired'

"      utility library for vim programming
Plugin 'vim-scripts/L9'

"      another utility library for vim programming
Plugin 'tomtom/tlib_vim'

"      extend matching operations
" Plugin 'vim-scripts/matchit.zip'

"      compile current file
" Plugin 'xuhdev/SingleCompile'

"      automatically change current dirrectory to project root
Plugin 'airblade/vim-rooter'

" }}}

" Language support {{{

"      D syntax support
Plugin 'Montana/d.vim'

"      scala support
Plugin 'derekwyatt/vim-scala'

"      coffescript syntax support
Plugin 'kchmck/vim-coffee-script'

"      clojure syntax support
Plugin 'vim-scripts/VimClojure'

"      json syntax support
Plugin 'leshill/vim-json'

"      html terse coding
Plugin 'mattn/emmet-vim'

"      nginx syntax support
Plugin 'mutewinter/nginx.vim'

"      css3 syntax support
Plugin 'hail2u/vim-css3-syntax'

"      improved javascript indentation
Plugin 'pangloss/vim-javascript'

"      typescript syntax support
Plugin 'HerringtonDarkholme/yats.vim'

"      typescript language service support
Plugin 'mhartington/nvim-typescript'

"      React JSX support
Plugin 'mxw/vim-jsx'

"      vue support
Plugin 'posva/vim-vue'

"      glsl syntax support
Plugin 'Nemo157/glsl.vim'

"      actionscript syntax support
Plugin 'jeroenbourgois/vim-actionscript'

"      go syntax support
Plugin 'fatih/vim-go'

"      puppet syntax support
Plugin 'rodjek/vim-puppet'

"      eruby syntax support
Plugin 'vim-scripts/eruby.vim'

"      Idris 2 syntax support
Plugin 'edwinb/idris2-vim'

" }}}

call vundle#end()
filetype plugin indent on    " turn filetype detection back on

" "}}}

" |General configuration| {{{

" immediately read vimrc after change is made
autocmd BufWritePost .vimrc source $MYVIMRC
" fast edit the .vimrc file using ',x'
nnoremap <Leader>x :tabedit $MYVIMRC<CR>

set viewoptions+=slash,unix     " better Unix/Windows compatibility
set fileformats=unix,mac,dos    " auto detect the file formats

set timeoutlen=500          " command timeout
set autoread                " automatically load external file modifications
set autowrite               " automatically write on exit
set hidden                  " hide buffers instead of closing them
set clipboard+=unnamed      " yanks go on clipboard instead
set modeline                " turn on modeline
set encoding=utf-8          " set utf-8 encoding
set completeopt+=longest    " optimize auto complete
set completeopt-=preview    " optimize auto complete
set backup                  " create backup
set undofile                " create persistent undo file

" disable all sound on errors
set noerrorbells
set novisualbell
set t_vb=

set laststatus=2            " show the statusline

" only have cursorline in current window and in normal window
autocmd WinLeave * set nocursorline
autocmd WinEnter * set cursorline
auto InsertEnter * set nocursorline
auto InsertLeave * set cursorline
set wildmenu                   " show list instead of just completing
set wildmode=list:longest,full " use powerful wildmenu
set shortmess=at               " avoids 'hit enter'
set showcmd                    " show an incomplete command in the lower right corner of the Vim window
set backspace=indent,eol,start " make backspaces delete sensibly
set whichwrap+=h,l,<,>,[,]     " backspace and cursor keys wrap to
set virtualedit=block,onemore  " allow for cursor beyond last character
set scrolljump=5               " lines to scroll when cursor leaves screen
set scrolloff=3                " minimum lines to keep above and below cursor
set sidescroll=1               " minimal number of columns to scroll horizontally
set sidescrolloff=10           " minimal number of screen columns to keep away from cursor

set showmatch                  " show matching brackets/parenthesis
set matchtime=2                " decrease the time to blink

set number                     " show line numbers

" toggle relativenumber
function! ToggleRelativenumber()
    if &number==1
        set relativenumber
    else
        set number
    endif
endfunction
nnoremap <Leader>n :call ToggleRelativenumber()<CR>

set formatoptions+=rnlmM                   " optimize format options
set wrap                                   " wrap long lines
set textwidth=90                           " change text width
set colorcolumn=+1                         " indicate text border
set list                                   " show these tabs and spaces and so on
set listchars=tab:▸\ ,extends:❯,precedes:❮ " change listchars
set linebreak                              " wrap long lines at a blank
set showbreak=↪                            " change wrap line break
set fillchars=diff:⣿,vert:│                " change fillchars

" only show trailing whitespace when not in insert mode
augroup trailing
    autocmd!
    autocmd InsertEnter * :set listchars-=trail:⌴
    autocmd InsertLeave * :set listchars+=trail:⌴
augroup END

" set gVim UI setting
if has('gui_running')
    set guioptions-=m       " remove menu bar
    set guioptions-=T       " remove toolbar
    set guioptions+=f       " user fork() to datach from shell that started gVim
    set guioptions-=F       " remove footer
    set guioptions-=l       " remove left scrollbar for vertical splits
    set guioptions-=L       " remove left scrollbar
    set guioptions-=R       " remove right scrollbar
    set guioptions-=b       " remove bottom scrollbar
    " maximize window size
    set fuoptions=maxvert,maxhorz
    " au GUIEnter * set fullscreen
endif

" "}}}

" |Search| {{{

set ignorecase      " case insensitive search
set smartcase       " case sensitive when capital letter is present
set hlsearch        " highlight search terms
set incsearch       " search as you type
set gdefault        " turn on 'g' flag

" use sane regexes
nnoremap / /\v
vnoremap / /\v
cnoremap s/ s/\v
nnoremap ? ?\v
vnoremap ? ?\v
cnoremap s? s?\v

" keep search matches in the middle of the window
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap * *zzzv
nnoremap # #zzzv
nnoremap g* g*zzzv
nnoremap g# g#zzzv

" visual search mappings
function! s:VSetSearch()
    let temp=@@
    normal! gvy
    let @/='\V'.substitute(escape(@@, '\'), '\n', '\\n', 'g')
    let @@=temp
endfunction
vnoremap * :<C-U>call <SID>VSetSearch()<CR>//<CR>
vnoremap # :<C-U>call <SID>VSetSearch()<CR>??<CR>

" unhighlight search results on escape key
nnoremap <esc> :noh<return><esc>

" }}}

" |Colors| {{{

syntax on
set background=dark

" if !has('gui_running')
"     if !has('gui_vimr')
"         set t_Co=256 " use 256 colors
"     endif
" endif
set termguicolors

if has('nvim')
    colorscheme NeoSolarized
else
    colorscheme solarized
endif

if has('gui_running')
    if has('gui_gtk')
        set guifont=Monospace\ 12
    elseif has('gui_macvim')
        set macligatures
        set guifont=FiraCode-Regular:h12
    elseif has('gui_vimr')
        set guifont=FiraCode-Regular:h12
    elseif has('gui_win32')
        set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h12:cANSI
    endif
endif

"  }}}

" |Indentation| {{{

set autoindent       " preserve current indent on new lines
set cindent          " set C style indent
set expandtab        " convert all tabs typed to spaces
set softtabstop=4    " indentation levels every four columns
set shiftwidth=4     " indent/outdent by four columns
set shiftround       " indent/outdent to nearest tabstop

" }}}

" |Folding| {{{

set foldenable           " enable folding
set foldmethod=syntax    " fold based on syntax
set foldlevelstart=999   " start with all folds open

" use space for fold toggling
nnoremap <silent><Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

" custom fold format
function! MyFoldText()
    let line=getline(v:foldstart)
    let nucolwidth=&foldcolumn+&number*&numberwidth
    let windowwidth=winwidth(0)-nucolwidth-3
    let foldedlinecount=v:foldend-v:foldstart+1
    let onetab=strpart('          ', 0, &tabstop)
    let line=substitute(line, '\t', onetab, 'g')
    let line=strpart(line, 0, windowwidth-2-len(foldedlinecount))
    let fillcharcount=windowwidth-len(line)-len(foldedlinecount)
    return line.'…'.repeat(" ",fillcharcount).foldedlinecount.'…'.' '
endfunction
set foldtext=MyFoldText()

" }}}

" |Key bindings| {{{

" redesign moving keys in insert mode
inoremap <C-K> <Up>
inoremap <C-J> <Down>
inoremap <C-H> <Left>
inoremap <C-L> <Right>

" make j and k work the way you expect
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" same when jumping around
nnoremap g; g;zz
nnoremap g, g,zz

" reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" remap ; to :
nnoremap ; :
vnoremap ; :

" set leader to ','
let mapleader=","

" repeat last substitution, including flags, with &.
nnoremap & :&&<CR>
xnoremap & :&&<CR>

" keep the cursor in place while joining lines
nnoremap J mzJ`z

" select entire buffer
nnoremap vaa ggvGg_
nnoremap Vaa ggVG

" map \<Space> to commenting
function! IsWhiteLine()
    if (getline(".")=~"^$")
        let oldlinenumber=line(".")
        :call NERDComment('n', 'Sexy')
        if (line(".")==oldlinenumber)
            :call NERDComment('n', 'Append')
        else
            normal! k
            startinsert!
        endif
    else
        normal! A
        :call NERDComment('n', 'Append')
    endif
endfunction
nnoremap <silent>\<Space> :call IsWhiteLine()<CR>

" strip all trailing whitespace in the current file
nnoremap <Leader>q :%s/\s\+$//<CR>:let @/=''<CR>

" see the differences between the current buffer and the file it was loaded from
command! DiffOrig vert new | set bt=nofile | r ++edit # | 0d_
    \ | diffthis | wincmd p | diffthis

" }}}

" |Language specific| {{{

" Vim {{{

augroup ft_vim
    au!

    au FileType vim setlocal foldmethod=marker
    au FileType help setlocal textwidth=78
    au BufWinEnter *.txt if &ft == 'help' | wincmd L | endif
augroup END

" }}}

" Javascript {{{

" au FileType javascript setl ts=4 sw=4 sts=4 et

let g:neoformat_javascript_prettier = {
        \ 'exe': 'prettier',
        \ 'args': ['--stdin-filepath', '"%:p"', '--parser', 'javascript', '--trailing-comma', 'none'],
        \ 'stdin': 1
        \ }
let g:neoformat_enabled_javascript = ['prettier']

autocmd BufWritePre *.js Neoformat

" }}}

" Typescript {{{

let g:neoformat_typescript_prettier = {
        \ 'exe': 'prettier',
        \ 'args': ['--stdin-filepath', '"%:p"', '--parser', 'typescript', '--trailing-comma', 'none'],
        \ 'stdin': 1
        \ }
let g:neoformat_enabled_typescript = ['prettier']

set re=0
autocmd BufWritePre *.ts Neoformat

" }}}

" Go {{{

let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1

let g:go_fmt_command = "goimports"

let g:go_auto_type_info = 1

au FileType go setl noet ts=4 sw=4 sts=4

" }}}

" PHP {{{

augroup ft_php
    let php_sql_query=1        " highlight SQL code in strings
    let php_htmlInStrings=1    " highlight HTML code in strings
augroup END

" }}}

" Python {{{

augroup ft_python
    let python_highlight_all=1

    " Indent Python in the Google way.
    let s:maxoff = 50 " maximum number of lines to look backwards.
    function! GetGooglePythonIndent(lnum)
        " Indent inside parens.
        " Align with the open paren unless it is at the end of the line.
        " E.g.
        "   open_paren_not_at_EOL(100,
        "                         (200,
        "                          300),
        "                         400)
        "   open_paren_at_EOL(
        "       100, 200, 300, 400)
        call cursor(a:lnum, 1)
        let [par_line, par_col] = searchpairpos('(\|{\|\[', '', ')\|}\|\]', 'bW',
                    \ "line('.') < " . (a:lnum - s:maxoff) . " ? dummy :"
                    \ . " synIDattr(synID(line('.'), col('.'), 1), 'name')"
                    \ . " =~ '\\(Comment\\|String\\)$'")
        if par_line > 0
            call cursor(par_line, 1)
            if par_col != col("$") - 1
                return par_col
            endif
        endif
        " Delegate the rest to the original function.
        return GetPythonIndent(a:lnum)
    endfunction

    function! ChoosePythonCompiler()
        echo "Please choose python compiler:\n"
        echo "1. Python2+\n"
        echo "2. Python3+\n"
        let flag=getchar()
        if flag==49
            call SingleCompile#ChooseCompiler('python', 'python')
            execute 'SingleCompileRun'
        elseif flag==50
            call SingleCompile#ChooseCompiler('python', 'python3')
            execute 'SingleCompileRun'
        endif
    endfunction

    let pyindent_nested_paren="&sw*2"
    let pyindent_open_paren="&sw*2"

    autocmd!
    autocmd filetype python setlocal indentexpr=GetGooglePythonIndent(v:lnum)
    autocmd filetype python nnoremap <buffer> <Leader>r :call ChoosePythonCompiler()<CR>
augroup END

" }}}

" Clojure {{{

" support for ClojureScript filetype
autocmd BufRead,BufNewFile *.cljs setlocal filetype=clojure

augroup ft_clojure
    let g:vimclojure#HighlightBuiltins = 1
    let g:vimclojure#HighlightContrib = 1
    let g:vimclojure#DynamicHighlighting = 1
    let g:vimclojure#ParenRainbow = 1
    let g:vimclojure#WantNailgun = 1
augroup END

" }}}

" Actionscript {{{

augroup ft_actionscript
    autocmd FileType actionscript :set dictionary=$HOME/.vim/dict/actionscript.dict
augroup END

" }}}

" }}}

" |Completion| {{{

set complete +=i    " scan current and included files
set complete +=t    " tag completion
set ofu=syntaxcomplete#Complete

autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" }}}

" |Plugin configuration| {{{
" Airline {{{

let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'

" }}}

" Bufexplorer {{{

nnoremap <Leader>bb :BufExplorer<CR>

" }}}

" Tagbar {{{

nnoremap <Leader>t :TagbarToggle<CR>
let g:tagbar_autofocus=1
let g:tagbar_expand=1
let g:tagbar_foldlevel=2
let g:tagbar_ironchars=['▾', '▸']
let g:tagbar_autoshowtag=1

" }}}

" NERD_tree {{{

nnoremap <Leader>d :NERDTreeTabsToggle<CR>
nnoremap <Leader>f :NERDTreeFind<CR>
let NERDTreeChDirMode=2
let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=1
let NERDTreeShowLineNumbers=1
let NERDTreeDirArrows=1
let NERDTreeIgnore = ['\.pyc$', '[._]*\.s[a-v][a-z]$', '[._]*\.sw[a-p]$', '[._]s[a-v][a-z]$', '[._]sw[a-p]$', '\~$']

" }}}

" NERD_commenter {{{

let NERDCommentWholeLinesInVMode=2
let NERDSpaceDelims=1
let NERDRemoveExtraSpaces=1

" }}}

" UltiSnips {{{

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" }}}

" YouCompleteMe {{{

" make YCM compatible with UltiSnips
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']

" }}}

" Ctrlp {{{

let g:ctrlp_working_path_mode=0
let g:ctrlp_clear_cache_on_exit=0
let g:ctrlp_cache_dir=$HOME.'/.vim/.cache/ctrlp'
let g:ctrlp_extensions=['tag', 'buffertag', 'quickfix', 'dir', 'rtscript']

" }}}

" Ack {{{

if executable('ack-grep') || executable('ack')
    nnoremap <Leader>a :Ack!<Space>
endif
if has('unix') && executable('ack-grep')
    let g:ackprg='ack-grep -H --nocolor --nogroup --column'
endif

" }}}

" Syntastic {{{

nnoremap <Leader>s :Errors<CR>
let g:syntastic_check_on_open=1
let g:syntastic_auto_jump=1
let g:syntastic_enable_signs=1
let g:syntastic_cpp_check_header=1
let g:syntastic_stl_format='[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'
let g:syntastic_java_checkers=['javac']
let g:syntastic_java_javac_config_file_enabled = 1

" }}}

" Indent Guides {{{

if !has('gui_running')
    let g:indent_guides_auto_colors=0
    autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=237
    autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=239
endif

let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_guide_size=1

" }}}

" fugitive {{{

if executable('git')
    nnoremap <silent> <leader>gs :Gstatus<CR>
    nnoremap <silent> <leader>gd :Gdiff<CR>
    nnoremap <silent> <leader>gc :Gcommit<CR>
    nnoremap <silent> <leader>gb :Gblame<CR>
    nnoremap <silent> <leader>gl :Glog<CR>
    nnoremap <silent> <leader>gp :Git push<CR>
endif

" }}}

" Gundo {{{

nnoremap <Leader>u :GundoToggle<CR>

" }}}

" EasyTags {{{

function! InitializeTagDirectory()
    let parent=$HOME
    let prefix='.vim'
    let dirname='tags'
    let directory=parent.'/'.prefix.'/'.dirname.'/'
    if !isdirectory(directory)
        if exists('*mkdir')
            call mkdir(directory)
            let g:easytags_by_filetype=directory
        else
            echo "Warning: Unable to create directory: ".directory
            echo "Try: mkdir -p ".directory
        endif
    else
        let g:easytags_by_filetype=directory
    endif
endfunction
call InitializeTagDirectory()
let g:easytags_python_enabled=1
let g:easytags_python_script=1
let g:easytags_include_members=1
highlight cMember gui=italic

" }}}

" SingleCompile {{{

nnoremap <Leader>r :SingleCompileRun<CR>
let g:SingleCompile_showquickfixiferror=1

" }}}

" Zencoding {{{

let g:user_zen_leader_key='<C-Z>'
let g:user_zen_settings={'indentation':'   '}

" }}}

" Splitjoin {{{

nnoremap sj :SplitjoinSplit<CR>
nnoremap sk :SplitjoinJoin<CR>
let g:splitjoin_normalize_whitespace=1
let g:splitjoin_align=1

" }}}

" vimux {{{

nnoremap <Leader>vp :VimuxPromptCommand<CR>
vnoremap <Leader>vs "vy :call VimuxRunCommand(@v . "\n", 0)<CR>
nnoremap <Leader>vx :VimuxClosePanes<CR>
nnoremap <Leader>vq :VimuxCloseRunner<CR>
nnoremap <Leader>vi :VimuxInspectRunner<CR>
nnoremap <Leader>vl :VimuxRunLastCommand<CR>
nnoremap <Leader>vc :VimuxClearRunnerHistory<CR>

" }}}

" }}}
