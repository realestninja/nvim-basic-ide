-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = ","

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
-- keymap("n", "<S-l>", ":bnext<CR>", opts)
-- keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "<Tab>", ":bnext<CR>", opts)
keymap("n", "<S-Tab>", ":bprevious<CR>", opts)

-- Clear highlights
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

-- Close buffers
-- keymap("n", "<S-q>", "<cmd>Bdelete!<CR>", opts)
keymap("n", "<leader><Backspace>", "<cmd>Bdelete!<CR>")

-- Close split but keep buffer
keymap("n", "<Backspace>", "<C-w>q<Enter>")

-- Better paste (blackhole)
keymap("v", "p", '"_dP', opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jj", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Plugins --

-- NvimTree
keymap("n", "<C-n>", ":NvimTreeToggle<CR>")
keymap("n", "<leader>n", ":NvimTreeFindFile<CR>")

-- Telescope
keymap("n", "<Space>p", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>s", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fp", ":Telescope projects<CR>", opts)
keymap("n", "<Space><Space>", ":Telescope buffers<CR>", opts)

-- Git
keymap("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)

-- Comment
keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", opts)
keymap("x", "<leader>/", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", opts)

-- DAP
keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", opts)
keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", opts)
keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", opts)
keymap("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", opts)
keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opts)
keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opts)

-- Lsp
keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", opts)

-- custom
keymap("n", "<Enter>", ":w<Enter>")
keymap("n", "<leader>q", ":bw<Enter>")
keymap("n", "<leader>a", ":qa<Enter>")

keymap("n", "<leader>bs", ":split<Enter>")
keymap("n", "<leader>vs", ":vsplit<Enter>")

keymap("n", "<leader>mks", ":mks!<Enter>")

-- center current line
keymap("n", "<leader>.", "z.")

-- Toggle highlight search
keymap("n", "<leader>hs", ":set hlsearch!<Enter>")

-- Replace all occurences
keymap("v", "<C-r>", '"hy:%s/<C-r>h//g<left><left>')
keymap("v", "<leader><C-r>", '"hy:%s/<C-r>h/<C-r>h/g<left><left>')

-- Set filetype to json and apply correct formatting
keymap("n", "=j", ":set ft=json<CR>:%!python -m json.tool<CR>")

-- Sort like a boss
keymap("v", "<C-s>", ":sort<CR>")

-- Change layout -> vertical/horizontal
keymap("n", "<leader>lb", "<C-w>t<C-w>K<CR>", opts)
keymap("n", "<leader>lv", "<C-w>t<C-w>H<CR>", opts)

-- Append ; at end of line
-- keymap("n", ";", ":execute 'normal! mqA;\<lt>esc>`q'<enter>")
-- ^ needs to be fixed

-- record macro to q
keymap("n", "Q", "qq")

-- swap lines
keymap("n", "-", "ddpkj")
keymap("n", "_", "kddpk")

-- window swap plugin
keymap("n", "<leader><Space>", ":call WindowSwap#EasyWindowSwap()<CR>", opts)
