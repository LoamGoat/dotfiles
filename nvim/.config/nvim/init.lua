
-- Bootstrap lazy.nvim
vim.env.GDK_BACKEND = "x11"
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Set leaders BEFORE loading plugins
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Basic options
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = true
vim.opt.linebreak = true       -- wrap at word boundaries
vim.opt.spell = false
vim.opt.termguicolors = true
vim.opt.clipboard = "unnamedplus"  -- needs wl-clipboard on Wayland

require("lazy").setup("plugins")
