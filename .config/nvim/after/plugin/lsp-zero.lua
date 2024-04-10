local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  --  lsp_zero.buffer_autoformat()

  lsp_zero.default_keymaps({ buffer = bufnr })

  vim.keymap.set('n', '<leader>rs', vim.lsp.buf.rename, { desc = "LSP: [R]ename [S]ymbol" })
  vim.keymap.set('n', '<leader>fm', vim.lsp.buf.format, { desc = "LSP: [F]or[M]at" })
  vim.keymap.set('n', '<leader>vca', vim.lsp.buf.code_action, { desc = "LSP: [C]ode [A]ction" })
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = { 'tsserver', 'bashls', 'clangd', 'cmake', 'cssls', 'html', 'jsonls', 'lua_ls', 'svelte', 'eslint', 'templ' },
  handlers = {
    lsp_zero.default_setup,
    ["lua_ls"] = function()
      require("lspconfig").lua_ls.setup {
        settings = {
          Lua = {
            runtime = {
              version = "LuaJIT"
            },
            diagnostics = {
              globals = { "vim" }
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true)
            }
          }
        }
      }
    end
  }
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end
  },
  sources = {
    { name = "luasnip" },
    { name = "nvim_lsp" },
    { name = "buffer" }
  },
  mapping = cmp.mapping.preset.insert({
    ["<Tab>"] = cmp.mapping.confirm({ select = true }),
    --    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ["<C-p>"] = cmp.mapping.select_next_item(cmp_select),
    ["<C-o>"] = cmp.mapping.select_prev_item(cmp_select)
  }),
})
