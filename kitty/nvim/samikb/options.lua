
-- ==========================================
-- Neovim Options
-- ~/.config/nvim/samikb/options.lua
-- ==========================================

local opt = vim.opt
local g = vim.g

-- General
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"
opt.mouse = "a"
opt.clipboard = "unnamedplus"
opt.undofile = true
opt.swapfile = false
opt.backup = false
opt.writebackup = false
opt.confirm = true

-- Interface
opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"
opt.cursorline = true
opt.colorcolumn = "100"
opt.wrap = false
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.showmode = false
opt.laststatus = 3
opt.ruler = true
opt.cmdheight = 1
opt.showcmd = true
opt.pumheight = 10
opt.termguicolors = true
opt.background = "dark"
opt.splitright = true
opt.splitbelow = true

-- Editing
opt.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.smartindent = true
opt.breakindent = true
opt.autoindent = true
opt.shiftround = true
opt.virtualedit = "block"
opt.formatoptions:remove({ "c", "r", "o" })

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true
opt.wrapscan = true

-- Completion
opt.completeopt = { "menu", "menuone", "noselect" }
opt.wildmenu = true
opt.wildmode = { "longest:full", "full" }

-- Window and buffer behavior
opt.hidden = true
opt.splitkeep = "screen"
opt.equalalways = false
opt.jumpoptions = "view"

-- Performance
opt.updatetime = 250
opt.timeoutlen = 400
opt.redrawtime = 10000
opt.lazyredraw = false

-- Diagnostics and spelling
opt.spelllang = { "en" }
opt.spell = false
opt.list = true
opt.listchars = {
    tab = "» ",
    trail = "·",
    nbsp = "␣",
    extends = "›",
    precedes = "‹",
}

-- Folding: use manual folds by default
opt.foldenable = true
opt.foldlevel = 99
opt.foldlevelstart = 99

-- Disable unused providers if you don't need them
-- g.loaded_perl_provider = 0
-- g.loaded_ruby_provider = 0

-- Filetype-specific indentation
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "java", "javascript", "typescript", "json", "html", "css" },
    callback = function()
        vim.opt_local.tabstop = 4
        vim.opt_local.shiftwidth = 4
        vim.opt_local.softtabstop = 4
    end,
})

-- Use 2 spaces for common web/config formats
vim.api.nvim_create_autocmd("FileType", {
    pattern = {
        "lua", "yaml", "yml", "xml", "toml",
        "sh", "bash", "zsh", "markdown",
    },
    callback = function()
        vim.opt_local.tabstop = 2
        vim.opt_local.shiftwidth = 2
        vim.opt_local.softtabstop = 2
    end,
})
