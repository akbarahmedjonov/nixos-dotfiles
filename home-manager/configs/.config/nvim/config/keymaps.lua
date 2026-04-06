vim.g.mapleader=' '
vim.keymap.set("n", "cd", "<CMD>Oil<CR>", { desc = "Open parent directory" })
vim.keymap.set("n", "rl", "<CMD>so<CR>", { desc = "Reload Nvim" })
vim.keymap.set("n", "<leader>w", "<CMD>write<CR>", { desc = "Write file" })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
if vim.fn.executable('rg') == 1 then
  vim.o.grepprg = "rg --vimgrep --smart-case --"
  vim.o.grepformat = "%f:%l:%c:%m"
end
vim.keymap.set('n', '<leader>/', function()
  local search = vim.fn.input("Grep > ")
  if search ~= "" then
    vim.cmd("grep! " .. search)
    vim.cmd("copen")
  end
end, { desc = 'Grep project with prompt' })
