lua require("init")

" Copilot suggestion color
highlight CopilotSuggestion guifg=#910367 ctermfg=8

" window sep styling
hi WinSeparator guibg=NONE guifg=#141414 NONE

" Show whitespace
set list listchars=tab:>\ ,trail:-,eol:↲

" VIMTEX settings
filetype plugin indent on
syntax enable
let g:vimtex_view_general_viewer = "okular"
