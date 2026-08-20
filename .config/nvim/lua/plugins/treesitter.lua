return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",

  config = function()
    local ts = require("nvim-treesitter")

    ts.setup({
      install_dir = vim.fn.stdpath("data") .. "/site",
    })

    ts.install({
      "vimdoc",
      "c",
      "go",
      "python",
      "lua",
      "jsdoc",
      "bash",
      "templ",
    })

    -- Enable Treesitter highlighting and indentation
    vim.api.nvim_create_autocmd("FileType", {
      pattern = {
        "c",
        "go",
        "python",
        "lua",
        "javascript",
        "bash",
        "vimdoc",
        "templ",
      },
      callback = function()
        vim.treesitter.start()

        -- Enable Treesitter indentation
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })

    -- Register templ
    vim.treesitter.language.register("templ", "templ")
  end,
}
