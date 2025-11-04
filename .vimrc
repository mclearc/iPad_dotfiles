 " Basic settings
 set nocompatible
 syntax on
 filetype plugin indent on
 
 " Set spacebar as leader key
 let mapleader = " "

 " Reload vimrc with space+r
   nnoremap <leader>r :source ~/Documents/.vimrc<CR>:echo "vimrc reloaded"<CR>
 
 " Use system clipboard by default
 set clipboard=unnamed

" Cursor shape and color changes using iOS blue
 let &t_SI = "\e[6 q\e]12;#00D46A\x7"    " Green bar in insert mode
 let &t_EI = "\e[2 q\e]12;#007AFF\x7"    " iOS blue block in normal mode
 let &t_SR = "\e[4 q\e]12;#FF453A\x7"    " Red underline in replace mode
 
 " Writing-friendly display settings
 set number
 set showcmd
 set ruler
 set cursorline
 set linebreak           " Break lines at word boundaries
 set wrap                " Enable line wrapping
 set textwidth=0         " Don't auto-insert line breaks by default
 set wrapmargin=0
 set colorcolumn=81      " Visual guide at 80 characters
 
 " Paragraph formatting
 set formatoptions+=t    " Auto-wrap text using textwidth
 set formatoptions+=c    " Auto-wrap comments
 set formatoptions+=q    " Allow formatting of comments with gq
 set formatoptions+=n    " Recognize numbered lists
 set formatoptions+=1    " Don't break line after one-letter word
 
 " Spell checking
 set spell spelllang=en_us
 set spellfile=~/Documents/.vim/spell/en.utf-8.add
 
 " Navigation for wrapped lines (visual line movement)
 nnoremap j gj
 nnoremap k gk
 nnoremap 0 g0
 nnoremap $ g$
 vnoremap j gj
 vnoremap k gk
 vnoremap 0 g0
 vnoremap $ g$
 
 " Search settings
 set incsearch
 set hlsearch
 set ignorecase
 set smartcase
 
 " Clear search highlighting
 nnoremap <leader><space> :nohlsearch<CR>
 
 " Indentation for prose
 set autoindent
 set tabstop=2
 set shiftwidth=2
 set expandtab
 
 " Interface improvements
 set wildmenu
 set wildmode=list:longest,full
 set scrolloff=5         " Keep 5 lines visible above/below cursor
 set sidescrolloff=5
 set laststatus=2        " Always show status line
 set noerrorbells        " No annoying bells
 
 " Split behavior
 set splitbelow
 set splitright
 
 " Backup and swap file settings
 set nobackup
 set noswapfile
 set undofile
 set undodir=~/Documents/.vim/undo
 set undolevels=1000
 
 " Better backspace behavior
 set backspace=indent,eol,start
 
 " Auto-save when leaving insert mode or text changes
 set autowriteall
 autocmd InsertLeave,TextChanged * silent! wall
 
 " Writer-friendly shortcuts
 nnoremap <leader>w :w<CR>
 nnoremap <leader>q :q<CR>
 nnoremap <leader>x :x<CR>
 
 " Toggle spell check
 nnoremap <leader>s :setlocal spell!<CR>
 
 " Word count
 nnoremap <leader>c g<C-g>
 
 " Center screen after common movements
 nnoremap n nzz
 nnoremap N Nzz
 nnoremap * *zz
 nnoremap # #zz
 nnoremap <C-d> <C-d>zz
 nnoremap <C-u> <C-u>zz
 
 " Quick paragraph reformatting
 nnoremap <leader>p gqip
 
 " Move lines up and down
 nnoremap <leader>j :m .+1<CR>==
 nnoremap <leader>k :m .-2<CR>==
 vnoremap <leader>j :m '>+1<CR>gv=gv
 vnoremap <leader>k :m '<-2<CR>gv=gv
 
 " Quick date insertion
 nnoremap <leader>t "=strftime("%Y-%m-%d")<CR>p
 inoremap <C-d> <C-r>=strftime("%Y-%m-%d")<CR>
 
 " Thesaurus (if you add a thesaurus file)
 set thesaurus+=~/Documents/.vim/thesaurus/english.txt

 " Performance improvements
 set lazyredraw          " Don't redraw screen during macros
 set ttyfast             " Indicates a fast terminal connection
 set ttimeoutlen=10      " Reduce key code delay (affects escape key)
 set timeoutlen=500      " Reduce leader key timeout (was 1000 by default)
 set updatetime=300      " Faster completion and swap file writing
 
 " Disable cursorline when in insert mode (can slow things down)
 autocmd InsertEnter * set nocursorline
 autocmd InsertLeave * set cursorline

" Convert paragraph to one sentence per line
 function! OneSentencePerLine()
   " Save position
   let save_pos = getpos('.')
   
   " Find paragraph boundaries
   normal! {
   let start = line('.') + 1
   normal! }
   let end = line('.') - 1
   
   " Replace sentence endings with newlines
   if start <= end
     silent! execute start . ',' . end . 's/\([.!?]\) \+/\1\r/ge'
   endif
   
   " Restore position
   call setpos('.', save_pos)
   nohlsearch
 endfunction
 
 " Keybindings
 nnoremap <leader>1 :call OneSentencePerLine()<CR>
 nnoremap <leader>0 gqip


 " ============================================================================
 " GOYO AND LIMELIGHT CONFIGURATION (distraction-free writing)
 " ============================================================================
 " Toggle distraction-free writing mode
 nnoremap <leader>g :Goyo<CR>
 
 " Goyo settings
 let g:goyo_width=81
 let g:goyo_height='100%'
 let g:goyo_linenr=0
 
 " Auto-start Limelight with Goyo
 function! s:goyo_enter()
   set scrolloff=999       " Keep cursor centered
   set linebreak           " Break at word boundaries
   set textwidth=80        " Auto-format to 80 chars
   if exists(':Limelight')
     Limelight
   endif
 endfunction
 
 function! s:goyo_leave()
   set scrolloff=5
   set textwidth=0
   if exists(':Limelight')
     Limelight!
   endif
 endfunction
 
 autocmd! User GoyoEnter nested call <SID>goyo_enter()
 autocmd! User GoyoLeave nested call <SID>goyo_leave()
 
 " Limelight settings
 let g:limelight_conceal_ctermfg = 'gray'
 let g:limelight_default_coefficient = 0.7
 
 " ============================================================================
 " VIM-PENCIL CONFIGURATION (better prose handling)
 " ============================================================================
 " Auto-activate pencil for text files
 augroup pencil
   autocmd!
   autocmd FileType markdown,mkd call pencil#init()
   autocmd FileType text         call pencil#init()
 augroup END
 
 " Use soft wrap mode (don't insert hard line breaks)
 let g:pencil#wrapModeDefault = 'soft'
 
 " ============================================================================
 " VIM-WORDY CONFIGURATION (writing quality checks)
 " ============================================================================
 " Toggle wordy checks
 nnoremap <leader>ww :NextWordy<CR>
 nnoremap <leader>wd :NoWordy<CR>
 
 " ============================================================================
 " DITTO CONFIGURATION (repetition detection)
 " ============================================================================
 " Toggle ditto
 nnoremap <leader>di <Plug>ToggleDitto
 
 " Don't auto-enable ditto
 au FileType markdown,text,tex DittoOff
 
 " ============================================================================
 " MARKDOWN-SPECIFIC SETTINGS
 " ============================================================================
 autocmd FileType markdown setlocal conceallevel=0
 autocmd FileType markdown setlocal spell
 
 " ============================================================================
 " COLORSCHEME
 " ============================================================================
 " Load a light, writer-friendly colorscheme if available
" Enable true color support
 set termguicolors
 let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
 let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
 set t_Co=256

" Colorscheme configuration
 let g:light_colorscheme = 'pencil'
 let g:dark_colorscheme = 'pencil'
 
 " Load colorscheme packages
 packadd vim-colors-pencil
 packadd papercolor-theme
 packadd vim-solarized8
 packadd gruvbox-material
 
 " Function to toggle between light and dark
 function! ToggleColorScheme()
   if &background == 'light'
     set background=dark
     execute 'colorscheme ' . g:dark_colorscheme
     echo 'Dark mode: ' . g:dark_colorscheme
   else
     set background=light
     execute 'colorscheme ' . g:light_colorscheme
     echo 'Light mode: ' . g:light_colorscheme
   endif
 endfunction
 
 " Set initial colorscheme
 set background=dark
 execute 'colorscheme ' . g:light_colorscheme
 
 " Toggle with space+t
 nnoremap <leader>t :call ToggleColorScheme()<CR>
 
 " Quick switch to specific colorschemes (space+c then a number)
 nnoremap <leader>c1 :let g:light_colorscheme='pencil' \| let g:dark_colorscheme='pencil' \| call ToggleColorScheme() \| call ToggleColorScheme()<CR>
 nnoremap <leader>c2 :let g:light_colorscheme='PaperColor' \| let g:dark_colorscheme='PaperColor' \| call ToggleColorScheme() \| call ToggleColorScheme()<CR>
 nnoremap <leader>c3 :let g:light_colorscheme='solarized8' \| let g:dark_colorscheme='solarized8' \| call ToggleColorScheme() \| call ToggleColorScheme()<CR>
 nnoremap <leader>c4 :let g:light_colorscheme='gruvbox-material' \| let g:dark_colorscheme='gruvbox-material' \| call ToggleColorScheme() \| call ToggleColorScheme()<CR>

" NERDTree file explorer
 nnoremap <leader>n :NERDTreeToggle<CR>
 nnoremap <leader>f :NERDTreeFind<CR>
 
 " NERDTree settings
 let NERDTreeShowHidden=1
 let NERDTreeMinimalUI=1
 let NERDTreeDirArrows=1
 let NERDTreeIgnore=['\.swp$', '\.DS_Store$']
 
 " Airline status line
 let g:airline_powerline_fonts = 0
 let g:airline_theme='pencil'
 let g:airline#extensions#whitespace#enabled = 0
 let g:airline_section_z = '%p%% %l:%c'
 
 " Simpler airline separators (works better without powerline fonts)
 let g:airline_left_sep = ''
 let g:airline_right_sep = ''
