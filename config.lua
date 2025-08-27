-- this file is related to the config file from LunarVim
-- this should go to the `config.lua` file from the LunarVim
--
-- actual nvim version: 9.5.0

vim.wo.relativenumber = true
vim.wo.number = true

vim.format_on_save.enabled = true
vim.format_on_save.pattern = { "*.js", "*.ts" }

vim.opt.timeoutlen = 1000
vim.opt.ttimeoutlen = 0

