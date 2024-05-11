-- for some reason, the context is not working properly in some markdown files,
-- so this should be a temporary workaround.
vim.api.nvim_command("TSContextDisable")

-- trying this for now, I don't like how the markdown highlighter hiddes the
-- markdown syntax.
vim.api.nvim_command("set conceallevel=0")
