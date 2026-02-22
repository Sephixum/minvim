return {
  dir = vim.fn.stdpath("config") .. "/lua/custom/sstl",
  name = "sstl",
  lazy = false,
  config = function ()
    require("sstl").setup()
  end
}

-- return {
--   "sstl",
--   virtual = true,   -- Tell Lazy this isn't a real git repo
--   config = function()
--     -- Neovim will find this because it's already in the lua/ path
--     require("custom.sstl.lua.sstl").setup()
--   end,
-- }
