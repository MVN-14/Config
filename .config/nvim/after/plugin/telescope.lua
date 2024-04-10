local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>sf', builtin.git_files, { desc = 'Telescope - [S]earch tracked [F]iles' })
vim.keymap.set('n', '<leader>sa', builtin.find_files, { desc = 'Telescope - [S]earch [A]ll files' })
vim.keymap.set('n', '<leader>ds', builtin.treesitter, { desc = 'Telescope - Search [D]ocument [S]ymbols' })
vim.keymap.set('n', '<leader>th', builtin.help_tags, { desc = 'Telescope - [T]elescope [H]elp_tags' })
vim.keymap.set('n', '<leader>tk', builtin.keymaps, { desc = 'Telescope - [T]elescope [K]eymaps' })
