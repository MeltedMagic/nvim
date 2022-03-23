"Show Line Numbers
set number
"Use mouse
set mouse=a
"Set Python 3 Version
let g:python3_host_prog='/usr/local/opt/python@3.10/bin/python3'


call plug#begin()
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
"""Neovim-Visual---------/
Plug 'vim-airline/vim-airline' "status bar customiser
"""----------------------/

"""Themes----------------|
Plug 'kartik1998/simba.vim'
Plug 'frenzyexists/aquarium-vim',{ 'branch': 'develop' }
Plug 'savq/melange'
Plug 'adigitoleo/vim-mellow', { 'tag': '*' }
Plug 'kirbycool/one-colors.vim'
Plug 'romgrk/github-light.vim'
Plug 'equt/paper.vim'
Plug 'ArthurPV/vim-moon-color'
Plug 'axel22/mechanica'
Plug 'XadillaX/vim-automata-theme'
Plug 'argz/vim-corvine'
Plug 'kjssad/quantum.vim'
Plug 'haystackandroid/strawberry'
Plug 'haystackandroid/stellarized'
Plug 'cideM/yui'
Plug 'logico/typewriter-vim'
Plug 'foxbunny/vim-amber'
Plug 'sabrinagannon/vim-garbage-oracle'
Plug 'scolsen/wurm'
Plug 'sainnhe/everforest'
Plug 'vim-airline/vim-airline-themes' "status bar themes
Plug 'arzg/vim-colors-xcode'

"""----------------------|

"""Multi-Use------------/
"""""Useful for multiple systems(python, LaTeX, etc.)
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } "autocomplete
Plug 'SirVer/ultisnips' "custom autocomplete
Plug 'jiangmiao/auto-pairs' "insert another quote or bracket after typing quote or bracket
Plug 'scrooloose/nerdcommenter' "macro for inserting comment for all languages
Plug 'sbdchd/neoformat' "format source code
Plug 'neomake/neomake' "code syntax check, build automation
Plug 'machakann/vim-highlightedyank' "highlight when copying text
Plug 'tmhedberg/SimpylFold' "code folding, contract code

"""---------------------/

"""LaTex----------------/
Plug 'lervag/vimtex'

"""--------------------/

"""Python--------------/
Plug 'zchee/deoplete-jedi' "Autocomplete, Static Analysis, & Refactoring Library

"""--------------------/

"""R-------------------/
Plug 'jalvesaq/Nvim-R', {'branch': 'stable'}

"""--------------------/


call plug#end()

"""Themes----------------|
set termguicolors
syntax on
colorscheme melange
set background=light
let g:airline_theme="base16_aquarium_dark"
"colorscheme simba
"colorscheme simba-light
"colorscheme aquarium
let g:aquarium_style="dark"
	"light","dark"
	"vim-airline : base16_aquarium_light
	"vim-airline : base16_aquarium_dark
"colorscheme melange
"colorscheme mellow
"colorscheme onedark
"colorscheme onelight
"colorscheme github-light
"colorscheme paper
"colorscheme mooncolor,mooncolor-light
	"set background=dark,light
"colorscheme mechanica
"colorscheme automata
"colorscheme corvine
"colorscheme corvine_light
"colorscheme quantum
	"set background=dark
	"set background=light
"colorscheme strawberry-light
"colorscheme strawberry-dark
"colorscheme stellarized
	"set background=dark
	"set background=light
"colorscheme yui
"colorscheme typewriter,typewriter-night
"colorscheme amber
	"set background=dark,light
"colorscheme garbage-oracle
	"set background=dark,light
	let g:garbage_terminal_italics=1
"colorscheme wurm
"colorscheme everforest
"colorscheme xcodedark
"colorscheme xcodedarkhc
"colorscheme xcodelight
"colorscheme xcodelighthc
"colorscheme xcodewwdc

"""----------------------|

"Vertical Ruler
set colorcolumn=120
highlight ColorColumn guibg=blue

"""Vim Macros------------/
"Save
nnoremap <C-s> <Esc>:w<ENTER>
inoremap <C-s> <Esc>:w<ENTER>

"Save & Quit
nnoremap <C-q> <Esc>:wq<ENTER>
inoremap <C-q> <Esc>:wq<ENTER>

"File_Viewer Toggle
nnoremap <C-a> <Esc>:NERDTreeToggle<ENTER>
inoremap <C-a> <Esc>:NERDTreeToggle<ENTER>

"""---------------------/

"""Indent Tab Right----/
"Set tab space to 4
set ts=4 sw=4

"""-------------------/

"""Vimtex-------------/
"""""Use with Deoplete
call deoplete#custom#var('omni', 'input_patterns', {
      \ 'tex': g:vimtex#re#deoplete
      \})

"""""Use with Skim
let g:vimtex_view_method = "skim"
let g:vimtex_view_general_viewer = '/Applications/Skim.app/Contents/SharedSupport/displayline'
let g:vimtex_view_general_options = '-r @line @pdf @tex'


augroup vimtex_mac
    autocmd!
    autocmd User VimtexEventCompileSuccess call UpdateSkim()
augroup END

function! UpdateSkim() abort
    let l:out = b:vimtex.out()
    let l:src_file_path = expand('%:p')
    let l:cmd = [g:vimtex_view_general_viewer, '-r']

    if !empty(system('pgrep Skim'))
    call extend(l:cmd, ['-g'])
    endif

    call jobstart(l:cmd + [line('.'), l:out, l:src_file_path])
endfunction

"""Supress Warnings
let g:vimtex_quickfix_open_on_warning = 0

"""""TOC
let g:vimtex_toc_config = {
      \ 'name' : 'TOC',
      \ 'layers' : ['content', 'todo', 'include'],
      \ 'resize' : 1,
      \ 'split_width' : 50,
      \ 'todo_sorted' : 0,
      \ 'show_help' : 1,
      \ 'show_numbers' : 1,
      \ 'mode' : 2,
      \}

"""""Compilation Settings
   let g:vimtex_compiler_latexmk = {
        \ 'build_dir' : '',
        \ 'callback' : 1,
        \ 'continuous' : 1,
        \ 'executable' : 'latexmk',
        \ 'hooks' : [],
        \ 'options' : [
        \   '-file-line-error',
        \   '-synctex=1',
        \   '-interaction=nonstopmode',
   		\   '-shell-escape',
        \ ],
        \}

"""-----------------/

"""Deoplete----------/
"""""Autocomplete Plugin
let g:deoplete#enable_at_startup = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
set splitbelow
"""-----------------/

"""Ultisnips--------/
let g:UltiSnipsExpandTrigger='<tab>' "activate ultisnips
let g:UltiSnipsJumpForwardTrigger='<c-j>' "next position
let g:UltiSnipsJumpBackwardTrigger='<c-k>' "last position

let g:UltiSnipsSnippetDirectories=["UltiSnips", "mysnips"]

"""-----------------/

"""Neoformat-------/
"""""Autoformatter
"""When Neoformat cannot detect filetype
" Enable alignment
let g:neoformat_basic_format_align = 1

" Enable tab to space conversion
let g:neoformat_basic_format_retab = 1

" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1

"""---------------/

"""Neomake---------/
let g:neomake_python_enabled_makers = ['pylint']
call neomake#configure#automake('nrwi', 500) "automatic code check

"""---------------/

"""Vim-Highlight_Yank
hi HighlightedyankRegion cterm=reverse gui=reverse
"""""see highlight colors on some colorschemes

"""---------------/

"""NvimR----------/
\ 'omni_patterns':  {
    \ 'r': ['[^. *\t]\.\w*', '\h\w*::\w*', '\h\w*\$\w*'],
\},
call deoplete#custom#source('omni_patterns', {
    \ 'r': '[^. *\t]\.\w*',
\})

"""--------------/




"""Notes-----------/
"* <leader> refers to backslash: '\' character. Can be changed in config 

"""----------------/


"""References :
"*(Python Config)[https://jdhao.github.io/2018/12/24/centos_nvim_install_use_guide_en/]
"*(LaTeX Config)[https://jdhao.github.io/2019/03/26/nvim_latex_write_preview/]
"*(leader key)[https://stackoverflow.com/questions/1764263/what-is-the-leader-in-a-vimrc-file]
