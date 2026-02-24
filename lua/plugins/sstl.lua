return {
  dir = vim.fn.stdpath("config") .. "/lua/custom/sstl",
  name = "sstl",
  lazy = false,
  config = function ()
    require("sstl").setup()
  end
}
