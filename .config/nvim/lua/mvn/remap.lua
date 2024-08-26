vim.keymap.set("n", "<Tab>", "<C-6>", { desc = "Alternate File" })


vim.keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "[N]o [H]ighlight" })

-- moving text vertically
vim.keymap.set("n", "<S-Up>", ':m -2<CR>v=', { desc = "Move line up" })
vim.keymap.set("n", "<S-Down>", ':m +1<CR>v=', { desc = "Move line down" })
vim.keymap.set("i", "<S-Up>", '<Esc>:m -2<CR>v=i', { desc = "Move line up" })
vim.keymap.set("i", "<S-Down>", '<Esc>:m +1<CR>v=i', { desc = "Move line down" })
vim.keymap.set("v", "<S-Up>", ":m '<-2<CR>gv=gv", { desc = "Move line up" })
vim.keymap.set("v", "<S-Down>", ":m '>+1<CR>gv=gv", { desc = "Move line down" })

-- moving character horizontally
vim.keymap.set("n", "<S-Right>", "xp")
vim.keymap.set("n", "<S-Left>", function()
  local _, line, col = unpack(vim.fn.getcurpos())
  local line_length = #vim.fn.getline(line)

  if col == 1 then
    return
  elseif col == 2 then
    return "<Left>xp<Left>"
  elseif col == line_length then
    return "x<Left>p"
  else
    return "x<Left><Left>p"
  end
end, { expr = true })

-- navigating windows
--vim.keymap.set("n", "<C-Up>", "<C-w>k", { desc = "Window Navigate: [Up]" })
--vim.keymap.set("n", "<C-Right>", "<C-w>l", { desc = "Window Navigate: [Left]" })
--vim.keymap.set("n", "<C-Down>", "<C-w>j", { desc = "Window Navigate: [Down]" })
--vim.keymap.set("n", "<C-Left>", "<C-w>h", { desc = "Window Navigate: [Right]" })

-- resizing windows
vim.keymap.set("n", "<C-=>", "<C-w>>5", { desc = "Window Resize: Increase Height" })
vim.keymap.set("n", "<C-->", "<C-w><5", { desc = "Window Resize: Decrease Height" })

vim.keymap.set("n", "<C-.>", "<C-w>>5", { desc = "Window Resize: Increase Height" })
vim.keymap.set("n", "<C-,>", "<C-w><5", { desc = "Window Resize: Decrease Height" })

-- disable arrow keys in normal mode cuz nvim btw
vim.keymap.set("n", "<Left>", "<Nop>")
vim.keymap.set("n", "<Right>", "<Nop>")
vim.keymap.set("n", "<Up>", "<Nop>")
vim.keymap.set("n", "<Down>", "<Nop>")

-- select all text
vim.keymap.set("n", "<leader>va", "G0vgg$", { desc = "[v]isually select [a]ll text" })
