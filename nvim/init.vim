" Modeline and Notes {{{
" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={{{,}}} foldlevel=0 foldmethod=marker spell:
"
"   This is the personal neovim config of Joshua Barone
"   While much of it is beneficial for general use, I would
"   recommend picking out the parts you want and understand.
"
"   Copyright 2018 Joshua Barone
" }}}

" Environment {{{

    " Basics {{{
        set nocompatible
    " }}}

    " MinPac Setup {{{
        let s:rc_path = fnamemodify(expand('<sfile>'), ':h')

        let s:minpac = expand(s:rc_path . '/pack/minpac/opt/minpac')

        if !isdirectory(glob(s:minpac))
          execute '!git clone https://github.com/k-takata/minpac.git' s:minpac
          execute '!git -C' s:minpac 'checkout nvim-rplugin'
        endif

        command! PackUpdate packadd minpac | source $MYVIMRC | call minpac#update()
        command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()

        packadd minpac
        if exists('*minpac#init')
          " minpac is loaded.
          call minpac#init()
          call minpac#add('k-takata/minpac', {'type': 'opt'})
        endif
    " }}}

    " GlobalAutoCmd {{{
        augroup GlobalAutoCmd
          autocmd!
        augroup END
        command! -nargs=* Gautocmd   autocmd GlobalAutoCmd <args>
        command! -nargs=* Gautocmdft autocmd GlobalAutoCmd FileType <args>
    " }}}

" }}}

" Bundles {{{

    " Deps {{{
        call minpac#add('MarcWeber/vim-addon-mw-utils')
        " call minpac#add('tomtom/tlib_vim')
        if executable('ag')
            call minpac#add('mileszs/ack.vim')
            let g:ackprg = 'ag --nogroup --nocolor --column --smart-case'
        elseif executable('ack-grep')
            let g:ackprg="ack-grep -H --nocolor --nogroup --column"
            call minpac#add('mileszs/ack.vim')
        elseif executable('ack')
            call minpac#add('mileszs/ack.vim')
        endif
        call minpac#add('godlygeek/tabular')
        call minpac#add('tpope/vim-rhubarb')
    " }}}

    " General {{{
        call minpac#add('ctrlpvim/ctrlp.vim')
        call minpac#add('tacahiroy/ctrlp-funky')
        call minpac#add('jlanzarotta/bufexplorer')
        call minpac#add('scrooloose/nerdtree')
        call minpac#add('jistr/vim-nerdtree-tabs')
        call minpac#add('altercation/vim-colors-solarized')
        call minpac#add('tpope/vim-surround')
        call minpac#add('tpope/vim-repeat')
        call minpac#add('rhysd/conflict-marker.vim')
        call minpac#add('jiangmiao/auto-pairs')
        call minpac#add('terryma/vim-multiple-cursors')
        call minpac#add('vim-scripts/sessionman.vim')
        call minpac#add('vim-scripts/matchit.zip')
        call minpac#add('vim-airline/vim-airline')
        call minpac#add('vim-airline/vim-airline-themes')
        call minpac#add('powerline/fonts')
        " call minpac#add('bling/vim-bufferline')
        call minpac#add('easymotion/vim-easymotion')
        call minpac#add('mbbill/undotree')
        call minpac#add('nathanaelkane/vim-indent-guides')
        call minpac#add('vim-scripts/restore_view.vim')
        call minpac#add('mhinz/vim-signify')
        call minpac#add('tpope/tpope-vim-abolish')
        call minpac#add('osyo-manga/vim-over')
        call minpac#add('kana/vim-textobj-user')
        call minpac#add('kana/vim-textobj-indent')
        call minpac#add('gcmt/wildfire.vim')
        call minpac#add('tpope/vim-unimpaired')
        call minpac#add('rbgrouleff/bclose.vim')
    " }}}

    " Writing {{{
        call minpac#add('reedes/vim-litecorrect')
        call minpac#add('reedes/vim-textobj-sentence')
        call minpac#add('reedes/vim-textobj-quote')
        call minpac#add('reedes/vim-wordy')
    " }}}

    " General Programming {{{
        call minpac#add('w0rp/ale')
        call minpac#add('tpope/vim-fugitive')
        " call minpac#add('mattn/webapi-vim')
        call minpac#add('mattn/gist-vim')
        call minpac#add('scrooloose/nerdcommenter')
        call minpac#add('tpope/vim-commentary')
        call minpac#add('luochen1990/rainbow')
        if executable('ctags')
            call minpac#add('majutsushi/tagbar')
        endif
        call minpac#add('airblade/vim-gitgutter')
        call minpac#add('Xuyuanp/nerdtree-git-plugin')
        call minpac#add('gregsexton/gitv')
    " }}}

    " Snippets & AutoComplete {{{
        call minpac#add('Shougo/deoplete.nvim', {'do': 'UpdateRemotePlugins'})
        call minpac#add('Shougo/neocomplcache')
        call minpac#add('Shougo/neosnippet')
        call minpac#add('Shougo/neosnippet-snippets')
        call minpac#add('honza/vim-snippets')
        call minpac#add('bonsaiben/bootstrap-snippets')
        call minpac#add('zchee/deoplete-go', {'do': 'silent! !make'})
        call minpac#add('zchee/deoplete-jedi')
    " }}}

    " PHP {{{
        call minpac#add('spf13/PIV')
        call minpac#add('arnaud-lb/vim-php-namespace')
        call minpac#add('beyondwords/vim-twig')
    " }}}

    " Python {{{
        call minpac#add('klen/python-mode')
        call minpac#add('yssource/python.vim')
        call minpac#add('vim-scripts/python_match.vim')
    " }}}

    " Javascript {{{
        call minpac#add('mxw/vim-jsx')
        call minpac#add('elzr/vim-json')
        call minpac#add('groenewege/vim-less')
        call minpac#add('briancollins/vim-jst')
        call minpac#add('kchmck/vim-coffee-script')
        call minpac#add('Slava/vim-spacebars')
        call minpac#add('pangloss/vim-javascript')
        call minpac#add('justinj/vim-react-snippets')
        call minpac#add('leafgarland/typescript-vim')
    " }}}

    " Scala {{{
        call minpac#add('derekwyatt/vim-scala')
        call minpac#add('derekwyatt/vim-sbt')
    " }}}

    " Haskell {{{
        " call minpac#add('travitch/hasksyn')
        " call minpac#add('dag/vim2hs')
        " call minpac#add('Twinside/vim-haskellConceal')
        " call minpac#add('Twinside/vim-haskellFold')
        " call minpac#add('lukerandall/haskellmode-vim')
        " call minpac#add('eagletmt/neco-ghc')
        " call minpac#add('eagletmt/ghcmod-vim')
        " call minpac#add('Shougo/vimproc.vim')
        " call minpac#add('adinapoli/cumino')
        " call minpac#add('bitc/vim-hdevtools')
    " }}}

    " HTML {{{
        call minpac#add('vim-scripts/HTML-AutoCloseTag')
        call minpac#add('hail2u/vim-css3-syntax')
        call minpac#add('gorodinskiy/vim-coloresque')
        " call minpac#add('tpope/vim-haml')
        " call minpac#add('mattn/emmet-vim')
    " }}}

    " Ruby {{{
        " call minpac#add('tpope/vim-rails')
        " let g:rubycomplete_buffer_loading = 1
    " }}}

    " Puppet {{{
        " call minpac#add('rodjek/vim-puppet')
    " }}}

    " Go Lang {{{
        call minpac#add('fatih/vim-go')
        if executable('impl')
            call minpac#add('rhysd/vim-go-impl')
        endif
        call minpac#add('sebdah/vim-delve')
    " }}}

    " Elixir {{{
        " call minpac#add('elixir-lang/vim-elixir')
        " call minpac#add('carlosgaldino/elixir-snippets')
        " call minpac#add('mattreduce/vim-mix')
    " }}}

    " Misc {{{
        " call minpac#add('rust-lang/rust.vim')
        " call minpac#add('plasticboy/vim-markdown')
        " call minpac#add('spf13/vim-preview')
        " call minpac#add('tpope/vim-cucumber')
        " call minpac#add('quentindecock/vim-cucumber-align-pipes')
        " call minpac#add('cespare/vim-toml')
        " call minpac#add('saltstack/salt-vim')
    " }}}

    " Tmux {{{
        call minpac#add('christoomey/vim-tmux-navigator')
        call minpac#add('christoomey/vim-tmux-runner')
        call minpac#add('keith/tmux.vim')
    " }}}

" }}}

" General {{{

    set background=dark         " Assume a dark background

    " Allow to trigger background
    function! ToggleBG()
        let s:tbg = &background
        " Inversion
        if s:tbg == "dark"
            set background=light
        else
            set background=dark
        endif
    endfunction
    noremap <leader>bg :call ToggleBG()<CR>

    " if !has('gui')
        "set term=$TERM          " Make arrow and other keys work
    " endif
    filetype plugin indent on   " Automatically detect file types.
    syntax on                   " Syntax highlighting
    if has('mouse')
        set mouse=a                 " Automatically enable mouse usage
        set mousehide               " Hide the mouse cursor while typing
    endif
    scriptencoding utf-8

    " if has('clipboard')
    "     if has('unnamedplus')  " When possible use + register for copy-paste
            set clipboard=unnamed,unnamedplus
    "     else         " On mac and Windows, use * register for copy-paste
    "         set clipboard=unnamed
    "     endif
    " endif

    " Always switch to the current file directory
    " autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif

    set shortmess+=filmnrxoOtT          " Abbrev. of messages (avoids 'hit enter')
    set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
    set virtualedit=onemore             " Allow for cursor beyond last character
    set history=1000                    " Store a ton of history (default is 20)
    set spell                           " Spell checking on
    set hidden                          " Allow buffer switching without saving
    set iskeyword-=.                    " '.' is an end of word designator
    set iskeyword-=#                    " '#' is an end of word designator
    set iskeyword-=-                    " '-' is an end of word designator

    " Instead of reverting the cursor to the last position in the buffer, we
    " set it to the first line when editing a git commit message
    au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

    " http://vim.wikia.com/wiki/Restore_cursor_to_file_position_in_previous_editing_session
    " Restore cursor to file position in previous editing session
    function! ResCur()
        if line("'\"") <= line("$")
            silent! normal! g`"
            return 1
        endif
    endfunction

    augroup resCur
        autocmd!
        autocmd BufWinEnter * call ResCur()
    augroup END

    " Setting up the directories {{{
        set backup                  " Backups are nice ...
        if has('persistent_undo')
            set undofile                " So is persistent undo ...
            set undolevels=1000         " Maximum number of changes that can be undone
            set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
        endif

        " Add exclusions to mkview and loadview
        " eg: *.*, svn-commit.tmp
        let g:skipview_files = [
            \ '\[example pattern\]'
            \ ]
    " }}}

    " Map escape for insert mode
    imap jk <Esc>
    imap kj <Esc>

" }}}

" UI {{{

    let g:solarized_termcolors=256
    let g:solarized_termtrans=1
    let g:solarized_contrast="normal"
    let g:solarized_visibility="normal"
    color solarized             " Load a colorscheme

    set tabpagemax=15               " Only show 15 tabs
    set showmode                    " Display the current mode

    set cursorline                  " Highlight current line

    highlight clear SignColumn      " SignColumn should match background
    highlight clear LineNr          " Current line number row will have same background color in relative mode
    "highlight clear CursorLineNr    " Remove highlight color from current line number

    if has('cmdline_info')
        set ruler                   " Show the ruler
        set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
        set showcmd                 " Show partial commands in status line and
                                    " Selected characters/lines in visual mode
    endif

    set backspace=indent,eol,start  " Backspace for dummies
    set linespace=0                 " No extra spaces between rows
    set number                      " Line numbers on
    set relativenumber
    set ruler
    set showmatch                   " Show matching brackets/parenthesis
    set incsearch                   " Find as you type search
    set hlsearch                    " Highlight search terms
    set inccommand=split
    set winminheight=0              " Windows can be 0 line high
    set ignorecase                  " Case insensitive search
    set smartcase                   " Case sensitive when uc present
    set wildmenu                    " Show list instead of just completing
    set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
    set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
    set scrolljump=5                " Lines to scroll when cursor leaves screen
    set scrolloff=3                 " Minimum lines to keep above and below cursor
    set foldenable                  " Auto fold code
    set list
    set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace

" }}}

" Formatting {{{
    set timeout
    set timeoutlen=100
    set encoding=utf8
    set colorcolumn=80,120          " Add vertical lines to columns
    set infercase                   " Case inference search
    set magic                       " For regular expressions turn magic on
    set lazyredraw                  " Don't redraw while executing macros
    set showmatch                   " Show matching pair
    set mat=2

    set noerrorbells
    set novisualbell
    set t_vb=
    set tm=500

    set title
    " set updatetime=100

    set nrformats=octal,hex

    set nowrap                      " Do not wrap long lines
    set autoread
    set autoindent                  " Indent at the same level of the previous line
    set smartindent                 " enable smart indentation
    set shiftwidth=4                " Use indents of 4 spaces
    set expandtab                   " Tabs are spaces, not tabs
    set tabstop=4                   " An indentation every four columns
    set softtabstop=4               " Let backspace delete indent
    set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
    set splitright                  " Puts new vsplit windows to the right of the current
    set splitbelow                  " Puts new split windows to the bottom of the current
    "set matchpairs+=<:>             " Match, to be used with %
    set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)

    autocmd BufNewFile,BufRead *.coffee set filetype=coffee
    autocmd BufNewFile,BufRead *.html.twig set filetype=html.twig
    autocmd BufNewFile,BufRead *.jsx set filetype=javascript

    autocmd FileType c,cpp,java,go,php,javascript,puppet,python,rust,twig,xml,yml,perl,sql,coffee,ruby autocmd BufWritePre <buffer> call StripTrailingWhitespace()
    autocmd FileType haskell,puppet,ruby,yml,javascript setlocal expandtab shiftwidth=2 softtabstop=2

    " Workaround vim-commentary for Haskell
    autocmd FileType haskell setlocal commentstring=--\ %s
    " Workaround broken colour highlighting in Haskell
    autocmd FileType haskell,rust setlocal nospell

" }}}

" Key (re)Mappings {{{
    map <C-J> <C-W>j
    map <C-K> <C-W>k
    map <C-L> <C-W>l
    map <C-H> <C-W>h

    " Move between buffers with Shift + arrow key...
    nnoremap <S-Left> :bprevious<cr>
    nnoremap <S-Right> :bnext<cr>

    " ... but skip the quickfix when navigating
    augroup qf
        autocmd!
        autocmd FileType qf set nobuflisted
    augroup END

    let mapleader = ','
    let maplocalleader = '_'

    " Wrapped lines goes down/up to next row, rather than next line in file.
    noremap j gj
    noremap k gk

    " End/Start of line motion keys act relative to row/wrap width in the
    " presence of `:set wrap`, and relative to line for `:set nowrap`.
    " Default vim behaviour is to act relative to text line in both cases

    " Same for 0, home, end, etc
    function! WrapRelativeMotion(key, ...)
        let vis_sel=""
        if a:0
            let vis_sel="gv"
        endif
        if &wrap
            execute "normal!" vis_sel . "g" . a:key
        else
            execute "normal!" vis_sel . a:key
        endif
    endfunction

    " Map g* keys in Normal, Operator-pending, and Visual+select
    noremap $ :call WrapRelativeMotion("$")<CR>
    noremap <End> :call WrapRelativeMotion("$")<CR>
    noremap 0 :call WrapRelativeMotion("0")<CR>
    noremap <Home> :call WrapRelativeMotion("0")<CR>
    noremap ^ :call WrapRelativeMotion("^")<CR>

    " Overwrite the operator pending $/<End> mappings from above
    " to force inclusive motion with :execute normal!
    onoremap $ v:call WrapRelativeMotion("$")<CR>
    onoremap <End> v:call WrapRelativeMotion("$")<CR>

    " Overwrite the Visual+select mode mappings from above
    " to ensure the correct vis_sel flag is passed to function
    vnoremap $ :<C-U>call WrapRelativeMotion("$", 1)<CR>
    vnoremap <End> :<C-U>call WrapRelativeMotion("$", 1)<CR>
    vnoremap 0 :<C-U>call WrapRelativeMotion("0", 1)<CR>
    vnoremap <Home> :<C-U>call WrapRelativeMotion("0", 1)<CR>
    vnoremap ^ :<C-U>call WrapRelativeMotion("^", 1)<CR>

    " The following two lines conflict with moving to top and
    " bottom of the screen
    map <S-H> gT
    map <S-L> gt

    " Stupid shift key fixes
    if has("user_commands")
        command! -bang -nargs=* -complete=file E e<bang> <args>
        command! -bang -nargs=* -complete=file W w<bang> <args>
        command! -bang -nargs=* -complete=file Wq wq<bang> <args>
        command! -bang -nargs=* -complete=file WQ wq<bang> <args>
        command! -bang Wa wa<bang>
        command! -bang WA wa<bang>
        command! -bang Q q<bang>
        command! -bang QA qa<bang>
        command! -bang Qa qa<bang>
    endif

    cmap Tabe tabe

    " Yank from the cursor to the end of the line, to be consistent with C and D.
    nnoremap Y y$

    " Code folding options
    nmap <leader>f0 :set foldlevel=0<CR>
    nmap <leader>f1 :set foldlevel=1<CR>
    nmap <leader>f2 :set foldlevel=2<CR>
    nmap <leader>f3 :set foldlevel=3<CR>
    nmap <leader>f4 :set foldlevel=4<CR>
    nmap <leader>f5 :set foldlevel=5<CR>
    nmap <leader>f6 :set foldlevel=6<CR>
    nmap <leader>f7 :set foldlevel=7<CR>
    nmap <leader>f8 :set foldlevel=8<CR>
    nmap <leader>f9 :set foldlevel=9<CR>

    nmap <silent> <leader>/ :set invhlsearch<CR>

    " Find merge conflict markers
    map <leader>fc /\v^[<\|=>]{7}( .*\|$)<CR>

    " Shortcuts
    " Change Working Directory to that of the current file
    cmap cwd lcd %:p:h
    cmap cd. lcd %:p:h

    " Visual shifting (does not exit Visual mode)
    vnoremap < <gv
    vnoremap > >gv

    " Allow using the repeat operator with a visual selection (!)
    " http://stackoverflow.com/a/8064607/127816
    vnoremap . :normal .<CR>

    " For when you forget to sudo.. Really Write the file.
    cmap w!! w !sudo tee % >/dev/null

    " Some helpers to edit mode
    " http://vimcasts.org/e/14
    cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
    map <leader>ew :e %%
    map <leader>es :sp %%
    map <leader>ev :vsp %%
    map <leader>et :tabe %%

    " Adjust viewports to the same size
    map <Leader>= <C-w>=

    " Map <Leader>ff to display all lines with keyword under cursor
    " and ask which one to jump to
    nmap <Leader>ff [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

    " Easier horizontal scrolling
    map zl zL
    map zh zH

    " Easier formatting
    nnoremap <silent> <leader>q gwip

" }}}

" GUI Settings {{{

    " GVIM- (here instead of .gvimrc)
    if has('gui_running')
        set guioptions-=T           " Remove the toolbar
        set lines=40                " 40 lines of text instead of 24
        if LINUX() && has("gui_running")
            set guifont=Hack\ Regular\ 12,Andale\ Mono\ Regular\ 12,Menlo\ Regular\ 11,Consolas\ Regular\ 12,Courier\ New\ Regular\ 14
        elseif OSX() && has("gui_running")
            set guifont=Hack\ Regular:h12,Andale\ Mono\ Regular:h12,Menlo\ Regular:h11,Consolas\ Regular:h12,Courier\ New\ Regular:h14
        elseif WINDOWS() && has("gui_running")
            set guifont=Hack:h10,Andale_Mono:h10,Menlo:h10,Consolas:h10,Courier_New:h10
        endif
    else
        if &term == 'xterm' || &term == 'screen'
            set t_Co=256            " Enable 256 colors to stop the CSApprox warning and make xterm vim shine
        endif
        "set term=builtin_ansi       " Make arrow and other keys work
    endif

" }}}

" Functions {{{

    " Initialize directories {{{
    function! InitializeDirectories()
        let parent = $HOME
        let prefix = 'vim'
        let dir_list = {
                    \ 'backup': 'backupdir',
                    \ 'views': 'viewdir',
                    \ 'swap': 'directory' }

        if has('persistent_undo')
            let dir_list['undo'] = 'undodir'
        endif

        let common_dir = parent . '/.' . prefix

        for [dirname, settingname] in items(dir_list)
            let directory = common_dir . dirname . '/'
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
    " }}}

    " Initialize NERDTree as needed {{{
    function! NERDTreeInitAsNeeded()
        redir => bufoutput
        buffers!
        redir END
        let idx = stridx(bufoutput, "NERD_tree")
        if idx > -1
            NERDTreeMirror
            NERDTreeFind
            wincmd l
        endif
    endfunction
    " }}}

    " Strip whitespace {{{
    function! StripTrailingWhitespace()
        " Preparation: save last search, and cursor position.
        let _s=@/
        let l = line(".")
        let c = col(".")
        " do the business:
        %s/\s\+$//e
        " clean up: restore previous search history, and cursor position
        let @/=_s
        call cursor(l, c)
    endfunction
    " }}}

    " Shell command {{{
    function! s:RunShellCommand(cmdline)
        botright new

        setlocal buftype=nofile
        setlocal bufhidden=delete
        setlocal nobuflisted
        setlocal noswapfile
        setlocal nowrap
        setlocal filetype=shell
        setlocal syntax=shell

        call setline(1, a:cmdline)
        call setline(2, substitute(a:cmdline, '.', '=', 'g'))
        execute 'silent $read !' . escape(a:cmdline, '%#')
        setlocal nomodifiable
        1
    endfunction

    command! -complete=file -nargs=+ Shell call s:RunShellCommand(<q-args>)
    " e.g. Grep current file for <search_term>: Shell grep -Hn <search_term> %
    " }}}

    function! s:ExpandFilenameAndExecute(command, file)
        execute a:command . " " . expand(a:file, ":p")
    endfunction

    function! s:Scratch (command, ...)
       redir => lines
       let saveMore = &more
       set nomore
       execute a:command
       redir END
       let &more = saveMore
       call feedkeys("\<cr>")
       new | setlocal buftype=nofile bufhidden=hide noswapfile
       put=lines
       if a:0 > 0
          execute 'vglobal/'.a:1.'/delete'
       endif
       if a:command == 'scriptnames'
          %substitute#^[[:space:]]*[[:digit:]]\+:[[:space:]]*##e
       endif
       silent %substitute/\%^\_s*\n\|\_s*\%$
       let height = line('$') + 3
       execute 'normal! z'.height."\<cr>"
       0
    endfunction

    command! -nargs=? Scriptnames call <sid>Scratch('scriptnames', <f-args>)
    command! -nargs=+ Scratch call <sid>Scratch(<f-args>)
" }}}

" Misc {{{
    " Automatically rebalance windows on vim resize
    autocmd VimResized * :wincmd =

    " zoom a vim pane, <C-w>= to rebalance
    nnoremap <leader>- :wincmd _<CR>:wincmd \|<CR>
    nnoremap <leader>= :wincmd =<CR>

    let g:tagbar_type_go = {
        \ 'ctagstype' : 'go',
        \ 'kinds'     : [
            \ 'p:package',
            \ 'i:imports:1',
            \ 'c:constants',
            \ 'v:variables',
            \ 't:types',
            \ 'n:interfaces',
            \ 'w:fields',
            \ 'e:embedded',
            \ 'm:methods',
            \ 'r:constructor',
            \ 'f:functions'
        \ ],
        \ 'sro' : '.',
        \ 'kind2scope' : {
            \ 't' : 'ctype',
            \ 'n' : 'ntype'
        \ },
        \ 'scope2kind' : {
            \ 'ctype' : 't',
            \ 'ntype' : 'n'
        \ },
        \ 'ctagsbin'  : 'gotags',
        \ 'ctagsargs' : '-sort -silent'
    \ }

    noremap <leader><Space> :call StripTrailingWhitespace()<CR>

    let g:multi_cursor_next_key='<C-n>'
    let g:multi_cursor_skip_key='<C-b>'
" }}}

" Plugins {{{
    packloadall

    " Neomake {{{
        " autocmd! BufWritePost * Neomake
        " let g:neomake_go_gometalinter_args = ['--disable-all',
        "             \ '--enable=megacheck', '--enable=misspell',
        "             \ '--enable=interfacer', '--enable=deadcode']
        " let g:neomake_serialize = 1
        " let g:neomake_serialize_abort_on_error = 1
        " let g:neomake_javascript_enabled_makers = ['eslint']
        " let g:neomake_jsx_enabled_makers = ['eslint']
    " }}}

    " Ale {{{
        let g:ale_sign_error = '✘'
        let g:ale_sign_warning = '⚠'
        highlight ALEErrorSign ctermbg=NONE ctermfg=red
        highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
        let g:ale_linters = {'javascript': ['eslint']}
    " }}}

    " GoLang {{{
        let g:go_highlight_types = 1
        let g:go_highlight_fields = 1
        let g:go_highlight_functions = 1
        let g:go_highlight_methods = 1
        let g:go_highlight_structs = 1
        let g:go_highlight_operators = 1
        let g:go_highlight_build_constraints = 1
        let g:go_highlight_extra_types = 1
        let g:go_fmt_command = "goimports"
        let g:go_snippet_engine = "neosnippet"
        " Show the progress when running :GoCoverage
        let g:go_echo_command_info = 1

        " Show type information
        let g:go_auto_type_info = 1

        " Highlight variable uses
        let g:go_auto_sameids = 1

        " Fix for location list when vim-go is used together with Syntastic
        let g:go_list_type = "quickfix"

        " Add the failing test name to the output of :GoTest
        let g:go_test_show_name = 1

        " gometalinter configuration
        let g:go_metalinter_command = ""
        let g:go_metalinter_deadline = "5s"
        let g:go_metalinter_enabled = [
            \ 'deadcode',
            \ 'gas',
            \ 'goconst',
            \ 'gocyclo',
            \ 'golint',
            \ 'gosimple',
            \ 'ineffassign',
            \ 'vet',
            \ 'vetshadow'
        \]

        " Set whether the JSON tags should be snakecase or camelcase.
        let g:go_addtags_transform = "camelcase"

        au FileType go set noexpandtab
        au FileType go set shiftwidth=4
        au FileType go set softtabstop=4
        au FileType go set tabstop=4
        au FileType go nmap <Leader>s <Plug>(go-implements)
        au FileType go nmap <Leader>i <Plug>(go-info)
        au FileType go nmap <Leader>e <Plug>(go-rename)
        au FileType go nmap <leader>r <Plug>(go-run)
        au FileType go nmap <leader>b <Plug>(go-build)
        au FileType go nmap <leader>t <Plug>(go-test)
        au FileType go nmap <Leader>gd <Plug>(go-doc)
        au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
        au FileType go nmap <leader>co <Plug>(go-coverage)
        au FileType go nmap <leader>ct <Plug>(go-coverage-toogle)
        au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
        autocmd FileType go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
        autocmd FileType go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
        autocmd FileType go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
        autocmd FileType go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

        let g:delve_backend = "native"
    " }}}

    " TextObj Sentence {{{
        augroup textobj_sentence
          autocmd!
          autocmd FileType markdown call textobj#sentence#init()
          autocmd FileType textile call textobj#sentence#init()
          autocmd FileType text call textobj#sentence#init()
        augroup END
    " }}}

    " TextObj Quote {{{
        augroup textobj_quote
            autocmd!
            autocmd FileType markdown call textobj#quote#init()
            autocmd FileType textile call textobj#quote#init()
            autocmd FileType text call textobj#quote#init({'educate': 0})
        augroup END
    " }}}

    " PIV {{{
        " if isdirectory(expand("~/.vim/pack/minpac/start/PIV"))
        "     let g:DisableAutoPHPFolding = 0
        "     let g:PIVAutoClose = 0
        " endif
    " }}}

    " Misc {{{
        if isdirectory(expand(s:rc_path . "/pack/minpac/start/nerdtree"))
            let g:NERDShutUp=1
        endif
        if isdirectory(expand(s:rc_path . "/pack/minpac/start/matchit.zip"))
            let b:match_ignorecase = 1
        endif
    " }}}

    " Ctags {{{
        set tags=./tags;/,~/.vimtags

        " Make tags placed in .git/tags file available in all levels of a repository
        let gitroot = substitute(system('git rev-parse --show-toplevel'), '[\n\r]', '', 'g')
        if gitroot != ''
            let &tags = &tags . ',' . gitroot . '/.git/tags'
        endif
    " }}}

    " AutoCloseTag {{{
        " Make it so AutoCloseTag works for xml and xhtml files as well
        au FileType xhtml,xml ru ftplugin/html_autoclosetag.vim
    " }}}

    " SnipMate {{{
        " Setting the author var
        let g:snips_author = 'Joshua Barone <joshua.barone@gmail.com>'
    " }}}

    " NerdTree {{{
        if isdirectory(expand(s:rc_path . "/pack/minpac/start/nerdtree"))
            map <C-e> <plug>NERDTreeTabsToggle<CR>
            map <leader>e :NERDTreeFind<CR>
            nmap <leader>nt :NERDTreeFind<CR>

            let NERDTreeShowBookmarks=1
            let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
            let NERDTreeChDirMode=0
            let NERDTreeQuitOnOpen=1
            let NERDTreeMouseMode=2
            let NERDTreeShowHidden=1
            let NERDTreeKeepTreeInNewTab=1
            let g:nerdtree_tabs_open_on_gui_startup=0
        endif
    " }}}

    " Tabularize {{{
        if isdirectory(expand(s:rc_path . "/pack/minpac/start/tabular"))
            nmap <Leader>a& :Tabularize /&<CR>
            vmap <Leader>a& :Tabularize /&<CR>
            nmap <Leader>a= :Tabularize /^[^=]*\zs=<CR>
            vmap <Leader>a= :Tabularize /^[^=]*\zs=<CR>
            nmap <Leader>a=> :Tabularize /=><CR>
            vmap <Leader>a=> :Tabularize /=><CR>
            nmap <Leader>a: :Tabularize /:<CR>
            vmap <Leader>a: :Tabularize /:<CR>
            nmap <Leader>a:: :Tabularize /:\zs<CR>
            vmap <Leader>a:: :Tabularize /:\zs<CR>
            nmap <Leader>a, :Tabularize /,<CR>
            vmap <Leader>a, :Tabularize /,<CR>
            nmap <Leader>a,, :Tabularize /,\zs<CR>
            vmap <Leader>a,, :Tabularize /,\zs<CR>
            nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
            vmap <Leader>a<Bar> :Tabularize /<Bar><CR>
        endif
    " }}}

    " Session List {{{
        set sessionoptions=blank,buffers,curdir,folds,tabpages,winsize
        if isdirectory(expand(s:rc_path . "/pack/minpac/start/sessionman.vim/"))
            nmap <leader>sl :SessionList<CR>
            nmap <leader>ss :SessionSave<CR>
            nmap <leader>sc :SessionClose<CR>
        endif
    " }}}

    " JSON {{{
        nmap <leader>jt <Esc>:%!python -m json.tool<CR><Esc>:set filetype=json<CR>
        let g:vim_json_syntax_conceal = 0
    " }}}

    " Javascript {{{
        let g:jsx_ext_required = 0 " Allow JSX in normal JS files"
    " }}}

    " PyMode {{{
        " Disable if python support not present
        " if !has('python') && !has('python3')
        "     let g:pymode = 0
        " endif

        " if isdirectory(expand("~/.vim/pack/minpac/start/python-mode"))
        "     let g:pymode_lint_checkers = ['pyflakes']
        "     let g:pymode_trim_whitespaces = 0
        "     let g:pymode_options = 0
        "     let g:pymode_rope = 0
        " endif
    " }}}

    " ctrlp {{{
        if isdirectory(expand(s:rc_path . "/pack/minpac/start/ctrlp.vim/"))
            let g:ctrlp_working_path_mode = 'ra'
            nnoremap <silent> <D-t> :CtrlP<CR>
            nnoremap <silent> <D-r> :CtrlPMRU<CR>
            let g:ctrlp_custom_ignore = {
                \ 'dir':  '\.git$\|\.hg$\|\.svn$',
                \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' }

            if executable('ag')
                let s:ctrlp_fallback = 'ag %s --nocolor -l -g ""'
            elseif executable('ack-grep')
                let s:ctrlp_fallback = 'ack-grep %s --nocolor -f'
            elseif executable('ack')
                let s:ctrlp_fallback = 'ack %s --nocolor -f'
            else
                let s:ctrlp_fallback = 'find %s -type f'
            endif
            if exists("g:ctrlp_user_command")
                unlet g:ctrlp_user_command
            endif
            let g:ctrlp_user_command = {
                \ 'types': {
                    \ 1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others'],
                    \ 2: ['.hg', 'hg --cwd %s locate -I .'],
                \ },
                \ 'fallback': s:ctrlp_fallback
            \ }

            if isdirectory(expand("~/.vim/pack/minpac/start/ctrlp-funky/"))
                " CtrlP extensions
                let g:ctrlp_extensions = ['funky']

                "funky
                nnoremap <Leader>fu :CtrlPFunky<Cr>
            endif
        endif
    "}}}

    " TagBar {{{
        autocmd VimEnter * if exists(":TagbarToggle") | exe "nnoremap <silent> <leader>tt :TagbarToggle<CR>" | endif
    "}}}

    " Rainbow {{{
        if isdirectory(expand(s:rc_path . "/pack/minpac/start/rainbow/"))
            let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle
        endif
    " }}}

    " Fugitive {{{
        if isdirectory(expand(s:rc_path . "/pack/minpac/start/vim-fugitive/"))
            nnoremap <silent> <leader>gs :Gstatus<CR>
            nnoremap <silent> <leader>gd :Gdiff<CR>
            nnoremap <silent> <leader>gc :Gcommit<CR>
            nnoremap <silent> <leader>gb :Gblame<CR>
            nnoremap <silent> <leader>gl :Glog<CR>
            nnoremap <silent> <leader>gp :Git push<CR>
            nnoremap <silent> <leader>gr :Gread<CR>
            nnoremap <silent> <leader>gw :Gwrite<CR>
            nnoremap <silent> <leader>ge :Gedit<CR>
            " Mnemonic _i_nteractive
            nnoremap <silent> <leader>gi :Git add -p %<CR>
            nnoremap <silent> <leader>gg :SignifyToggle<CR>
        endif
    " }}}

    " OmniComplete {{{
        " if has("autocmd") && exists("+omnifunc")
        "     autocmd Filetype *
        "         \if &omnifunc == "" |
        "         \setlocal omnifunc=syntaxcomplete#Complete |
        "         \endif
        " endif

        hi Pmenu  guifg=#000000 guibg=#F8F8F8 ctermfg=black ctermbg=Lightgray
        hi PmenuSbar  guifg=#8A95A7 guibg=#F8F8F8 gui=NONE ctermfg=darkcyan ctermbg=lightgray cterm=NONE
        hi PmenuThumb  guifg=#F8F8F8 guibg=#8A95A7 gui=NONE ctermfg=lightgray ctermbg=darkcyan cterm=NONE

        " Some convenient mappings
        "inoremap <expr> <Esc>      pumvisible() ? "\<C-e>" : "\<Esc>"
        inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
        inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
        inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
        inoremap <expr> <C-d>      pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<C-d>"
        inoremap <expr> <C-u>      pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<C-u>"

        " Automatically open and close the popup menu / preview window
        " au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
        set completeopt-=preview
    " }}}

    " deoplete.nvim {{{
        let g:deoplete#enable_at_startup = 1
        call deoplete#enable()

        function! Multiple_cursors_before()
            let b:deoplete_disable_auto_complete = 1
        endfunction

        function! Multiple_cursors_after()
            let b:deoplete_disable_auto_complete = 0
        endfunction

        let g:deoplete#sources#go#pointer = 1
    " }}}

    " TMUX {{{
        " tmux will send xterm-style keys when its xterm-keys option is on.
        if &term =~ '^screen'
            execute "set <xUp>=\e[1;*A"
            execute "set <xDown>=\e[1;*B"
            execute "set <xRight>=\e[1;*C"
            execute "set <xLeft>=\e[1;*D"
        endif

        " Tmux vim integration
        let g:tmux_navigator_no_mappings = 1
        let g:tmux_navigator_save_on_switch = 1

        " Move between splits with ctrl+h,j,k,l
        nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
        nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
        nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
        nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
        nnoremap <silent> <c-\> :TmuxNavigatePrevious<cr>
    " }}}

    " neocomplete {{{
        " let g:acp_enableAtStartup = 0
        " let g:neocomplete#enable_at_startup = 1
        " let g:neocomplete#enable_smart_case = 1
        " let g:neocomplete#enable_auto_delimiter = 1
        " let g:neocomplete#max_list = 15
        " " let g:neocomplete#force_overwrite_completefunc = 1

        " " Define dictionary.
        " let g:neocomplete#sources#dictionary#dictionaries = {
        "             \ 'default' : '',
        "             \ 'vimshell' : $HOME.'/.vimshell_hist',
        "             \ 'scheme' : $HOME.'/.gosh_completions'
        "             \ }

        " " Define keyword.
        " if !exists('g:neocomplete#keyword_patterns')
        "     let g:neocomplete#keyword_patterns = {}
        " endif
        " let g:neocomplete#keyword_patterns['default'] = '\h\w*'

        " " Plugin key-mappings {{{
        "     inoremap <expr><C-g>        neocomplete#undo_completion()
        "     inoremap <expr><C-l>        neocomplete#complete_common_string()

        "     " <CR>: close popup and save indent.
        "     inoremap <silent> <CR <C-r>=<SID>my_cr_function()<CR>
        "     function! s:my_cr_function()
        "         return (pubvisible() ? "\<C-y>" | "") . "\<CR>"
        "     endfunction

        "     " <TAB>: completion.
        "     inoremap <expr><TAB> pumvisible() ? "\<C-n>" | "\<TAB>"

        "     " <C-h>, <BS>: close popup and delete backword char.
        "     inoremap <expr><C-h> neocomplete#smart_close_popup() . "\<C-h>"
        "     inoremap <expr><BS> neocomplete#smart_close_popup() . "\<C-h>"

        "     " Close popup by <Space>.
        "     inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

        "     " Enable omni completion.
        "     autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
        "     autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
        "     autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
        "     autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
        "     autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

        " " }}}

        " " Enable heavy omni completion. {{{
        "     if !exists('g:neocomplete#sources#omni#input_patterns')
        "         let g:neocomplete#sources#omni#input_patterns = {}
        "     endif
        "     let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
        "     let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
        "     let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
        "     let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
        "     let g:neocomplete#sources#omni#input_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'
        " " }}}
    " }}}

    " Neosnippet {{{
        " These two lines conflict with the default digraph mapping of <C-K>
        imap <C-k> <Plug>(neosnippet_expand_or_jump)
        smap <C-k> <Plug>(neosnippet_expand_or_jump)
        xmap <C-k> <Plug>(neosnippet_expand_target)

        let g:neosnippet#snippets_directory='~/.config/nvim/snippets'

        " <C-k> Complete Snippet
        " <C-k> Jump to next snippet point
        " imap <silent><expr><C-k> neosnippet#expandable() ?
        "             \ "\<Plug>(neosnippet_expand_or_jump)" : (pumvisible() ?
        "             \ "\<C-e>" : "\<Plug>(neosnippet_expand_or_jump)")
        " smap <TAB> <Right><Plug>(neosnippet_jump_or_expand)

        " SuperTab like behaviour
        imap <C-k>     <Plug>(neosnippet_expand_or_jump)
        imap <expr><TAB>
        \ pumvisible() ? "\<C-n>" :
        \ neosnippet#expandable_or_jumpable() ?
        \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
        smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
        \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
    " }}}

    " Snippets {{{
        " Use honza's snippets.
        let g:neosnippet#snippets_directory='~/.vim/pack/minpac/start/vim-snippets/snippets'

        " Enable neosnippet snipmate compatibility mode
        let g:neosnippet#enable_snipmate_compatibility = 1

        " For snippet_complete marker.
        if has('conceal')
            set conceallevel=2 concealcursor=i
        endif

        " Enable neosnippets when using go
        let g:go_snippet_engine = "neosnippet"

        " Disable the neosnippet preview candidate window
        " When enabled, there can be too much visual noise
        " especially when splits are used.
        set completeopt-=preview
    " }}}

    " UndoTree {{{
        if isdirectory(expand(s:rc_path . "/pack/minpac/start/undotree/"))
            nnoremap <Leader>u :UndotreeToggle<CR>
            " If undotree is opened, it is likely one wants to interact with it.
            let g:undotree_SetFocusWhenToggle=1
        endif
    " }}}

    " indent_guides {{{
        if isdirectory(expand(s:rc_path . "/pack/minpac/start/vim-indent-guides/"))
            let g:indent_guides_start_level = 2
            let g:indent_guides_guide_size = 1
            let g:indent_guides_enable_on_vim_startup = 1
        endif
    " }}}

    " Wildfire {{{
        let g:wildfire_objects = {
                \ "*" : ["i'", 'i"', "i)", "i]", "i}", "ip"],
                \ "html,xml" : ["at"],
                \ }
    " }}}

    " vim-airline {{{
        noremap <silent> <Plug>AirlineTablineRefresh :set mod!<CR>
        " Set configuration options for the statusline plugin vim-airline.
        set laststatus=2
        let g:airline_powerline_fonts = 1

        " Enable top tabline.
        let g:airline#extensions#tabline#enabled = 1

        " Disable showing tabs in the tabline. This will ensure that the buffers are
        " what is shown in the tabline at all times.
        let g:airline#extensions#tabline#show_tabs = 0

        " See `:echo g:airline_theme_map` for some more choices
        " Default in terminal vim is 'dark'
        if isdirectory(expand(s:rc_path . "/pack/minpac/start/vim-airline-themes/"))
            if !exists('g:airline_theme')
                let g:airline_theme = 'solarized'
            endif
        endif

        if !exists('g:airline_powerline_fonts')
            " Use the default set of separators with a few customizations
            let g:airline_left_sep='›'  " Slightly fancier than '>'
            let g:airline_right_sep='‹' " Slightly fancier than '<'
        endif

        if !exists('g:airline_symbols')
            let g:airline_symbols = {}
        endif

        " unicode symbols
        let g:airline_left_sep = ''
        let g:airline_right_sep = ''
        " let g:airline_symbols.linenr = '␊'
        " let g:airline_symbols.paste = 'ρ'
        " let g:airline_symbols.whitespace = 'Ξ'
        let g:airline_symbols.branch = ''
        let g:airline_symbols.maxlinenr = ''

        call airline#parts#define_raw('go', '%#goStatuslineColor#%{go#statusline#Show()}%*%#__restore__#')
        call airline#parts#define_condition('go', '&filetype="go"')
        let g:airline_section_y=airline#section#create_right(['ffenc', 'go'])

    " }}}

" }}}

" Use local vimrc if available {{{
    if filereadable(expand(s:rc_path . "/local.vim"))
        source ~/.config/nvim/local.vim
    endif
" }}}
