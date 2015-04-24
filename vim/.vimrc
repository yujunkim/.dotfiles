    let mapleader = ' '
    set background=dark         " Assume a dark background
    " Identify platform {
        silent function! OSX()
            return has('macunix')
        endfunction
        silent function! LINUX()
            return has('unix') && !has('macunix') && !has('win32unix')
        endfunction
        silent function! WINDOWS()
            return  (has('win16') || has('win32') || has('win64'))
        endfunction
    " }

    " Basics {
        set nocompatible        " Must be first line
        if !WINDOWS()
            set shell=/bin/sh
        endif
    " }

    " Setup Bundle Support {
        " The next three lines ensure that the ~/.dotfiles/vim/bundle/ system works
        filetype off
        set rtp+=~/.dotfiles/vim/bundle/Vundle.vim
        call vundle#rc("~/.dotfiles/vim/bundle")
    " }
    "
        Bundle 'gmarik/Vundle.vim'
            Bundle 'mileszs/ack.vim'
            Bundle 'scrooloose/nerdtree'
            Bundle 'altercation/vim-colors-solarized'
            Bundle 'tpope/vim-surround'
            Bundle 'kien/ctrlp.vim'
            Bundle 'terryma/vim-multiple-cursors'
            "Bundle 'matchit.zip'
            "Bundle 'godlygeek/csapprox'
            Bundle 'nathanaelkane/vim-indent-guides'
                "Bundle 'vim-scripts/restore_view.vim'
            Bundle 'osyo-manga/vim-over'
            Bundle 'justinmk/vim-sneak'

            " Pick one of the checksyntax, jslint, or syntastic
            Bundle 'scrooloose/syntastic'
            Bundle 'mattn/webapi-vim'
            Bundle 'mattn/gist-vim'
            Bundle 'scrooloose/nerdcommenter'
            ""Bundle 'godlygeek/tabular'
            if executable('ctags')
                Bundle 'majutsushi/tagbar'
            endif

    " Javascript {
            Bundle 'elzr/vim-json'
            Bundle 'groenewege/vim-less'
            Bundle 'pangloss/vim-javascript'
            Bundle 'kchmck/vim-coffee-script'
    " }
    "
    " HTML {
          Bundle 'amirh/HTML-AutoCloseTag'
          Bundle 'tpope/vim-haml'
          "Bundle 'hail2u/vim-css3-syntax'
    " }
            "Bundle 'tpope/vim-rails'
            "
Bundle 'slim-template/vim-slim.git'
Bundle 'fugitive.vim'
Bundle 'fatih/vim-go'
Bundle 'dgryski/vim-godef'
Bundle 'solarnz/thrift.vim'
Bundle 'jvoorhis/coq.vim'
Bundle 'perl-support.vim'
Bundle 'trefis/coquille.git'
Bundle 'def-lkb/vimbufsync'
Bundle 'ervandew/eclim'

    filetype plugin indent on   " Automatically detect file types.
    syntax on                   " Syntax highlighting
    set mouse=a                 " Automatically enable mouse usage
    set mousehide               " Hide the mouse cursor while typing
    scriptencoding utf-8

    if has('clipboard')
        if has('unnamedplus')  " When possible use + register for copy-paste
            set clipboard=unnamedplus
        else         " On mac and Windows, use * register for copy-paste
            set clipboard=unnamed
        endif
    endif

    "set autowrite                       " Automatically write a file when leaving a modified buffer
    set shortmess+=filmnrxoOtT          " Abbrev. of messages (avoids 'hit enter')
    set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
    set virtualedit=onemore             " Allow for cursor beyond last character
    set history=1000                    " Store a ton of history (default is 20)
    set spell                           " Spell checking on
    set hidden                          " Allow buffer switching without saving


    " Setting up the directories {
        set backup                  " Backups are nice ...
        if has('persistent_undo')
            set undofile                " So is persistent undo ...
            set undolevels=1000         " Maximum number of changes that can be undone
            set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
        endif

        "" To disable views add the following to your .vimrc.before.local file:
        ""   let g:spf13_no_views = 1
        "if !exists('g:spf13_no_views')
        "    " Add exclusions to mkview and loadview
        "    " eg: *.*, svn-commit.tmp
        "    let g:skipview_files = [
        "        \ '\[example pattern\]'
        "        \ ]
        "endif
    " }

" }
"
    if filereadable(expand("~/.dotfiles/vim/bundle/vim-colors-solarized/colors/solarized.vim"))
        let g:solarized_termcolors=256
        let g:solarized_termtrans=1
        let g:solarized_contrast="normal"
        let g:solarized_visibility="normal"
        color solarized             " Load a colorscheme
    endif


    set tabpagemax=15               " Only show 15 tabs
    set showmode                    " Display the current mode

    highlight clear SignColumn      " SignColumn should match background
    highlight clear LineNr          " Current line number row will have same background color in relative mode
    let g:CSApprox_hook_post = ['hi clear SignColumn']
    "highlight clear CursorLineNr    " Remove highlight color from current line number
    set t_Co=256

    if has('cmdline_info')
        set ruler                   " Show the ruler
        set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
        set showcmd                 " Show partial commands in status line and
                                    " Selected characters/lines in visual mode
    endif

    if has('statusline')
        set laststatus=2

        " Broken down into easily includeable segments
        set statusline=%<%f\                     " Filename
        set statusline+=%w%h%m%r                 " Options
        set statusline+=\ [%{&ff}/%Y]            " Filetype
        set statusline+=\ [%{getcwd()}]          " Current dir
        set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
    endif

    set backspace=indent,eol,start  " Backspace for dummies
    set linespace=0                 " No extra spaces between rows
    set nu                          " Line numbers on
    set showmatch                   " Show matching brackets/parenthesis
    set incsearch                   " Find as you type search
    set hlsearch                    " Highlight search terms
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
    "set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
    set listchars=tab:›\ ,extends:#,nbsp:. " Highlight problematic whitespace

" }
"
" Formatting {

    set nowrap                      " Do not wrap long lines
    set autoindent                  " Indent at the same level of the previous line
    "set shiftwidth=4                " Use indents of 4 spaces
    set shiftwidth=2               " Use indents of 4 spaces
    set expandtab                   " Tabs are spaces, not tabs
    "set tabstop=4                   " An indentation every four columns
    "set softtabstop=4               " Let backspace delete indent
    set tabstop=2                   " An indentation every four columns
    set softtabstop=2               " Let backspace delete indent
    set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
    set splitright                  " Puts new vsplit windows to the right of the current
    set splitbelow                  " Puts new split windows to the bottom of the current
    "set matchpairs+=<:>             " Match, to be used with %
    set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)
    "set comments=sl:/*,mb:*,elx:*/  " auto format comment blocks
    " Remove trailing whitespaces and ^M chars
    autocmd FileType c,cpp,java,go,php,javascript,python,twig,xml,yml autocmd BufWritePre <buffer> call StripTrailingWhitespace()
    autocmd BufNewFile,BufRead *.html.twig set filetype=html.twig
    autocmd BufNewFile,BufRead *.coffee set filetype=coffee

    " Strip whitespace {
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
    " }
" }
"
    " Easier moving in tabs and windows
    " The lines conflict with the default digraph mapping of <C-K>
    map <C-J> <C-W>j<C-W>_
    map <C-K> <C-W>k<C-W>_
    map <C-L> <C-W>l<C-W>\|
    map <C-H> <C-W>h<C-W>\|

    " Adjust viewports to the same size
    map <leader>= <C-W>=
    map <leader>\ <C-W>\|
    map <leader>_ <C-W>_

    "
    " for coq
    let g:coq_toggle=0
    function! CoqToggle()
      if g:coq_toggle == 0
        let g:coq_toggle = 1
        execute ":CoqLaunch"
      else
        let g:coq_toggle = 0
        execute ":CoqKill"
      endif
    endfunction
    map <silent> <leader>c :call CoqToggle()<CR>
    map <S-U> :CoqNext<CR>
    map <S-I> :CoqUndo<CR>
    map <S-T> :CoqToCursor<CR>
    let g:coquille_auto_move='true'

    " Wrapped lines goes down/up to next row, rather than next line in file.
    noremap j gj
    noremap k gk

    " End/Start of line motion keys act relative to row/wrap width in the
    " presence of `:set wrap`, and relative to line for `:set nowrap`.
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

        map <leader>h :tabmove -1<CR>
        map <leader>l :tabmove +1<CR>

    " Yank from the cursor to the end of the line, to be consistent with C and D.
    nnoremap Y y$

    " Most prefer to toggle search highlighting rather than clear the current
    " search results. To clear search highlighting rather than toggle it on
    " and off
    nmap <silent> <leader>/ :set hlsearch!<CR>

    " Find merge conflict markers
    map <leader>cf /\v^[<\|=>]{7}( .*\|$)<CR>

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

    " Some helpers to edit mode
    " http://vimcasts.org/e/14
    cnoremap %% <C-R>=expand('%:h').'/'<cr>
    map <leader>ew :e %%
    map <leader>es :sp %%
    map <leader>ev :vsp %%
    map <leader>et :tabe %%

    " Map <Leader>ff to display all lines with keyword under cursor
    " and ask which one to jump to
    nmap <Leader>ff [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

    " Easier horizontal scrolling
    map zl zL
    map zh zH

    " Easier formatting
    nnoremap <silent> <leader>q gwip

    " FIXME: Revert this f70be548
    " fullscreen mode for GVIM and Terminal, need 'wmctrl' in you PATH
    map <silent> <F11> :call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")<CR>

    " Ctags {
        set tags=./tags;/,~/.vimtags

        " Make tags placed in .git/tags file available in all levels of a repository
        let gitroot = substitute(system('git rev-parse --show-toplevel'), '[\n\r]', '', 'g')
        if gitroot != ''
            let &tags = &tags . ',' . gitroot . '/.git/tags'
        endif
    " }
    "
    " NerdTree {
        map <C-e> :NERDTreeToggle<CR>
        map <leader>e :NERDTreeFind<CR>
        nmap <leader>nt :NERDTreeFind<CR>

        let NERDTreeShowBookmarks=1
        let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
        let NERDTreeChDirMode=0
        let NERDTreeQuitOnOpen=1
        let NERDTreeMouseMode=2
        let NERDTreeShowHidden=1
        let NERDTreeKeepTreeInNewTab=1
        let g:nerdtree_tabs_open_on_gui_startup=0
    " }
    "
    " JSON {
        "nmap <leader>jt <Esc>:%!python -m json.tool<CR><Esc>:set filetype=json<CR>
    " }
    "
    " ctrlp {
        let g:ctrlp_working_path_mode = 'ra'
        nnoremap <silent> <D-t> :CtrlP<CR>
        nnoremap <silent> <D-r> :CtrlPMRU<CR>
        let g:ctrlp_custom_ignore = {
            \ 'dir':  '\.git$\|\.hg$\|\.svn$',
            \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' }

        "" On Windows use "dir" as fallback command.
        "if WINDOWS()
        "    let s:ctrlp_fallback = 'dir %s /-n /b /s /a-d'
        "elseif executable('ag')
        "    let s:ctrlp_fallback = 'ag %s --nocolor -l -g ""'
        "elseif executable('ack')
        "    let s:ctrlp_fallback = 'ack %s --nocolor -f'
        "else
        "    let s:ctrlp_fallback = 'find %s -type f'
        "endif
        "let g:ctrlp_user_command = {
        "    \ 'types': {
        "        \ 1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others'],
        "        \ 2: ['.hg', 'hg --cwd %s locate -I .'],
        "    \ },
        "    \ 'fallback': s:ctrlp_fallback
        "\ }
    "}
    "
    " TagBar {
        nnoremap <silent> <leader>tt :TagbarToggle<CR>

        " If using go please install the gotags program using the following
        " go install github.com/jstemmer/gotags
        " And make sure gotags is in your path
        let g:tagbar_type_go = {
            \ 'ctagstype' : 'go',
            \ 'kinds'     : [  'p:package', 'i:imports:1', 'c:constants', 'v:variables',
                \ 't:types',  'n:interfaces', 'w:fields', 'e:embedded', 'm:methods',
                \ 'r:constructor', 'f:functions' ],
            \ 'sro' : '.',
            \ 'kind2scope' : { 't' : 'ctype', 'n' : 'ntype' },
            \ 'scope2kind' : { 'ctype' : 't', 'ntype' : 'n' },
            \ 'ctagsbin'  : 'gotags',
            \ 'ctagsargs' : '-sort -silent'
            \ }
    "}
    "
    " indent_guides {
        let g:indent_guides_start_level = 2
        let g:indent_guides_guide_size = 1
        let g:indent_guides_enable_on_vim_startup = 1
    " }
    " vim-airline {
        " Set configuration options for the statusline plugin vim-airline.
        " Use the powerline theme and optionally enable powerline symbols.
        " To use the symbols , , , , , , and .in the statusline
        " segments add the following to your .vimrc.before.local file:
        "   let g:airline_powerline_fonts=1
        " If the previous symbols do not render for you then install a
        " powerline enabled font.

        " See `:echo g:airline_theme_map` for some more choices
        " Default in terminal vim is 'dark'
        if !exists('g:airline_theme')
            let g:airline_theme = 'solarized'
        endif
        if !exists('g:airline_powerline_fonts')
            " Use the default set of separators with a few customizations
            let g:airline_left_sep='›'  " Slightly fancier than '>'
            let g:airline_right_sep='‹' " Slightly fancier than '<'
        endif
    " }
"" GUI Settings {

"    " GVIM- (here instead of .gvimrc)
"    if has('gui_running')
"        set guioptions-=T           " Remove the toolbar
"        set lines=40                " 40 lines of text instead of 24
"        if !exists("g:spf13_no_big_font")
"            if LINUX() && has("gui_running")
"                set guifont=Andale\ Mono\ Regular\ 16,Menlo\ Regular\ 15,Consolas\ Regular\ 16,Courier\ New\ Regular\ 18
"            elseif OSX() && has("gui_running")
"                set guifont=Andale\ Mono\ Regular:h16,Menlo\ Regular:h15,Consolas\ Regular:h16,Courier\ New\ Regular:h18
"            elseif WINDOWS() && has("gui_running")
"                set guifont=Andale_Mono:h10,Menlo:h10,Consolas:h10,Courier_New:h10
"            endif
"        endif
"    else
"        if &term == 'xterm' || &term == 'screen'
"            set t_Co=256            " Enable 256 colors to stop the CSApprox warning and make xterm vim shine
"        endif
"        "set term=builtin_ansi       " Make arrow and other keys work
"    endif

"" }
let g:snips_author = 'Yujun Kim <kyjunfly@gmail.com>'

vnoremap <silent> gv :call VisualSelection('gv', '')<CR>
map <leader>g :Ack

map <leader>cc :botright cope<cr>
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
"by yujun
map <leader>n :cn<cr>
map <leader>p :cp<cr>

set guifont=Inconsolata\ for\ Powerline:h15
autocmd BufWritePre * :%s/\s\+$//e
set wrap

function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("Ack \"" . l:pattern . "\" " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


let g:ack_default_options = " -s -H --nocolor --nogroup --column --smart-case --follow --ignore-dir=log --ignore-dir=tmp"

set undodir=~/.dotfiles/vim/undodir
set backupdir=~/.dotfiles/vim/backupdir
let g:gist_post_private = 1
let g:gist_detect_filetype = 1
let g:gist_show_privates = 1
let g:ctrlp_extensions = ['funky']
let g:ctrlp_funky_syntax_highlight = 1
let g:ycm_path_to_python_interpreter = '/usr/bin/python'
let g:CoqIDEDefaultKeyMap = 1
nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>

set directory=~/.dotfiles/vim/tmp/swap

















"
"
"
"  BSV!!
"
"

" Vim syntax file
" Language:    Bluespec System Verilog (BSV)
" Maintainer:  Hadar Agam -- hadar at bluespec dot com
" Last Change: Oct 24 2006
" License:     Proprietary

" work with vim < 6.0
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" BSV is case-sensitive
syntax case match

" SV operators (XXX stolen from verilog.vim)
syntax match bsv_op "[&|~><!)(*/#%@+=?:;}{,.\^\-\[\]]"

" SV identifiers
syntax match bsv_identifier "\<[a-z_][A-za-z_]*\>"

" comments (must be before operators, or else / gets marked as an operator)
syntax keyword bsv_todo XXX FIXME TODO
syntax region  bsv_comment start="//"  end=/$/ contains=bsv_todo
syntax region  bsv_comment start="/\*" end="\*/" contains=bsv_todo

" numeric literals (XXX stolen from verilog.vim)
syntax match   bsv_number "\(\<\d\+\|\)'[bB]\s*[0-1_xXzZ?]\+\>"
syntax match   bsv_number "\(\<\d\+\|\)'[oO]\s*[0-7_xXzZ?]\+\>"
syntax match   bsv_number "\(\<\d\+\|\)'[dD]\s*[0-9_xXzZ?]\+\>"
syntax match   bsv_number "\(\<\d\+\|\)'[hH]\s*[0-9a-fA-F_xXzZ?]\+\>"
syntax match   bsv_number "\<[+-]\=[0-9_]\+\(\.[0-9_]*\|\)\(e[0-9_]*\|\)\>"

" strings
syntax region bsv_string start=/"/ skip=/\\"/ end=/"/

" SV keywords
syntax keyword bsv_statement alias
syntax keyword bsv_statement always
syntax keyword bsv_statement always_comb
syntax keyword bsv_statement always_ff
syntax keyword bsv_statement always_latch
syntax keyword bsv_statement and
syntax keyword bsv_statement assert
syntax keyword bsv_statement assert_strobe
syntax keyword bsv_statement assign
syntax keyword bsv_statement assume
syntax keyword bsv_statement automatic
syntax keyword bsv_statement before
syntax keyword bsv_statement begin
syntax keyword bsv_statement bind
syntax keyword bsv_statement bins
syntax keyword bsv_statement binsof
syntax match   bsv_type      "bit\(\[.*\]\)\?"
syntax keyword bsv_statement break
syntax keyword bsv_statement buf
syntax keyword bsv_statement bufif0
syntax keyword bsv_statement bufif1
syntax keyword bsv_statement byte
syntax keyword bsv_conditional case
syntax keyword bsv_conditional casex
syntax keyword bsv_conditional casez
syntax keyword bsv_statement cell
syntax keyword bsv_statement chandle
syntax keyword bsv_statement class
syntax keyword bsv_statement clocking
syntax keyword bsv_statement cmos
syntax keyword bsv_statement config
syntax keyword bsv_statement const
syntax keyword bsv_statement constraint
syntax keyword bsv_statement context
syntax keyword bsv_statement continue
syntax keyword bsv_statement cover
syntax keyword bsv_statement covergroup
syntax keyword bsv_statement coverpoint
syntax keyword bsv_statement cross
syntax keyword bsv_statement deassign
syntax keyword bsv_statement default
syntax keyword bsv_statement defparam
syntax keyword bsv_statement design
syntax keyword bsv_statement disable
syntax keyword bsv_statement dist
syntax keyword bsv_statement do
syntax keyword bsv_statement edge
syntax keyword bsv_conditional else
syntax keyword bsv_statement end
syntax keyword bsv_statement endcase
syntax keyword bsv_statement endclass
syntax keyword bsv_statement endclocking
syntax keyword bsv_statement endconfig
syntax keyword bsv_statement endfunction
syntax keyword bsv_statement endgenerate
syntax keyword bsv_statement endgroup
syntax keyword bsv_typedef   endinterface
syntax keyword bsv_statement endmodule
syntax keyword bsv_statement endpackage
syntax keyword bsv_statement endprimitive
syntax keyword bsv_statement endprogram
syntax keyword bsv_statement endproperty
syntax keyword bsv_statement endspecify
syntax keyword bsv_statement endsequence
syntax keyword bsv_statement endtable
syntax keyword bsv_statement endtask
syntax keyword bsv_structure enum
syntax keyword bsv_statement event
syntax keyword bsv_statement expect
syntax keyword bsv_statement export
syntax keyword bsv_statement extends
syntax keyword bsv_statement extern
syntax keyword bsv_statement final
syntax keyword bsv_statement first_match
syntax keyword bsv_loop      for
syntax keyword bsv_statement force
syntax keyword bsv_statement foreach
syntax keyword bsv_statement forever
syntax keyword bsv_statement fork
syntax keyword bsv_statement forkjoin
syntax keyword bsv_statement function
syntax keyword bsv_statement generate
syntax keyword bsv_statement genvar
syntax keyword bsv_statement highz0
syntax keyword bsv_statement highz1
syntax keyword bsv_conditional if
syntax keyword bsv_statement iff
syntax keyword bsv_statement ifnone
syntax keyword bsv_statement ignore_bins
syntax keyword bsv_statement illegal_bins
syntax keyword bsv_statement import
syntax keyword bsv_statement incdir
syntax keyword bsv_statement include
syntax keyword bsv_statement initial
syntax keyword bsv_statement inout
syntax keyword bsv_statement input
syntax keyword bsv_statement inside
syntax keyword bsv_statement instance
syntax keyword bsv_type      int
syntax keyword bsv_type      integer
syntax keyword bsv_typedef   interface
syntax keyword bsv_statement intersect
syntax keyword bsv_statement join
syntax keyword bsv_statement join_any
syntax keyword bsv_statement join_none
syntax keyword bsv_statement large
syntax keyword bsv_statement liblist
syntax keyword bsv_statement library
syntax keyword bsv_statement local
syntax keyword bsv_statement localparam
syntax keyword bsv_statement logic
syntax keyword bsv_type      longint
syntax keyword bsv_statement macromodule
syntax keyword bsv_conditional matches
syntax keyword bsv_statement medium
syntax keyword bsv_statement modport
syntax keyword bsv_statement module
syntax keyword bsv_statement nand
syntax keyword bsv_statement negedge
syntax keyword bsv_statement new
syntax keyword bsv_statement nmos
syntax keyword bsv_statement nor
syntax keyword bsv_statement noshowcancelled
syntax keyword bsv_statement not
syntax keyword bsv_statement notif0
syntax keyword bsv_statement notif1
syntax keyword bsv_statement null
syntax keyword bsv_statement or
syntax keyword bsv_statement output
syntax keyword bsv_statement package
syntax keyword bsv_statement packed
syntax keyword bsv_statement parameter
syntax keyword bsv_statement pmos
syntax keyword bsv_statement posedge
syntax keyword bsv_statement primitive
syntax keyword bsv_statement priority
syntax keyword bsv_statement program
syntax keyword bsv_statement property
syntax keyword bsv_statement protected
syntax keyword bsv_statement pull0
syntax keyword bsv_statement pull1
syntax keyword bsv_statement pulldown
syntax keyword bsv_statement pullup
syntax keyword bsv_statement pulsestyle_onevent
syntax keyword bsv_statement pulsestyle_ondetect
syntax keyword bsv_statement pure
syntax keyword bsv_statement rand
syntax keyword bsv_statement randc
syntax keyword bsv_statement randcase
syntax keyword bsv_statement randsequence
syntax keyword bsv_statement rcmos
syntax keyword bsv_type      real
syntax keyword bsv_type      realtime
syntax keyword bsv_statement ref
syntax keyword bsv_type      reg
syntax keyword bsv_statement release
syntax keyword bsv_statement repeat
syntax keyword bsv_statement return
syntax keyword bsv_statement rnmos
syntax keyword bsv_statement rpmos
syntax keyword bsv_statement rtran
syntax keyword bsv_statement rtranif0
syntax keyword bsv_statement rtranif1
syntax keyword bsv_statement scalared
syntax keyword bsv_statement sequence
syntax keyword bsv_type      shortint
syntax keyword bsv_type      shortreal
syntax keyword bsv_statement showcancelled
syntax keyword bsv_statement signed
syntax keyword bsv_statement small
syntax keyword bsv_statement solve
syntax keyword bsv_statement specify
syntax keyword bsv_statement specparam
syntax keyword bsv_statement static
syntax keyword bsv_statement string
syntax keyword bsv_statement strong0
syntax keyword bsv_statement strong1
syntax keyword bsv_structure struct
syntax keyword bsv_statement super
syntax keyword bsv_statement supply0
syntax keyword bsv_statement supply1
syntax keyword bsv_statement table
syntax keyword bsv_structure tagged
syntax keyword bsv_statement task
syntax keyword bsv_statement this
syntax keyword bsv_statement throughout
syntax keyword bsv_type      time
syntax keyword bsv_statement timeprecision
syntax keyword bsv_statement timeunit
syntax keyword bsv_statement tran
syntax keyword bsv_statement tranif0
syntax keyword bsv_statement tranif1
syntax keyword bsv_statement tri
syntax keyword bsv_statement tri0
syntax keyword bsv_statement tri1
syntax keyword bsv_statement triand
syntax keyword bsv_statement trior
syntax keyword bsv_statement trireg
syntax keyword bsv_statement type
syntax keyword bsv_typedef   typedef
syntax keyword bsv_structure union
syntax keyword bsv_statement unique
syntax keyword bsv_statement unsigned
syntax keyword bsv_statement use
syntax keyword bsv_statement var
syntax keyword bsv_statement vectored
syntax keyword bsv_statement virtual
syntax keyword bsv_type      void
syntax keyword bsv_statement wait
syntax keyword bsv_statement wait_order
syntax keyword bsv_statement wand
syntax keyword bsv_statement weak0
syntax keyword bsv_statement weak1
syntax keyword bsv_loop      while
syntax keyword bsv_statement wildcard
syntax keyword bsv_type      wire
syntax keyword bsv_statement with
syntax keyword bsv_statement within
syntax keyword bsv_statement wor
syntax keyword bsv_statement xnor
syntax keyword bsv_statement xor
" BSV keywords
syntax keyword bsv_statement action
syntax keyword bsv_statement endaction
syntax keyword bsv_statement actionvalue
syntax keyword bsv_statement endactionvalue
syntax keyword bsv_statement ancestor
syntax keyword bsv_statement deriving
syntax keyword bsv_statement endinstance
syntax keyword bsv_statement let
syntax keyword bsv_statement match
syntax keyword bsv_statement method
syntax keyword bsv_statement endmethod
syntax keyword bsv_statement par
syntax keyword bsv_statement endpar
syntax keyword bsv_statement powered_by
syntax keyword bsv_statement provisos
syntax keyword bsv_statement rule
syntax keyword bsv_statement endrule
syntax keyword bsv_statement rules
syntax keyword bsv_statement endrules
syntax keyword bsv_statement seq
syntax keyword bsv_statement endseq
syntax keyword bsv_statement schedule
syntax keyword bsv_statement typeclass
syntax keyword bsv_statement endtypeclass
syntax keyword bsv_statement clock
syntax keyword bsv_statement reset
syntax keyword bsv_statement noreset
syntax keyword bsv_statement no_reset
syntax keyword bsv_statement valueof
syntax keyword bsv_statement valueOf
syntax keyword bsv_statement clocked_by
syntax keyword bsv_statement reset_by
syntax keyword bsv_statement default_clock
syntax keyword bsv_statement default_reset
syntax keyword bsv_statement output_clock
syntax keyword bsv_statement output_reset
syntax keyword bsv_statement input_clock
syntax keyword bsv_statement input_reset
syntax keyword bsv_statement same_family


" frequently used predefined types
syntax keyword bsv_type Action
syntax keyword bsv_type ActionValue
syntax keyword bsv_type Integer
syntax keyword bsv_type Nat
syntax keyword bsv_type Bit
syntax keyword bsv_type UInt
syntax keyword bsv_type Int
syntax keyword bsv_type Bool
syntax keyword bsv_type Maybe
syntax keyword bsv_type String
syntax keyword bsv_type Either
syntax keyword bsv_type Rules
syntax keyword bsv_type Module
syntax keyword bsv_type Clock
syntax keyword bsv_type Reset
syntax keyword bsv_type Power
syntax keyword bsv_type TAdd TSub TMul TDiv TLog TExp

syntax keyword bsv_interface Empty
syntax keyword bsv_interface Reg
syntax keyword bsv_interface RWire Wire BypassWire PulseWire
syntax keyword bsv_interface RegFile
syntax keyword bsv_interface Vector
syntax keyword bsv_interface FIFO FIFOF

syntax keyword bsv_typeclass Bits Eq Ord Bounded
syntax keyword bsv_typeclass Arith Literal Bitwise BitReduction BitExtend
syntax keyword bsv_typeclass IsModule
syntax keyword bsv_typeclass Add Max Log

" frequently used expressions
syntax keyword bsv_bool True
syntax keyword bsv_bool False
syntax keyword bsv_function mkReg mkRegU mkRegA mkRWire mkWire mkFIFO mkFIFO1
syntax keyword bsv_function mkBypassWire mkDWire mkPulseWire
syntax keyword bsv_function pack unpack zeroExtend signExtend truncate
syntax keyword bsv_function fromInteger inLiteralRange negate
syntax keyword bsv_function minBound maxBound
syntax keyword bsv_function signedShiftRight div mod exp log2 add abs max min quot rem
syntax keyword bsv_function fromMaybe isValid noAction
syntax keyword bsv_function error warning message messageM
syntax keyword bsv_function nosplit emptyRules addRules rJoin rJoinPreempts rJoinDescendingUrgency

" system tasks
syntax match bsv_system_task "\$display"
syntax match bsv_system_task "\$displayb"
syntax match bsv_system_task "\$displayh"
syntax match bsv_system_task "\$displayo"
syntax match bsv_system_task "\$write"
syntax match bsv_system_task "\$writeb"
syntax match bsv_system_task "\$writeh"
syntax match bsv_system_task "\$writeo"
syntax match bsv_system_task "\$fopen"
syntax match bsv_system_task "\$fclose"
syntax match bsv_system_task "\$fgetc"
syntax match bsv_system_task "\$ungetc"
syntax match bsv_system_task "\$fflush"
syntax match bsv_system_task "\$fdisplay"
syntax match bsv_system_task "\$fdisplayb"
syntax match bsv_system_task "\$fdisplayh"
syntax match bsv_system_task "\$fdisplayo"
syntax match bsv_system_task "\$fwrite"
syntax match bsv_system_task "\$fwriteb"
syntax match bsv_system_task "\$fwriteh"
syntax match bsv_system_task "\$fwriteo"
syntax match bsv_system_task "\$stop"
syntax match bsv_system_task "\$finish"
syntax match bsv_system_task "\$dumpon"
syntax match bsv_system_task "\$dumpoff"
syntax match bsv_system_task "\$dumpvars"
syntax match bsv_system_task "\$dumpfile"
syntax match bsv_system_task "\$dumpflush"
syntax match bsv_system_task "\$time"
syntax match bsv_system_task "\$stime"
syntax match bsv_system_task "\$signed"
syntax match bsv_system_task "\$unsigned"
syntax match bsv_system_task "\$test$plusargs"

" attributes
syntax keyword bsv_attribute synthesize noinline doc options
syntax keyword bsv_attribute always_ready always_enabled
syntax keyword bsv_attribute ready enable result prefix port
syntax keyword bsv_attribute fire_when_enabled no_implicit_conditions
syntax keyword bsv_attribute bit_blast scan_insert
syntax keyword bsv_attribute descending_urgency preempts
syntax keyword bsv_attribute internal_scheduling method_scheduling
syntax keyword bsv_attribute CLK RST_N RSTN ungated_clock
syntax region  bsv_attributes start="(\*" end="\*)" contains=bsv_attribute

" link classes to vim colors
highlight link bsv_statement Keyword
highlight link bsv_typedef Typedef
highlight link bsv_type Type
highlight link bsv_interface Type
highlight link bsv_typeclass Type
highlight link bsv_structure Structure
highlight link bsv_conditional Conditional
highlight link bsv_loop Repeat
highlight link bsv_comment Comment
highlight link bsv_op Operator
highlight link bsv_string String
highlight link bsv_bool Boolean
highlight link bsv_number Number
" highlighting identifiers gets a bit garish
" highlight link bsv_identifier Identifier
highlight link bsv_function Function
highlight link bsv_system_task Function
highlight link bsv_todo Todo
highlight link bsv_attributes SpecialComment
highlight link bsv_attribute Keyword

let b:current_syntax="bsv"

