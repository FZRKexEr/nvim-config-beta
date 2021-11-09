require'nvim-treesitter.configs'.setup{
  ensure_installed = "maintained",
  ignore_install = { "hackell" },
  highlight = {
    enable = true,  
    disable = {},  
    additional_vim_regex_highlighting = false,
  },
  incremental_selection = {
    enable = true,
  },
  indent = {
    enable = true,
  },
}
