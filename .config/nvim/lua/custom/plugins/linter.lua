return { -- Linter
    'mfussenegger/nvim-lint',
    event = {
      'BufWritePre',
      'BufEnter',
    },
    config = function()
      local lint = require 'lint'

      lint.linters_by_ft = {
        javascript = { 'eslint_d' },
        typescript = { 'eslint_d' },
        python = { 'pylint', 'pycodestyle' },
      }

      local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })

      vim.api.nvim_create_autocmd({ 'BufWritePost', 'InsertLeave', 'TextChanged' }, {
        group = lint_augroup,
        callback = function()
          lint.try_lint()
        end,
      })
    end,
  }
