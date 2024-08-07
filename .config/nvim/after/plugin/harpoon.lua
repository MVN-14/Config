local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set('n', '<leader>a', mark.add_file, { desc = "Harpoon: [A]dd File" })
vim.keymap.set('n', '<C-h>', ui.toggle_quick_menu, { desc = "Harpoon: Toggle Quick Menu" })

vim.keymap.set('n', '<leader>1', function() ui.nav_file(1) end, { desc = "Harpoon: Nav File [1]" })
vim.keymap.set('n', '<leader>2', function() ui.nav_file(2) end, { desc = "Harpoon: Nav File [1]" })
vim.keymap.set('n', '<leader>3', function() ui.nav_file(3) end, { desc = "Harpoon: Nav File [1]" })
vim.keymap.set('n', '<leader>4', function() ui.nav_file(4) end, { desc = "Harpoon: Nav File [1]" })
