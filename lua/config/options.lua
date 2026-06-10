vim.o.laststatus = 3
vim.o.number = true
vim.o.clipboard = "unnamedplus"
vim.o.relativenumber = true
vim.o.wrap = false
vim.o.swapfile = false
vim.o.cmdheight = 0
vim.g.mapleader = " "

vim.opt.expandtab   = true   -- Use spaces instead of tabs
vim.opt.tabstop     = 4      -- Width of a TAB character
vim.opt.shiftwidth  = 4      -- Width for autoindent
vim.opt.smarttab    = true
vim.opt.autoindent  = true
vim.opt.smartindent = true

vim.diagnostic.config({
  virtual_text = {
    spacing = 2,      -- How far the text is from your code
    -- prefix = '■',     -- The icon before the error message
    prefix = '->',     -- The icon before the error message
  },
  underline = true,    -- Adds the red squiggly line under the error
})
