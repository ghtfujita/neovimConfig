" PLUGIN ============================================ vim:fdm=marker:foldlevel=0

" [v]implug init{{{ --------------------------------------------------
" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
  \| endif

" source by relative path
" function! RSource(relativePath)
" 	let fullPath = '$HOME/.dotfiles/.nvim/rc/plug-config/' . a:relativePath
" 	exec 'source ' . fullPath
" endfunction
" command! -nargs=1 RSource :call RSource (<q-args>)
"}}} -----------------------------------------------------------------

" [p]lugin list{{{ ---------------------------------------------------
call plug#begin('~/.vim/plugged')
	" on-load's
		source $HOME/.dotfiles/.nvim/rc/plug-config/fzf.vim
		source $HOME/.dotfiles/.nvim/rc/plug-config/vim-fugitive.vim
		source $HOME/.dotfiles/.nvim/rc/plug-config/vim-gitgutter.vim
		source $HOME/.dotfiles/.nvim/rc/plug-config/vim-airline.vim
		source $HOME/.dotfiles/.nvim/rc/plug-config/vim-tmux-navigator.vim
		" source $HOME/.dotfiles/.nvim/rc/plug-config/fern.vim
		source $HOME/.dotfiles/.nvim/rc/plug-config/vim-startify.vim
		source $HOME/.dotfiles/.nvim/rc/plug-config/vim-colorschemes.vim
		source $HOME/.dotfiles/.nvim/rc/plug-config/nvim-lspconfig.vim
		" source $HOME/.dotfiles/.nvim/rc/plug-config/nvim-compe.vim
	" Lazies
		" source $HOME/.dotfiles/.nvim/rc/plug-config/vim-floaterm.vim
		source $HOME/.dotfiles/.nvim/rc/plug-config/vim-surround.vim
		" source $HOME/.dotfiles/.nvim/rc/plug-config/vim-commentary.vim
		source $HOME/.dotfiles/.nvim/rc/plug-config/vim-rails.vim
		source $HOME/.dotfiles/.nvim/rc/plug-config/vim-polyglot.vim
		source $HOME/.dotfiles/.nvim/rc/plug-config/vim-textobj.vim
		source $HOME/.dotfiles/.nvim/rc/plug-config/lexima.vim
		source $HOME/.dotfiles/.nvim/rc/plug-config/vim-closetag.vim
		source $HOME/.dotfiles/.nvim/rc/plug-config/vim-highlightedyank.vim
		source $HOME/.dotfiles/.nvim/rc/plug-config/winresizer.vim
		source $HOME/.dotfiles/.nvim/rc/plug-config/vim-wakatime.vim
		source $HOME/.dotfiles/.nvim/rc/plug-config/vimade.vim
		source $HOME/.dotfiles/.nvim/rc/plug-config/open-browser.vim
		source $HOME/.dotfiles/.nvim/rc/plug-config/vim-auto-save.vim
		source $HOME/.dotfiles/.nvim/rc/plug-config/codi.vim
		source $HOME/.dotfiles/.nvim/rc/plug-config/vim-precious.vim
		source $HOME/.dotfiles/.nvim/rc/plug-config/rainbow_parentheses.vim
		source $HOME/.dotfiles/.nvim/rc/plug-config/traces.vim
		source $HOME/.dotfiles/.nvim/rc/plug-config/vim-which-key.vim
		source $HOME/.dotfiles/.nvim/rc/plug-config/previm.vim
		source $HOME/.dotfiles/.nvim/rc/plug-config/vim-hexokinase.vim
		source $HOME/.dotfiles/.nvim/rc/plug-config/eskk.vim
		source $HOME/.dotfiles/.nvim/rc/plug-config/comfortable-motion.vim
		source $HOME/.dotfiles/.nvim/rc/plug-config/blamer.vim
		source $HOME/.dotfiles/.nvim/rc/plug-config/nvim-cmp.vim
		" source $HOME/.dotfiles/.nvim/rc/plug-config/command.vim
		source $HOME/.dotfiles/.nvim/rc/plug-config/caw.vim
		source $HOME/.dotfiles/.nvim/rc/plug-config/vim-easy-align.vim
		source $HOME/.dotfiles/.nvim/rc/plug-config/coc.vim
		source $HOME/.dotfiles/.nvim/rc/plug-config/vim-endwise.vim
		" source $HOME/.dotfiles/.nvim/rc/plug-config/vim-open-or-create-path-and-file.vim
		source $HOME/.dotfiles/.nvim/rc/plug-config/vim-arduino-syntax.vim
		source $HOME/.dotfiles/.nvim/rc/plug-config/vim-arduino.vim
		source $HOME/.dotfiles/.nvim/rc/plug-config/nvim-treelua.vim
		luafile $HOME/.dotfiles/.nvim/rc/plug-config/bufferline.vim
		source $HOME/.dotfiles/.nvim/rc/plug-config/bufferline.lua
	" Local's
		source $HOME/.dotfiles/.nvim/rc/plug-config/zoom_pane.vim
		source $HOME/.dotfiles/.nvim/rc/plug-config/move_or_add_pane.vim
call plug#end()
"}}} -----------------------------------------------------------------

" [a]fter-plug-load settings{{{ --------------------------------------
luafile $HOME/.dotfiles/.nvim/rc/plug-config/lsp.lua
luafile $HOME/.dotfiles/.nvim/rc/plug-config/nvim-tree.lua
" autocmd VimEnter * normal :luafile $HOME/.dotfiles/.nvim/rc/plug-config/bufferline.lua
" autocmd VimEnter * normal :Fern .
"}}} -----------------------------------------------------------------

" SETTING ======================================================================

" [g]eneral setting{{{ -----------------------------------------------
set shell=/bin/zsh
set autoread
set clipboard=unnamed
set pumblend=20  " transparency in popup window
set nocompatible
syntax on
set mouse=a
" carry undo history after closing app{{{
if has('persistent_undo')
	let undo_path = expand('${HOME}/.config/nvim/undo-history')
	exe 'set undodir=' .. undo_path
	set undofile
endif
"}}}
"}}} -----------------------------------------------------------------

" [c]olors{{{ --------------------------------------------------------
" Color palette: https://www.ditig.com/256-colors-cheat-sheet
autocmd VimEnter * nested colorscheme moonfly
set termguicolors
highlight NonText      ctermfg=246  ctermbg=none guifg=#949494 guibg=none   " for eol, extends, precedes listchars
highlight Whitespace   ctermfg=7    ctermbg=none guifg=#c0c0c0 guibg=none   " for nbsp, space, tab, trails listchars
highlight lineNr       ctermfg=250  ctermbg=none guifg=#bcbcbc guibg=none
highlight CursorLineNr ctermfg=111  ctermbg=none guifg=#87afff guibg=none
highlight SignColumn   ctermfg=none ctermbg=None guifg=none    guibg=None
highlight VertSplit    ctermfg=234  ctermbg=234  guifg=#1c1c1c guibg=#1c1c1c
highlight Visual       ctermfg=none ctermbg=90   guifg=none    guibg=#870087
autocmd InsertEnter * highlight CursorLine ctermbg=24  guibg=#005f87
autocmd InsertLeave * highlight CursorLine ctermbg=236 guibg=#303030
"}}} -----------------------------------------------------------------

" [e]ditor space{{{ --------------------------------------------------
set nowrap
set tabstop=4
set shiftwidth=0
set softtabstop=4
" set expandtab
set autoindent
set smartindent
set scrolloff=10
set sidescrolloff=10
set foldenable
set foldlevelstart=0
set foldnestmax=10
set foldmethod=syntax
set mat=1  "Set matching bracket for 1 second
set list
set listchars=tab:\|\ ,trail:〿,extends:»,precedes:«,nbsp:%  "eol:↲,▸·▮
set fillchars=fold:\ ,vert:\│,eob:\ ,msgsep:‾  "hide end-of-buffer tilde
set guicursor=i:ver1  " vertical cursor in insert mode
set guicursor+=a:blinkon100  " blinking cursor
" IME auto-off{{{
set updatetime=100
if executable('im-select')
	autocmd InsertLeave,VimEnter,BufWinEnter,WinEnter,CmdlineLeave * :call system('im-select com.google.inputmethod.Japanese.Roman')
endif
"}}}
" cursorline only for current pane{{{
set cursorline
highlight clear CursorLine
augroup vimrc_set_cursorline_only_active_window
	autocmd!
	autocmd VimEnter,BufWinEnter,WinEnter * setlocal cursorline
	autocmd WinLeave * setlocal nocursorline
augroup END
"}}}
" auto-formatting{{{
autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 100)
"}}}
"}}} -----------------------------------------------------------------

" [s]ide column{{{ ---------------------------------------------------{{{{{{
set relativenumber
set number
set signcolumn=yes
" set foldcolumn=1
"}}} -----------------------------------------------------------------}}}}}}

" [b]ottom line{{{ ---------------------------------------------------
" status line
set noshowmode
set laststatus=0

" search
set ignorecase
set smartcase
set hlsearch
set incsearch
" cmd
set wildmode=longest:full,full
set wildmenu
set wildignorecase
"}}} -----------------------------------------------------------------

" [u]ser commands{{{ -------------------------------------------------
command! Conf :source $MYVIMRC <bar> :doautocmd BufRead
command! ConfEdit :e $MYVIMRC
" [disabled] term pane auto-creation in VimEnter{{{
function! Myterm()
	split
	wincmd j
	resize 10
	terminal
	setlocal nonumber norelativenumber
	wincmd k
endfunction
command! Myterm call Myterm()
" autocmd VimEnter * Myterm
"}}}
" compile and execute [F5]{{{
function! Setup()
	let l:no_ext_path = printf("%s/%s", expand("%:h"), expand("%:r"))
	let g:compile_command_dict = {
		\'c': printf('gcc -std=gnu11 -O2 -lm -o %s.out %s && %s/%s.out', expand("%:r"), expand("%:p"), expand("%:h"), expand("%:r")),
		\'cpp': printf('g++ -std=gnu++17 -O2 -o %s.out %s && %s/%s.out', expand("%:r"), expand("%:p"), expand("%:h"), expand("%:r")),
		\'java': printf('javac %s && java %s', expand("%:p"), expand("%:r")),
		\'cs': printf('mcs -r:System.Numerics -langversion:latest %s && mono %s/%s.exe', expand("%:p"), expand("%:h"), expand("%:r")),
		\'python': printf('python3 %s', expand("%:p")),
		\'ruby': printf('ruby %s', expand("%:p")),
		\'javascript': printf('node %s', expand("%:p")),
		\'sh': printf('chmod u+x %s && %s', expand("%:p"), expand("%:p"))
		\}
	if match(keys(g:compile_command_dict), &filetype) >= 0
		" condition: terminal window exists below
		nnoremap <expr> <F5> '<C-w>ji<C-u>' . g:compile_command_dict[&filetype] . '<CR>'
	endif
endfunction
command! Setup call Setup()
autocmd BufNewFile,BufRead * Setup
"}}}
" gf also opens non-existing files{{{
function GF()
	try
		execute "normal! gf"
	catch /E447:/
		let cfile = expand("<cfile>")
		execute "edit " . cfile
	catch
		echo "error. Chk script in init.vim"
	endtry
endfunction
command! GF call GF()
"}}}
"}}} -----------------------------------------------------------------

" KEYMAP =======================================================================

" [o]verall app navigation{{{ ----------------------------------------
" Leader key
let mapleader = "\<Space>"

" reload settings
nmap <silent> <Leader>r :source $MYVIMRC<CR>

" Quick new file
nnoremap <silent> <Leader>n :enew<CR>

" close window
nmap <silent> <Leader>d :bd!<CR>

" exit nvim
map Q <nop>
nmap <silent> <Leader>q :qa<CR>

" save file
nnoremap <Leader>w :up<CR>

" toggle auto-save
nmap <Leader>W :AutoSaveToggle<CR>

" redo
nnoremap U <C-r>

" gf also opens non-existing files
nmap <silent> gf :GF<CR>

" :nohl
nmap <silent> <Esc><Esc> :nohl<CR>

" better command input
noremap ; :

"control fold
nnoremap zz za
nnoremap za zM

" file search
nmap <silent> <leader>f :Files<CR>
map <silent> <C-f> :Files<CR>
nmap <silent> <leader>b :buffers<CR>
map <silent> <C-b> :buffers<CR>
nnoremap <silent> <leader>g :Rg<CR>
nnoremap <silent> <C-g> :Rg<CR>
nnoremap <silent> <leader>t :Tags<CR>
nnoremap <silent> <C-t> :Tags<CR>
" nnoremap <silent> <leader>m :marks<CR>
" nnoremap <silent> <C-m> :marks<CR>
" nnoremap <silent> <leader>e :Startify<CR>
" nnoremap <silent> <C-e> :Startify<CR>
"
" LSP
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
" nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <C-n> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> <C-p> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

" open weblinks
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

"vscode mapping{{{
if exists('g:vscode')
	"" explorer view focus
	nmap <leader>e <cmd>call VSCodeNotify('workbench.view.explorer')<cr>
	"" save file
	nmap <leader>w <cmd>call VSCodeNotify('workbench.action.files.save')<cr>
	""close editor
	nmap <leader>q <cmd>call VSCodeNotify('workbench.action.closeActiveEditor')<cr>
end
"}}}
"}}} -----------------------------------------------------------------

" [m]ode selection{{{ ------------------------------------------------
inoremap hhh <Esc>
inoremap jjj <Esc>
inoremap kkk <Esc>
inoremap lll <Esc>
vnoremap v <Esc>
imap jk <Plug>(eskk:enable)
cmap jk <Plug>(eskk:enable)
" tnoremap <Leader>t <C-\><C-n><C-w>k
" nnoremap <Leader>t <C-w>ji
tnoremap <Esc> <C-\><C-n>
"}}} -----------------------------------------------------------------

" [t]ext action{{{ ---------------------------------------------------
" Text Selection{{{
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'  " "select pasted text
nnoremap <S-h> v<Left>
nnoremap <S-j> v<Down>
nnoremap <S-k> v<Up>
nnoremap <S-l> v<Right>
vnoremap <S-h> <Left>
vnoremap <S-j> <Down>
vnoremap <S-k> <Up>
vnoremap <S-l> <Right>
nnoremap <S-w> viw
vnoremap <S-w> w
vnoremap <S-b> b
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
"}}}

" Text Movement{{{
" move current line(s)
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" in/dedent
nnoremap <C-h> <<
nnoremap <C-l> >>
vnoremap <C-h> <gv
vnoremap <C-l> >gv

" EasyAlign prefix
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

"}}}

" Text Registration(yank){{{
noremap Y y$
"}}}

" Text Addition{{{
" paste during insert mode
imap <C-v> <C-o>[p

" easy insertion of trailing symbols
inoremap <C-;> <Esc>A;<CR>
inoremap <C-,> <Esc>A,<CR>

" make empty new line
nnoremap ✠ o<Esc>hh " ✠ = Ctrl+CR (defined in iTerm2 key config)
nnoremap ۩ O<Esc>   " ۩ = Ctrl+Shift+CR
inoremap ✠ <Esc>o
inoremap ۩ <Esc>O
nnoremap <C-CR> o<Esc>hh
nnoremap <C-S-CR> O<Esc>
inoremap <C-CR> <Esc>o
inoremap <C-S-CR> <Esc>O
"}}}

" Text Subtraction{{{
" C-d to delete
inoremap <C-d> <Del>

" delete char w/o yanking
nnoremap x "_x
nnoremap s "_s
nnoremap c "_c
nnoremap d "_d
nnoremap text "_text
nnoremap dd "_dd
nnoremap D "_D

" cut
nnoremap t d
vnoremap t x
nnoremap tt dd
nnoremap T D

" clear text in current line
nmap <C-c> 0D
imap <C-c> <Esc>0Di
"}}}

" Text Replacement{{{
" replacing >1 letters
nnoremap r a<BS>

" toggle case of char(s)
nnoremap <C-u> vg~
vnoremap <C-u> g~gv=gv

" join w/o spaces
vnoremap J gJ

" in/decrement numbers
noremap = <C-a>
noremap - <C-x>


" commenting
nmap <TAB> <Plug>(caw:prefix)
xmap <TAB> <Plug>(caw:prefix)
nmap <TAB><TAB> <Plug>(caw:hatpos:toggle)
xmap <TAB><TAB> <Plug>(caw:hatpos:toggle)
nmap <TAB>. <Plug>(caw:zeropos:toggle)
xmap <TAB>. <Plug>(caw:zeropos:toggle)
nmap <TAB>a <Plug>(caw:dollarpos:toggle)
xmap <TAB>a <Plug>(caw:dollarpos:toggle)
nmap <TAB>w <Plug>(caw:wrap:toggle)
xmap <TAB>w <Plug>(caw:wrap:toggle)
nmap <TAB>B <Plug>(caw:box:comment)
"}}}
"}}} -----------------------------------------------------------------

" [c]ursor movement{{{ -----------------------------------------------
" move at the end of pasted text
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" moving up/down
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" set mark
nmap <leader>m m
nmap m <nop>
" jump to mark
nmap gm `

" left/right cursor move & backspace can cross lines
set whichwrap=b,s,h,l,<,>,[,]
set backspace=indent,eol,start

" move cursor to the beg/end of line
noremap <C-a> 0
noremap <C-e> $

" make cursor movable during insert mode with C-hjkl
inoremap <C-h> <left>
inoremap <C-j> <down>
inoremap <C-k> <up>
inoremap <C-l> <right>

" '0' will switch b/w '0' and '^'
noremap <expr> 0 getline('.')[0 : col('.') - 2] =~# '^\s\+$' ? '0' : '^'
"}}} -----------------------------------------------------------------

" [w]orkspace selection{{{ -------------------------------------------
" switch active windows - keybind effective in tmux as well w/vim-tmux-navigator
" ref: https://postd.cc/how-to-boost-your-vim-productivity/ ---#8
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <Left> :TmuxNavigateLeft<cr>
nnoremap <silent> <Down> :TmuxNavigateDown<cr>
nnoremap <silent> <Up> :TmuxNavigateUp<cr>
nnoremap <silent> <Right> :TmuxNavigateRight<cr>
nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>
" nmap <silent> <Left> :wincmd h<CR>
" nmap <silent> <Down> :wincmd j<CR>
" nmap <silent> <Up> :wincmd k<CR>
" nmap <silent> <Right> :wincmd l<CR>

" move across tabs
nmap <Leader>h <Plug>AirlineSelectPrevTab
nmap <Leader>l <Plug>AirlineSelectNextTab

" split panes
nmap <silent> <Leader><Left> :vs<CR>:Startify<CR>
nmap <silent> <Leader><Up> :sp<CR>:Startify<CR>
nmap <silent> <Leader><Right> :vs<CR>:wincmd l<CR>:Startify<CR>
nmap <silent> <Leader><Down> :sp<CR>:wincmd j<CR>:Startify<CR>

" change current window size
" nnoremap <Leader><C-h> :WinResizerStartResize<CR>h<CR>
" nnoremap <Leader><C-j> :WinResizerStartResize<CR>j<CR>
" nnoremap <Leader><C-k> :WinResizerStartResize<CR>k<CR>
" nnoremap <Leader><C-l> :WinResizerStartResize<CR>l<CR>
" nnoremap <Leader>r :WinResizerStartResize<CR>

" maximize current pane/ toggle
nmap <silent> <Leader><Leader> <Plug>(Zoom)

" buffer window navigation
nnoremap <silent> <Leader>bb :bprev<CR>
nnoremap <silent> <Leader>bn :bnext<CR>
nnoremap <silent> <Leader>bl :ls<CR>:b
set hidden " disable save confirmation
"}}} -----------------------------------------------------------------

