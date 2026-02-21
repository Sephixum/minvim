vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = false
vim.o.tabstop = 4
vim.o.swapfile = false
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.cmdheight = 0
vim.g.mapleader = " "


vim.diagnostic.config({
  virtual_text = {
    spacing = 2,      -- How far the text is from your code
    -- prefix = '■',     -- The icon before the error message
    prefix = '->',     -- The icon before the error message
  },
  underline = true,    -- Adds the red squiggly line under the error
})
