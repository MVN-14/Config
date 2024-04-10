local ls = require("luasnip")
local s = ls.s
local f = ls.function_node
local i = ls.insert_node

--[[local same = function(index)
  return f(function(arg)
    return arg[1]
  end, { index })
end]]

local fmt = require("luasnip.extras.fmt").fmt

return {
  ls.s("date", f(function()
    return os.date("%D")
  end)),
  ls.s("#!", {
    ls.t("#!/usr/bin/bash")
  }),
  --  ls.s("sametest", fmt([[example: {}, function: {}]], {
  --    i(1),
  --    same(1)
  --  }))
}
