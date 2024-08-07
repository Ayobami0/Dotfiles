vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- vim.keymap.set("n", "<leader>o", vim.cmd.Lex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- TIP: Disable arrow keys
vim.keymap.set({'n', 'v'}, '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set({'n', 'v'}, '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set({'n', 'v', 'i'}, '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set({'n', 'v', 'i'}, '<down>', '<cmd>echo "Use j to move!!"<CR>')

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set('n', '<S-Tab>', '<Cmd>bprevious<CR>', { desc = 'Move focus to the previous buffer' })
vim.keymap.set('n', '<Tab>', '<Cmd>bnext<CR>', { desc = 'Move focus to the next buffer' })
vim.keymap.set('n', '<A-x>', '<Cmd>bd<CR>', { desc = 'Delete active buffer' })
