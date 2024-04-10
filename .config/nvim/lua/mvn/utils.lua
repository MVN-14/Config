local utils = {}

function utils.preserve_pos(func)
  local pos = vim.fn.getcursorpos()
  func()
  vim.fn.cursor(pos[2], pos[3])
end

return utils
