return {
  {
    "nvim-treesitter/nvim-treesitter",
    init = function()
      vim.filetype.add({ extension = { templ = "templ" } })
    end,
  },
}
