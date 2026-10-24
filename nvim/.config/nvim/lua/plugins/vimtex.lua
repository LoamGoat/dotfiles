return {
  {
    "lervag/vimtex",
    lazy = false,  -- VimTeX handles its own lazy loading
    init = function()
      vim.g.vimtex_view_method = "zathura"
      vim.g.vimtex_compiler_method = "latexmk"
      vim.g.vimtex_quickfix_mode = 0  -- don't pop open the quickfix window on warnings
    end,
  },
}
