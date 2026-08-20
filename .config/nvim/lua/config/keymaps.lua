-- Personal keymaps. LazyVim's defaults are loaded first, then these overrides.
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Fast insert-mode escape.
map("i", "jj", "<Esc>", { desc = "Exit insert mode" })
map("i", "jk", "<Esc>", { desc = "Exit insert mode" })

-- Keep selections/searches centered.
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("n", "J", "mzJ`z", { desc = "Join lines and keep cursor" })
map("n", "<C-d>", "<C-d>zz", { desc = "Half page down" })
map("n", "<C-u>", "<C-u>zz", { desc = "Half page up" })
map("n", "n", "nzzzv", { desc = "Next search result" })
map("n", "N", "Nzzzv", { desc = "Previous search result" })

-- Clipboard and delete helpers.
map("x", "<leader>p", [['_dP]], { desc = "Paste without yanking replaced text" })
map({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to system clipboard" })
map("n", "<leader>Y", [["+Y]], { desc = "Yank line to system clipboard" })
map({ "n", "v" }, "<leader>d", [['_d]], { desc = "Delete without yanking" })

-- Editing helpers.
map("n", "<leader>tw", function()
  vim.cmd([[%s/\s\+$//e]])
end, { desc = "Trim trailing whitespace" })
map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace word under cursor" })
map("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make file executable" })
map("i", "<C-]>", "<Esc>$I", { desc = "Move to line start from insert" })

-- Navigation.
map("n", "<C-k>", "<cmd>cnext<CR>zz", { desc = "Next quickfix item" })
map("n", "<C-j>", "<cmd>cprev<CR>zz", { desc = "Previous quickfix item" })
map("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "Next location item" })
map("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "Previous location item" })
map("n", "<Tab>", "<cmd>bnext<CR>", { desc = "Next buffer" })
map("n", "sh", "<C-w>h", opts)
map("n", "sj", "<C-w>j", opts)
map("n", "sk", "<C-w>k", opts)
map("n", "sl", "<C-w>l", opts)
map("n", "<C-w><Left>", "<C-w><", opts)
map("n", "<C-w><Right>", "<C-w>>", opts)
map("n", "<C-w><Up>", "<C-w>+", opts)
map("n", "<C-w><Down>", "<C-w>-", opts)

-- LSP shortcuts kept close to the rest of the personal keymaps.
map("n", "gr", vim.lsp.buf.references, { desc = "LSP references" })
map("n", "gD", vim.lsp.buf.declaration, { desc = "LSP declaration" })
map("n", "gd", vim.lsp.buf.definition, { desc = "LSP definition" })
