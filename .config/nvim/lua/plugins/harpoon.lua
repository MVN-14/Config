return {
  "theprimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require "harpoon"

    harpoon:setup()

    local conf = require("telescope.config").values
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
          results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
      }):find()
    end

    vim.keymap.set('n', '<leader>a', function() harpoon:list():add() end, { desc = "Harpoon: [A]dd File" })
    vim.keymap.set('n', '<C-h>', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
      { desc = "Harpoon: Toggle [H]arpoon" })
    --vim.keymap.set('n', '<leader>th', function() toggle_telescope(harpoon:list()) end,
    --{ desc = "Harpoon: [T]elescope [H]arpoon" })

    vim.keymap.set('n', '<leader>1', function() harpoon:list():select(1) end, { desc = "Harpoon: Nav File [1]" })
    vim.keymap.set('n', '<leader>2', function() harpoon:list():select(2) end, { desc = "Harpoon: Nav File [2]" })
    vim.keymap.set('n', '<leader>3', function() harpoon:list():select(3) end, { desc = "Harpoon: Nav File [3]" })
    vim.keymap.set('n', '<leader>4', function() harpoon:list():select(4) end, { desc = "Harpoon: Nav File [4]" })
  end
}
