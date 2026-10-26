
-- ~/.config/nvim/samikb/keymaps.lua

local map = vim.keymap.set

-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- General
map("n", "<leader>w", "<cmd>write<CR>", { desc = "Save file" })
map("n", "<leader>q", "<cmd>quit<CR>", { desc = "Quit window" })
map("n", "<leader>Q", "<cmd>qa<CR>", { desc = "Quit all" })
map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })

-- Navigation
map("n", "j", "gj", { desc = "Move down visual line" })
map("n", "k", "gk", { desc = "Move up visual line" })
map("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center" })
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center" })
map("n", "n", "nzzzv", { desc = "Next search result" })
map("n", "N", "Nzzzv", { desc = "Previous search result" })

-- Windows
map("n", "<leader>sv", "<cmd>vsplit<CR>", { desc = "Split vertically" })
map("n", "<leader>sh", "<cmd>split<CR>", { desc = "Split horizontally" })
map("n", "<leader>se", "<C-w>=", { desc = "Equalize split sizes" })
map("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close split" })

map("n", "<C-h>", "<C-w>h", { desc = "Focus left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Focus lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Focus upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Focus right window" })

-- Buffers
map("n", "<leader>bn", "<cmd>bnext<CR>", { desc = "Next buffer" })
map("n", "<leader>bp", "<cmd>bprevious<CR>", { desc = "Previous buffer" })
map("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Delete buffer" })

-- Editing
map("i", "jk", "<Esc>", { desc = "Exit insert mode" })
map("n", "<leader>/", "gcc", { desc = "Toggle comment", remap = true })
map("v", "<leader>/", "gc", { desc = "Toggle comment", remap = true })
map("n", "<leader>o", "o<Esc>", { desc = "New line below" })
map("n", "<leader>O", "O<Esc>", { desc = "New line above" })
map("v", "<", "<gv", { desc = "Indent left" })
map("v", ">", ">gv", { desc = "Indent right" })
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })
map("n", "<leader>x", "<cmd>!chmod +x %<CR>", {
    desc = "Make file executable",
})

-- Clipboard
map("v", "<leader>y", '"+y', { desc = "Copy to system clipboard" })
map("n", "<leader>Y", '"+Y', { desc = "Copy line to system clipboard" })
map({ "n", "v" }, "<leader>d", '"+d', {
    desc = "Delete to system clipboard",
})

-- Quick file navigation
map("n", "<leader>e", "<cmd>Explore<CR>", { desc = "Open file explorer" })
map("n", "<leader>ff", "<cmd>find ", { desc = "Find file" })

-- Diagnostics (works when an LSP is configured)
map("n", "<leader>dd", vim.diagnostic.open_float, {
    desc = "Show diagnostic details",
})
map("n", "[d", vim.diagnostic.goto_prev, {
    desc = "Previous diagnostic",
})
map("n", "]d", vim.diagnostic.goto_next, {
    desc = "Next diagnostic",
})
map("n", "<leader>dl", vim.diagnostic.setloclist, {
    desc = "Diagnostics list",
})

vim.keymap.set("n", "<leader>f", function()
    require("conform").format({
        async = true,
        lsp_format = "fallback",
    })
end, { desc = "Format current file" })

vim.keymap.set("n", "<C-b>", "<cmd>NvimTreeToggle<CR>", {
    desc = "Toggle file sidebar",
})

vim.keymap.set("i", "<C-b>", "<cmd>NvimTreeToggle<CR>", {
    desc = "Toggle file sidebar",
})

vim.keymap.set("v", "<C-b>", "<cmd>NvimTreeToggle<CR>", {
    desc = "Toggle file sidebar",
})