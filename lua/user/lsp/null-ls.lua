local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

-- local eslint = require("eslint")

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/code_actions
local code_actions = null_ls.builtins.code_actions

-- https://github.com/prettier-solidity/prettier-plugin-solidity
null_ls.setup {
  debug = false,
  sources = {
    formatting.prettier.with {
      extra_filetypes = { "toml" },
      extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
    },
    formatting.black.with { extra_args = { "--fast" } },
    formatting.stylua,
    formatting.google_java_format,
    formatting.eslint_d.with { filetypes = { "javascript" } },
    formatting.stylelint,
    diagnostics.flake8,
    diagnostics.eslint.with { filetypes = { "javascript" } },
    code_actions.eslint_d.with { filetypes = { "javascript" } },
  },
}

-- eslint.setup({
  -- bin = 'eslint', -- or `eslint_d`
  -- code_actions = {
    -- enable = true,
    -- apply_on_save = {
      -- enable = true,
      -- types = { "directive", "problem", "suggestion", "layout" },
    -- },
    -- disable_rule_comment = {
      -- enable = true,
      -- location = "separate_line", -- or `same_line`
    -- },
  -- },
  -- diagnostics = {
    -- enable = true,
    -- report_unused_disable_directives = false,
    -- run_on = "type", -- or `save`
  -- },
-- })
