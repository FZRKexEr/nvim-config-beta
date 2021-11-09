
" 使用的插件 
call plug#begin('~/.config/nvim/plugged')

Plug 'Pocco81/AutoSave.nvim'
Plug 'romgrk/barbar.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'folke/which-key.nvim'
Plug 'glepnir/dashboard-nvim'
Plug 'williamboman/nvim-lsp-installer'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  
Plug 'arcticicestudio/nord-vim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'
"Plug 'glepnir/lspsaga.nvim'

call plug#end()

"lua << EOF
"local saga = require 'lspsaga'
"EOF


let g:dashboard_default_executive ='telescope'


lua require("which-key").setup {}


let g:nord_bold = 1

source ~/Documents/Github/vimrc/liznb.vim 

lua require'nvim-tree'.setup()

nnoremap <C-n> :NvimTreeToggle<CR>

lua << EOF
local autosave = require("autosave")
autosave.setup(
    {
        enabled = true,
        execution_message = "AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"),
        events = {"InsertLeave", "TextChanged"},
        conditions = {
            exists = true,
            filename_is_not = {},
            filetype_is_not = {},
            modifiable = true
        },
        write_all_buffers = false,
        on_off_commands = true,
        clean_command_line_interval = 0,
        debounce_delay = 135
    }
)
EOF

lua require('lualine').setup {}



" 有了Installer就不需要再管 lsp了 
lua lsp_installer = require("nvim-lsp-installer")

set timeoutlen=300
let g:dashboard_custom_section={
      \   '1': {
      \     'description': ['  New File       '],
      \     'command': 'DashboardNewFile', 
      \   },
      \   '3': {
      \     'description': ['  Recent File    '],
      \     'command': 'DashboardFindHistory', 
      \   },
      \   '2': {
      \     'description': ['  Find File      '],
      \     'command': 'DashboardFindFile', 
      \   },
      \   '5': {
      \     'description': ['  Open Codeforces'],
      \     'command': '!open https://www.codeforces.com', 
      \   },
      \   '4': {
      \     'description': ['  Configuration  '],
      \     'command': 'tabnew ~/.config/nvim/init.vim | tabprevious | tabclose', 
      \   },
      \}

function! RandInt(Low, High) abort
    let l:milisec = str2nr(matchstr(reltimestr(reltime()), '\v\.\zs\d+'))
    return l:milisec % (a:High - a:Low + 1) + a:Low
endfunction

let randint = RandInt(2, 2)
if randint == 1


let g:dashboard_custom_header = [
\ ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
\ ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
\ ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
\ ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
\ ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
\ ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
\]

elseif randint == 2

autocmd FileType dashboard set showtabline=0 | autocmd WinLeave <buffer> set showtabline=2
let g:dashboard_custom_header=[
     \'  ⠃⠄⠄⠄⠄⠄⠄⠄⠄⠄⢀⢖⣾⣿⣿⣿⣻⣿⣿⣿⣿⣿⣿⣿⣷⣿⣿⣄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄',
     \'  ⠁⠄⠄⠄⠄⠄⠄⠄⢀⣰⣾⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠄⠄⠄⠄⠄⠄⠄⠄⢀⠄⠄',
     \'  ⠄⢤⠄⠄⠄⠄⢀⣤⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄⠄⠄⠄⠄⠄⠄⠄⠄⢳⡤',
     \'  ⠄⠄⡀⠄⠄⢀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇⠄⠄⠄⠄⠄⠄⠄⠄⢸⠇',
     \'  ⡸⢇⠈⠄⡀⢱⣿⣿⣿⣿⣿⣿⣿⣿⣿⠛⣻⡻⣿⣿⢿⣿⣿⣿⣿⣿⣿⣿⣿⠧⠄⠄⠄⠄⠄⠄⠄⠄⠰⠄',
     \'  ⡁⢡⢲⣤⠄⡄⠹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣭⣤⣤⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄',
     \'  ⣇⣹⢯⢣⣏⣿⣦⡜⢿⣿⣿⡛⠛⠿⢿⢿⣿⡿⠋⠙⣿⣿⣿⡿⠛⣿⣿⠿⠿⠃⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄',
     \'  ⡍⠂⠄⠈⠛⠿⣿⣷⡈⠛⠛⣋⣀⣀⣈⠄⠄⠄⣀⣒⡻⠿⠏⠄⠈⠁⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄',
     \'  ⣿⣾⡄⠄⠄⠄⣿⣿⣿⣆⢰⣿⣿⣿⣿⣿⣿⣿⣿⡿⠛⢉⠄⠄⠄⠐⢱⡿⠃⠄⠄⠄⡌⠁⠄⠄⠄⠄⠄⠄',
     \'  ⣿⣿⣿⡇⠄⠄⠸⣿⣿⣿⡜⣿⣿⣿⣿⣿⣿⣿⣿⣣⢔⣥⣿⡄⢀⠠⢌⠴⠐⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄',
     \'  ⣿⣿⣿⠻⠶⠤⢀⣿⣿⣿⣿⣶⣭⣭⣿⣿⣿⣥⣿⣶⣿⣿⣿⡄⠄⣠⣰⡀⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄',
     \'  ⣿⣿⣧⣷⣶⣶⣿⣿⡿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠛⠁⣠⣾⣿⣿⣿⣶⣦⣤⣀⣀⠄⠄⠄⠄⠄⠄',
     \'  ⣿⣿⣿⣿⣿⣿⣿⣿⠇⠄⠙⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⢀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⡄⠄⠄⠄',
     \'  ⣿⣿⣿⣿⣿⣿⣿⣿⣀⣀⠄⠄⠉⠛⢿⣿⣿⣿⣿⣿⣿⣤⣼⣿⣿⣿⣿⣿⣿⣿⣞⣿⣿⣿⣿⣿⣿⣆⠄⠄',
     \'  ⣿⣿⣿⣿⣿⣿⣿⣿⣉⣢⡀⠄⠄⠄⠈⠉⠹⣿⣿⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡯⣽⠿⠏⣹⣿⣿⣿⣷⡀',
     \'  ⣿⣿⣿⣿⣿⣿⣿⣿⣷⣦⣤⣾⣿⣷⣄⣀⣤⣴⣾⠛⣷⠿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡏⢀⣸⣽⣿⡿⢃⣿⣷',
     \'  ⣿⣿⣿⣿⣿⣿⣿⡏⢿⣿⣿⣿⣿⣿⣿⣿⠿⣿⣿⣯⣷⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⠄⢸⣿⣿⣿⢇⣼⣿⣿',
     \'  ⣿⣿⣿⣿⣿⣿⣟⣗⠄⠙⣿⣿⣿⣿⣿⣿⡄⣿⣿⡟⠟⣿⣿⣯⣿⣿⣿⣿⣿⣿⠇⠄⣿⣿⣿⡏⣐⣾⠏⣿',
     \'  ⣿⣿⣿⣿⣿⣿⣷⡈⠄⠄⠈⣿⣿⣿⣿⣿⡇⣿⡇⠄⣱⣿⣿⣿⣿⣿⣿⣿⣿⡿⠄⠄⣿⣿⡿⣰⣿⣷⢵⣹',
     \]                                          
endif                                            
                                                 


nnoremap <silent>    <S-h> :BufferPrevious<CR>
nnoremap <silent>    <S-l> :BufferNext<CR>
nnoremap <silent>    <leader>q :BufferClose<CR>



" NOTE: If barbar's option dict isn't created yet, create it
let bufferline = get(g:, 'bufferline', {})

" New tabs are opened next to the currently selected tab.
" Enable to insert them in buffer number order.
let bufferline.add_in_buffer_number_order = v:false

" Enable/disable animations
let bufferline.animation = v:true

" Enable/disable auto-hiding the tab bar when there is a single buffer
" 有一个tab的时候关闭buffer
let bufferline.auto_hide = v:false

" Enable/disable current/total tabpages indicator (top right corner)
let bufferline.tabpages = v:true

" Enable/disable close button
let bufferline.closable = v:true

" Enables/disable clickable tabs
"  - left-click: go to buffer
"  - middle-click: delete buffer
let bufferline.clickable = v:true

" Excludes buffers from the tabline
let bufferline.exclude_ft = ['javascript']
let bufferline.exclude_name = ['package.json']

" Enable/disable icons
" if set to 'buffer_number', will show buffer number in the tabline
" if set to 'numbers', will show buffer index in the tabline
" if set to 'both', will show buffer index and icons in the tabline
let bufferline.icons = v:true

" Sets the icon's highlight group.
" If false, will use nvim-web-devicons colors
let bufferline.icon_custom_colors = v:false

" Configure icons on the bufferline.
let bufferline.icon_separator_active = '▎'
let bufferline.icon_separator_inactive = '▎'
let bufferline.icon_close_tab = ''
let bufferline.icon_close_tab_modified = '●'
let bufferline.icon_pinned = '車'

" If true, new buffers will be inserted at the start/end of the list.
" Default is to insert after current buffer.
let bufferline.insert_at_start = v:false
let bufferline.insert_at_end = v:false

" Sets the maximum padding width with which to surround each tab.
let bufferline.maximum_padding = 4

" Sets the maximum buffer name length.
let bufferline.maximum_length = 30

" If set, the letters for each buffer in buffer-pick mode will be
" assigned based on their name. Otherwise or in case all letters are
" already assigned, the behavior is to assign letters in order of
" usability (see order below)
let bufferline.semantic_letters = v:true

" New buffer letters are assigned in this order. This order is
" optimal for the qwerty keyboard layout but might need adjustement
" for other layouts.
let bufferline.letters =
  \ 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP'

" Sets the name of unnamed buffers. By default format is "[Buffer X]"
" where X is the buffer number. But only a static string is accepted here.
let bufferline.no_name_title = v:null

