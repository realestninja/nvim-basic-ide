vim.o.background = 'dark'

require("solarized").setup({
  transparent = { enabled = false },
  palette = "solarized",
  styles = {
    keywords = { bold = false },
  },
  highlights = {
    KeyWord = { fg = '#859900' },
    Delimiter = { fg = '#dc322f' },
    Number = { fg = '#2aa198' }
  },
})

vim.cmd.colorscheme('solarized')
