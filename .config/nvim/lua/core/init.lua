require("core.option")
require("core.remap")
require("core.autocmd")
require("core.lazy")

vim.opt.background = "dark"
vim.cmd("colorscheme carbonfox")

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
