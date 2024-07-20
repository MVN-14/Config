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

local troubleGroup = vim.api.nvim_create_augroup("TroubleGroup", { clear = true })
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "Trouble",
    group = troubleGroup,
    callback = function()
        vim.keymap.set("n", "W", ":set wrap<CR>", { desc = "Trouble: set [W]rap", buffer = 0 })
        vim.keymap.set("n", "w", ":set nowrap<CR>", { desc = "Trouble: set no[w]rap", buffer = 0 })
    end
})
vim.api.nvim_buf_set_option(0, "shiftwidth", 4)

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

local harpoonGroup = vim.api.nvim_create_augroup("HarpoonGroup", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
    pattern = "harpoon",
    group = harpoonGroup,
    callback = function()
        vim.keymap.set("n", "<C-c>", function() vim.api.nvim_win_close(0, true) end,
            { desc = "Harpoon: Escape Window", buffer = 0 })
    end
})
