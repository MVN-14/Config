local packerGroup = vim.api.nvim_create_augroup("AGPacker", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "packer.lua",
  callback = function()
    local response = vim.fn.input("Source and Sync? (y/N): ")
    if (response == "Y" or response == "y") then
      vim.cmd(":source")
      vim.cmd(":PackerSync")
    end
  end,
  group = packerGroup
})

-- open NetRW if no args given to nvim
--[[local netrwGroup = vim.api.nvim_create_augroup("AGNetRW", { clear = true })
vim.api.nvim_create_autocmd("VimEnter", {
  pattern = "*",
  group = netrwGroup,
  callback = function()
    if vim.fn["argc"]() == 0 then
      vim.cmd.Ex()
    end
  end
})]]

local troubleGroup = vim.api.nvim_create_augroup("TroubleGroup", { clear = true })
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "Trouble",
  group = troubleGroup,
  callback = function()
    vim.keymap.set("n", "W", ":set wrap<CR>", { desc = "Trouble: set [W]rap", buffer = 0 })
    vim.keymap.set("n", "w", ":set nowrap<CR>", { desc = "Trouble: set no[w]rap", buffer = 0 })
  end
})

local cFileTypeGroup = vim.api.nvim_create_augroup("CFileTypeGroup", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  pattern = "c",
  group = cFileTypeGroup,
  callback = function()
    vim.api.nvim_buf_set_option(0, "tabstop", 4)
    --    vim.api.nvim_buf_set_option(0, "shifttabstop", 4)
    vim.api.nvim_buf_set_option(0, "shiftwidth", 4)
  end
})
