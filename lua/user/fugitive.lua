local keymap = vim.keymap.set
local noremap = { noremap = true}
keymap("n", "<leader>gb", ":Git blame<Enter>", noremap)
