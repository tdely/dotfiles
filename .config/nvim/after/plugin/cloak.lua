require("cloak").setup({
  enabled = true,
  cloak_character = "*",
  -- The applied highlight group (colors) on the cloaking, see `:h highlight`.
  highlight_group = "Comment",
  -- Set to true to cloak Telescope preview buffers. (Required feature not in 0.1.x)
  cloak_telescope = true,
  patterns = {
    {
      -- Match any file starting with ".env".
      -- This can be a table to match multiple file patterns.
      file_pattern = {
          ".env*",
          "*.cfg",
      },
      -- Match an equals sign and any character after it.
      -- This can also be a table of patterns to cloak,
      -- example: cloak_pattern = { ":.+", "-.+" } for yaml files.
      cloak_pattern = "=.+"
    },
  },
})
vim.keymap.set('n', '<leader>ct', '<cmd>CloakToggle<CR>', {})
vim.keymap.set('n', '<leader>cp', '<cmd>CloakPreviewLine<CR>', {})
