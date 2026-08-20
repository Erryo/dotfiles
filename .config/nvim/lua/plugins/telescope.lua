return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-live-grep-args.nvim",
    },
    keys = {
      { "<leader>pf", function() require("telescope.builtin").find_files() end, desc = "Find files" },
      { "<leader>pws", function() require("telescope.builtin").grep_string({ search = vim.fn.expand("<cword>") }) end, desc = "Grep word" },
      { "<leader>pWs", function() require("telescope.builtin").grep_string({ search = vim.fn.expand("<cWORD>") }) end, desc = "Grep WORD" },
      { "<leader>ps", function() require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") }) end, desc = "Grep prompt" },
      { "<leader>vh", function() require("telescope.builtin").help_tags() end, desc = "Help tags" },
    },
    opts = {},
    config = function(_, opts)
      local telescope = require("telescope")
      telescope.setup(opts)
      telescope.load_extension("live_grep_args")
    end,
  },
}
