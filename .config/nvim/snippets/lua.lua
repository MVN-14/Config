local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt
local s = ls.s
local f = ls.function_node
local i = ls.insert_node

return {
  s("req", fmt([[local {} = require "{}"]], {
    f(function(import_name)
      local parts = vim.split(import_name[1][1], ".", true)
      return parts[#parts] or ""
    end, { 1 }), i(1)
  }))
}
