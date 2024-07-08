return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local builtin = require('telescope.builtin')

        local map = function (key, func, opt)
            vim.keymap.set('n', key, func, opt)
        end

        map('<leader>ff', builtin.find_files, { desc = '[F]ind [F]iles' })
        map('<leader>fw', builtin.grep_string, { desc = '[F]ind current [W]ord' })
        map('<leader>fd', builtin.diagnostics, { desc = '[F]ind [D]iagnostics' })
        map('<leader>fg', builtin.live_grep, { desc = '[F]ind by [G]rep' })
        map('<leader>fr', builtin.resume, { desc = '[F]ind [R]esume' })
        map('<leader><leader>', builtin.buffers, { desc = 'Find existing buffers' })
        map('<leader>fh', builtin.help_tags, { desc = '[F]earch [H]elp' })
        map('<leader>f.', builtin.oldfiles, { desc = '[F]earch Recent Files ("." for repeat)' })
    end,
}
