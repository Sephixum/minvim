---@param d string
local function get_opts(d)
  return { noremap = true, silent = true, desc = d }
end

vim.keymap.set('n', '<A-u>', '<Cmd>BufferPrevious<CR>', get_opts("Previous Buffer"))
vim.keymap.set('n', '<A-i>', '<Cmd>BufferNext<CR>', get_opts("Next Buffer"))
vim.keymap.set('n', '<A-q>', '<Cmd>BufferClose<CR>', get_opts("Close Buffer"))

vim.keymap.set('n', '<leader>e', '<Cmd>Oil<CR>', get_opts("File explorer"))
vim.keymap.set("n", "<leader>o", "<cmd>Outline<CR>", get_opts("Outline"))

vim.keymap.set("n", "<leader>x", "<cmd>Trouble diagnostics toggle<CR>", get_opts("Diagnostics"))

vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, get_opts("Code action"))
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, get_opts("Lsp format"))

vim.keymap.set("n", "<A-=>", ":vertical resize +2<CR>", get_opts("Window size +"))
vim.keymap.set("n", "<A-->", ":vertical resize -2<CR>", get_opts("Window size -"))
