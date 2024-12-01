vim.cmd('source ~/.config/nvim/old.vim')

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client.server_capabilities.hoverProvider then
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = args.buf })
    end
  end,
})

--rt.setup({
--  server = {
--    on_attach = function(_, bufnr)
--      vim.keymap.set("n", "<C-Enter>", rt.hover_actions.hover_actions, { buffer = bufnr })
--      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
--    end,
--  },
--})

vim.g.rustaceanvim = {
  -- Plugin configuration
  tools = {
  },
  -- LSP configuration
  server = {
    on_attach = function(client, bufnr)
      -- you can also put keymaps in here
      vim.keymap.set(
          "n", 
          "<leader>a", 
          function()
            vim.cmd.RustLsp('codeAction') -- supports rust-analyzer's grouping
            -- or vim.lsp.buf.codeAction() if you don't want grouping.
          end,
          { silent = true, buffer = bufnr }
        )
        vim.keymap.set(
          "n", 
          "K",  -- Override Neovim's built-in hover keymap with rustaceanvim's hover actions
          function()
            vim.cmd.RustLsp({'hover', 'actions'})
          end,
          { silent = true, buffer = bufnr }
        )
        end,
    default_settings = {
      -- rust-analyzer language server configuration
      ['rust-analyzer'] = {
      },
    },
  },
  -- DAP configuration
  dap = {
  },
}

local cmp = require'cmp'

cmp.setup({
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
    }, {
      { name = 'buffer' },
    })
})
