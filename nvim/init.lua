
-- Leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Add Neovim config directory to Lua's module search path
local config_dir = vim.fn.stdpath("config")
package.path = config_dir .. "/?.lua;"
    .. config_dir .. "/?/init.lua;"
    .. package.path

-- Plugin manager
vim.opt.rtp:prepend(
    vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
)

-- Load configuration
require("samikb.options")
require("samikb.keymaps")
require("samikb.plugins")
require("samikb.theme")
