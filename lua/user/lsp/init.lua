local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "user.lsp.mason"
require("user.lsp.handlers").setup()
require "user.lsp.null-ls"

local nvim_lsp = require('lspconfig')

local filetypes = {
  javascript = {'stylelint'},
  javascriptreact = {'stylelint'},
}
local linters = {
  stylelint = {
    sourceName = 'stylelint',
    command = 'stylelint',
    args = {'--formatter', 'compact', '%filepath'},
    rootPatterns = {'.stylelintrc'},
    debounce = 100,
    formatPattern = {
      [[: line (\d+), col (\d+), (warning|error) - (.+?) \((.+)\)]],
      {
        line = 1,
        column = 2,
        security = 3,
        message = {4, ' [', 5, ']'},
      },
    },
    securities = {
      warning = 'warning',
      error = 'error',
    },
  },
}

local formatters = {
  stylelint = {
    command = 'stylelint',
    args = {'--fix', '--stdin', '--stdin-filename', '%filepath'},
  }
}
local formatFiletypes = {
  javascript = {'stylelint'},
  javascriptreact = {'stylelint'},
}

nvim_lsp.diagnosticls.setup {
  filetypes = vim.tbl_keys(filetypes),
  init_options = {
    filetypes = filetypes,
    linters = linters,
    formatters = formatters,
    formatFiletypes = formatFiletypes,
  }
}
