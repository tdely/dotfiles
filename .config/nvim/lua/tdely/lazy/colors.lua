function Recolor(color)
  color = color or "zenburn"
  vim.cmd.colorscheme(color)
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
end

return {
  "phha/zenburn.nvim",
  config = function()
    require("zenburn").setup()
    Recolor()
  end
}
