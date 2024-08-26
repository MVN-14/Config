local ls = require('luasnip')
local fmt = require('luasnip.extras.fmt').fmt

return {
  ls.s("<script>", fmt('<script lang="ts"> \n\t{}\n</script>', {
    ls.insert_node(0),
  })),
}
