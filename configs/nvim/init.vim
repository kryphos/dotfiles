lua require("plugins")
lua require("keymap")
lua require("set")

highlight CopilotSuggestion guifg=#910367 ctermfg=8

set list listchars=tab:>\ ,trail:-,eol:↲

" VIMTEX settings
filetype plugin indent on
syntax enable
let g:vimtex_view_general_viewer = "okular"

" EasyAlign settings
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
