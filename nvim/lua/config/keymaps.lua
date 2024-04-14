-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.api.nvim_set_keymap("n", "<M-j>", "<Nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<M-k>", "<Nop>", { noremap = true, silent = true })

-- tmux navigation

vim.keymap.set("n", "<C-h>", ":TmuxNavigateLeft<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<C-l>", ":TmuxNavigateRight<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<C-j>", ":TmuxNavigateDown<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<C-k>", ":TmuxNavigateUp<cr>", { silent = true, noremap = true })

-- show diagnostics in popup
vim.keymap.set("n", "<C-e>", ":lua vim.diagnostic.open_float()<cr>", { silent = true, noremap = true })

-- Obsidian
vim.keymap.set("n", "<leader>obt", ":ObsidianToday<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>oby", ":ObsidianYesterday<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>obm", ":ObsidianTomorrow<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>obd", ":ObsidianDailies<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>obs", ":ObsidianSearch<cr>", { silent = true, noremap = true })

-- copilot
vim.keymap.set("n", "<leader>cpd", ":Copilot disable<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>cpe", ":Copilot enable<cr>", { silent = true, noremap = true })
