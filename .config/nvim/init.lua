vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.number = true
vim.opt.relativenumber = true

-- vim.opt.wrap = wrap
vim.opt.mouse = 'a'
vim.opt.showmode = false

-- vim.opt.clipboard = 'unnamedplus'
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldenable = false
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.inccommand = 'split'
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.hlsearch = true
vim.opt.spell = true

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in
-- normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')
-- insert mode
vim.keymap.set('i', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('i', '<down>', '<cmd>echo "Use j to move!!"<CR>')
-- visual mode
vim.keymap.set('v', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('v', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('v', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('v', '<down>', '<cmd>echo "Use j to move!!"<CR>')

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Yank to sysclipboard
vim.keymap.set('n', '<leader>y', '"+y', { desc = 'Yank to system clipboard register' })
vim.keymap.set('x', '<leader>y', '"+y', { desc = 'Yank to system clipboard register' })
-- Paste from sysclipboard
vim.keymap.set('n', '<leader>p', '"+p', { desc = 'Yank to system clipboard register' })
vim.keymap.set('x', '<leader>p', '"+p', { desc = 'Yank to system clipboard register' })

-- This stops the annoyingly slow python startuptime
vim.g.python3_host_prog = '/usr/bin/python'
vim.g.python_host_prog = '/usr/bin/python2'

-- Buffer Configurations
-- Move to previous/next buffer
vim.keymap.set('n', '<S-Tab>', '<Cmd>bprevious<CR>', { desc = 'Move focus to the previous buffer' })
vim.keymap.set('n', '<Tab>', '<Cmd>bnext<CR>', { desc = 'Move focus to the next buffer' })
vim.keymap.set('n', '<A-x>', '<Cmd>bd<CR>', { desc = 'Delete active buffer' })

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require('lazy').setup {
  -- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

  { import = 'custom.plugins' },
  { import = 'custom.colorscheme' },
}

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
