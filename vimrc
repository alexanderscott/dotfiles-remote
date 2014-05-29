set nocompatible        " must be first line

scriptencoding utf-8

" Load bundled plugins
call pathogen#infect()
call pathogen#helptags()


" GENERAL SETTINGS {
	filetype plugin indent on
    "filetype indent on
	syntax on

	set nobackup                   " Disable backup
	set noswapfile                 " Disable swapfile
    "set backupdir=~/.vim/backups    " Centralize backups
    "set directory=~/.vim/swaps      " Centralize swapfiles
    "if exists("&backupdir")
        "set backupdir=~/.vim/backups    " Centralize backups
    "endif
    "if exists("&swapsdir")
        "set directory=~/.vim/swaps      " Centralize swapfiles
    "endif
    "if exists("&undodir")
        "set undodir=~/.vim/undo     " Centralize swapfiles
    "endif
    

    set clipboard+=unnamed         " yank and paste between vim instances
    "set clipboard=unnamed           " Use the OS clipboard by default (on versions compiled with `+clipboard`)
    
	if has('mouse')
        set mouse=a                 " Enable mouse in all modes
	  "set mouse=nv		            " Don't want the mouse to work in insert mode.
	  "set mousehide		        " hide the mouse cursor while typing
	endif

	if !has('gui')
		set term=$TERM              " Make arrow and other keys work
	endif

    if has('cmdline_info')
        set ruler                   " show the ruler
        set showcmd                 " show partial commands in status line and
    endif

    set exrc                        " Enable per-directory .vimrc files and 
    set secure                      " disable unsafe commands in per-directory .vimrc

    set esckeys                     " Allow cursor keys in insert mode

    set ttyfast                     " Optimize for fast terminal connections
	"set history=1000
    "set visualbell
    set noerrorbells                " Disable error bells

    set shortmess=atI               " Don’t show the intro message when starting Vim

	set virtualedit=onemore         " allow for cursor beyond last character
	"set hidden                      " allow buffer switching without saving
    set tabpagemax=10               " only show 15 tabs
    set showmode                    " display the current mode
    set cursorline                  " highlight current line
    set backspace=indent,eol,start  " backspace for dummies
	set nojoinspaces
	"set nrformats=
    " set linespace=0                 " No extra spaces between rows
    "set gdefault                    " Add the g flag to search/replace by default
    set number                      " Line numbers on
    set showmatch                   " show matching brackets/parenthesis
    set incsearch                   " find as you type search
    set hlsearch                    " highlight search terms
    set winminheight=0              " windows can be 0 line high
    set ignorecase                  " case insensitive search
    set smartcase                   " case sensitive when uc present
    set wildmenu                    " show list instead of just completing
    set wildmode=list:longest,full  " command <Tab> completion, list matches, then longest common part, then all.
    set whichwrap=b,s,h,l,<,>,[,]   " backspace and cursor keys wrap to
    set scrolljump=10                " lines to scroll when cursor leaves screen
    set scrolloff=5                 " minimum lines to keep above and below cursor

    "set foldenable                  " auto fold code
    set nofoldenable                " disable folding
	set laststatus=2
	set listchars=tab:▸\ ,eol:¬

    set guitablabel=%t              "show only filename in buffer tab
    set binary                      " no new end of line created

	" Formatting
	set tabstop=4
	set softtabstop=4
	set shiftwidth=4
	set expandtab
    
    set comments=sl:/**,mb:*,elx:**/  " auto format comment blocks


" KEY MAPPINGS {
	let mapleader = ","			" <leader> is set to comma

    " Insert line without going into insert mode
    "nnoremap <S-Enter> o<Esc>
    nnoremap <leader>o o<Esc>
    nnoremap <S-Enter> o<Esc>
    "nnoremap jo o<Esc>

    "dd and x do not cut to clipboard
    nnoremap dd "_dd<CR>
    nnoremap x "_x
    vnoremap x "_x

    "paste without updating register
    vnoremap p "_dP

    " Insert after tab
    nnoremap <Tab> <Tab>i

	" Quick toggles {{{2
    nmap <silent> <leader>l :set list!<CR>
    nmap <silent> <leader>w :set wrap!<CR>
    nmap <silent> <buffer> <leader>s :set spell!<CR>
    nmap <silent> <leader>n :silent :nohlsearch<CR>

    " Toggle paste mode on and off
    "map <leader>pp :setlocal paste!<cr>
    "nnoremap <leader>pp :set invpaste paste?<CR>
    set pastetoggle=<leader>pp

    vnoremap <silent> <leader>a :EasyAlign<CR>
	" Commands to quickly set >1 option in one go {{{2
	"command! -nargs=* Wrap set wrap linebreak nolist
	"command! -nargs=* Maxsize set columns=1000 lines=1000

	"map <leader>u :GundoToggle<CR>

    nmap <leader>tt :TagbarToggle<CR>

    " Wrapped lines goes down/up to next row, rather than next line in file.
    nnoremap j gj
    nnoremap k gk

    " Yank from the cursor to the end of the line, to be consistent with C and D.
    nnoremap Y y$

    "Clearing highlighted search
    nmap <silent> <leader>/ :nohlsearch<CR>

    " For when you forget to sudo.. Really Write the file.
    "cmap w!! w !sudo tee % >/dev/null

    " visual shifting (does not exit Visual mode)
    vnoremap < <gv
    vnoremap > >gv

    " Investigate under cursor using Dash.app
    " https://github.com/Keithbsmiley/investigate.vim
    nnoremap <leader>k :call investigate#Investigate()<CR>
    let g:investigate_use_dash=1

    " Switch between buffers
  	inoremap  <C-l> :tabn<CR>
  	vnoremap  <C-l> :tabn<CR>
  	nnoremap  <C-l> :tabn<CR>
    
	inoremap  <C-h> :tabp<CR>
	nnoremap  <C-h> :tabp<CR>
	vnoremap  <C-h> :tabp<CR>

	inoremap  <C-n> :tabnew<CR>
	vnoremap  <C-n> :tabnew<CR>
	nnoremap  <C-n> :tabnew<CR>

    " copy/paste with control
    vnoremap <C-x> :!pbcopy<CR>
    vnoremap <C-c> :w !pbcopy<CR><CR>

	" nnoremap <C-k> <C-W>k
	" nnoremap <C-j> <C-W>j
	" nnoremap <C-h> <C-W>h
	" nnoremap <C-l> <C-W>l


	" Stupid shift key fixes
    "if !exists('g:spf13_no_keyfixes')
        "if has("user_commands")
            "command! -bang -nargs=* -complete=file E e<bang> <args>
            "command! -bang -nargs=* -complete=file W w<bang> <args>
            "command! -bang -nargs=* -complete=file Wq wq<bang> <args>
            "command! -bang -nargs=* -complete=file WQ wq<bang> <args>
            "command! -bang Wa wa<bang>
            "command! -bang WA wa<bang>
            "command! -bang Q q<bang>
            "command! -bang QA qa<bang>
            "command! -bang Qa qa<bang>
        "endif

        "cmap Tabe tabe
    "endif

    " Easier horizontal scrolling
    "map zl zL
    "map zh zH

	" File opening {


		" Prompt to open file with same name, different extension
		"map <leader>er :e <C-R>=expand("%:r")."."<CR>
		" Fix the & command in normal+visual modes 
		"nnoremap & :&&<Enter>
		"xnoremap & :&&<Enter>

	" }
" }


" VIM UI {
    set background=dark
     "color ir_black
    "color aptana_studio
    colorscheme jellybeans
    "color lucius
    "color Tomorrow-Night
    colorscheme jellybeans

    "set background=dark
    "let g:solarized_termtrans=1
    "let g:solarized_termcolors=256
    "let g:solarized_contrast="high"
    "let g:solarized_visibility="high"
    "colorscheme solarized
    

    " SASS recognition
    "let g:ruby_path = system('rvm current')

	" Tab-completion in command-line mode
	"set suffixes=.otl

    " Make vsplits open to the right and splits open below
    "set splitright
    "set splitbelow
    
    "Capital W/Q same as w/q in command mode
    cnoreabbrev W w
    cnoreabbrev Q q

" }



" PLUGINS (bundles) {

	" Space.vim {
		" let g:space_disable_select_mode=1
		" let g:space_no_search = 1
	" }


	" Vim wiki {
		"let g:vimwiki_menu=''
		" vim: nowrap fdm=marker
	" }

	" Ctlr-P.vim {
        let g:ctrlp_map = '<c-p>'
        let g:ctrlp_cmd = 'CtrlP'
		let g:ctrlp_jump_to_buffer = 0
		let g:ctrlp_working_path_mode = 0
        set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
        set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

        let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
	" }

    " Vim CSS Colors {
        let g:cssColorVimDoNotMessMyUpdatetime = 1

    " }

	" NerdTree.vim {
		map <C-e> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
		imap <C-e> :NERDTreeToggle<CR>:NERDTreeMirror<CR>

		" map <C-e> :NERDTreeToggle<CR>
		map <leader>e :NERDTreeFind<CR>
		nmap <leader>nt :NERDTreeFind<CR>

		" Remove warnings
		let g:NERDShutUp=1
		let b:match_ignorecase = 1

		let NERDTreeShowBookmarks=1
		"let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
		let NERDTreeChDirMode=1
		let NERDTreeQuitOnOpen=1
		let NERDTreeMouseMode=2
		let NERDTreeShowHidden=1
		let NERDTreeKeepTreeInNewTab=0
		let NERDTreeMinimalUI=1 " Disables display of the 'Bookmarks' label and 'Press ? for help' text.
		let g:nerdtree_tabs_open_on_gui_startup=1

        " change NERDTree colors
        hi Directory guifg=#FF0000 ctermfg=yellow      
        "hi Directory guifg=#FF0000 ctermfg=blue    

		" map <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>

	" }

	" Syntastic {
         let g:syntastic_enable_signs=1
         let g:syntastic_auto_jump=0
	" }

    
    " Command-T {
        "noremap <leader>c <Esc>:CommandT<CR>
        "noremap <leader>C <Esc>:CommandTFlush<CR>
        "noremap <leader>b <Esc>:CommandTBuffer<CR>
    " }

    " ConqueTerm - run bash shell inside vim
    "nnoremap <leader>sh :ConqueTerm bash<CR>

    " compile coffeescript automatically {
        "au BufWritePost *.coffee silent CoffeeMake | cwindow | redraw!
    "
    
    " }
" }

" GUI SETTINGS {
    " GVIM- (here instead of .gvimrc)
    if has('gui_running')
        set guioptions-=T           " remove the toolbar
        set lines=40                " 40 lines of text instead of 24,
        if has("gui_gtk2")
            "set guifont=Andale\ Mono\ Regular\ 12,Menlo\ Regular\ 11,Consolas\ Regular\ 16,Courier\ New\ Regular\ 14
        else
            "set guifont=Andale\ Mono\ Regular:h12,Menlo\ Regular:h11,Consolas\ Regular:h16,Courier\ New\ Regular:h14
        endif
        if has('gui_macvim')
            set transparency=5          " Make the window slightly transparent
        endif
    else
        if &term == 'xterm' || &term == 'screen'
            set t_Co=256                 " Enable 256 colors to stop the CSApprox warning and make xterm vim shine
        endif
        "set term=builtin_ansi       " Make arrow and other keys work
    endif
" }


" For saving as sudo
cmap w!! w !sudo tee % >/dev/null


" FUNCTIONS {
    " fold javascript code {
    "function! JavaScriptFold() 
        "setl foldmethod=syntax
        "setl foldlevelstart=1
        "syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

        "function! FoldText()
            "return substitute(getline(v:foldstart), '{.*', '{...}', '')
        "endfunction
        "setl foldtext=FoldText()
    "endfunction
    "au FileType javascript call JavaScriptFold()
    "au FileType javascript setl fen
    "au BufRead * normal zR

    " Strip trailing whitespace (,ss)
    function! StripWhitespace()
            let save_cursor = getpos(".")
            let old_query = getreg('/')
            :%s/\s\+$//e
            call setpos('.', save_cursor)
            call setreg('/', old_query)
    endfunction

    noremap <leader>ss :call StripWhitespace()<CR>

" }





" Listen for changes to this vimrc file and reload vim
"augroup myvimrc
    "au!
    "au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
"augroup END


" Use local vimrc if available {
    "if filereadable(expand("~/dotfiles/vimrc.local"))
        "source ~/dotfiles/vimrc.local
    "endif
" }

" Use local gvimrc if available and gui is running {
    "if has('gui_running')
        "if filereadable(expand("~/dotfiles/gvimrc.local"))
            "source ~/dotfiles/gvimrc.local
        "endif
    "endif
" }


" Automatic commands
if has("autocmd")
	"filetype on

    autocmd BufRead,BufNewFile *.json setfiletype=json syntax=javascript     " Treat json files as js
    autocmd FileType ruby,haml,eruby,yaml,scss,sass,coffee set ai sw=2 sts=2 et

    autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif      " Close NERDTree if only buffer remaining is NERDTree

    " Auto-open NERDTree and focus cursor in new document
    "autocmd VimEnter * NERDTree
    "autocmd VimEnter * wincmd p

    "autocmd BufRead,BufNewFile /etc/nginx/*,/usr/local/nginx/conf/*,/vagrant/admin/config/nginx/* if &ft == '' | setfiletype nginx | endif 
    
    "autocmd BufWritePost *.coffee silent CoffeeMake | cwindow | redraw!
    "autocmd BufNewFile,BufReadPost *.coffee setlocal sw=2 sts=2 et
    
    "autocmd! BufRead,BufNewFile *.sass setfiletype sass 
    "autocmd! BufRead,BufNewFile *.scss setfiletype sass 
    "au! FileType scss syntax cluster sassCssAttributes add=@cssColors                                                  "add CSS hex coloring to SASS files
    
    "autocmd FileType html,eruby if g:html_indent_tags !~ '\\|p\>' | let g:html_indent_tags .= '\|p\|li\|dt\|dd' | endif        " Indent p tags 
    
    " Remove trailing whitespaces and ^M chars
    "autocmd FileType c,cpp,java,php,javascript,python,twig,xml,yml autocmd BufWritePre <buffer> call StripTrailingWhitespace()
    "autocmd BufNewFile,BufRead *.html.twig set filetype=html.twig
    
    "autocmd! FileType mkd setlocal syn=off             "Don't syntax highlight markdown because it's often wrong
    
    "autocmd FileType javascript,twig,python,xml autocmd BufWritePre <buffer> call IndentConvert(<line1>,<line2>,1,<q-args>)    " Replace tabs with spaces automatically
endif

