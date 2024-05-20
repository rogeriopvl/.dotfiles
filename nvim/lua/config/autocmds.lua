-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- disable inlay hints, they take up space and are distracting
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function()
    vim.lsp.inlay_hint.enable(false)
  end,
})
