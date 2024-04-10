local ls = require('luasnip')
local fmt = require('luasnip.extras.fmt').fmt
local rep = require('luasnip.extras').rep;

return {
  ls.s("typedef struct", fmt('typedef struct {} {{\n\t{}\n}} {};', {
    ls.insert_node(1),
    ls.insert_node(0),
    rep(1),
  })),
  ls.s("typedef enum", fmt('typedef enum {} {{\n\t{}\n}} {};', {
    ls.insert_node(1),
    ls.insert_node(0),
    rep(1),
  })),
  ls.s("#ifndef HEADER_GUARD", fmt("#ifndef {}\n#define {}\n\n{}\n\n#endif", {
    ls.insert_node(1),
    rep(1),
    ls.insert_node(0)
  }))
}
