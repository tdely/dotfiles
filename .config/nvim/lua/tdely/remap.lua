vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)
vim.keymap.set('n', '<leader><leader>', vim.cmd.so)

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

vim.keymap.set('n', 'J', 'mzJ`z')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- put from register without overwriting register
vim.keymap.set('x', '<leader>p', '"_dP')

-- yank to clipboard
vim.keymap.set({'n', 'v'}, '<leader>y', '"+y')
vim.keymap.set('n', '<leader>Y', '"+Y')

-- delete without writing to register
vim.keymap.set({'n', 'v'}, '<leader>d', '"_d')

vim.keymap.set('n', '<leader>bn', vim.cmd.bnext)
vim.keymap.set('n', '<leader>bp', vim.cmd.bprevious)
vim.keymap.set('n', '<leader>q', function()
    vim.cmd('bp|sp|bn|bd')
end)

-- toggle paste mode
vim.keymap.set('n', '<Leader>p', function()
  vim.cmd('set paste!')
end)
-- remove trailing whitespace
vim.keymap.set('n', '<Leader>w', function()
  vim.cmd('%s/\\s\\+$//e')
end)

vim.keymap.set('n', 'Q', '<nop>')
vim.keymap.set('n', '<leader>f', function()
  vim.lsp.buf.format()
end)

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tsesh<CR>")
