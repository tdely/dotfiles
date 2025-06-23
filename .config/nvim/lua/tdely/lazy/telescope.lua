return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-fzf-native.nvim"
  },
  config = function()
    require('telescope').setup({})
    require('telescope').load_extension('fzf')
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
    vim.keymap.set('n', '<leader>ph', function()
      builtin.find_files({ hidden = true })
    end)
    vim.keymap.set('n', '<C-p>', builtin.git_files, {})
    vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})
  end
}
