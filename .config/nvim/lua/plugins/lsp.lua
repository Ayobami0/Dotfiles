return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "L3MON4D3/LuaSnip",
    "rafamadriz/friendly-snippets",
  },
  config = function()
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(event)
        local map = function(key, func, desc)
          vim.keymap.set("n", key, func, { desc = "LSP actions " .. desc, buffer = event.buf })
        end

        map("K", vim.lsp.buf.hover, "Hover")
        map("gd", vim.lsp.buf.definition, "[G]oto [d]efination")
        map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclearation")
        map("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
        map("gt", vim.lsp.buf.type_definition, "[G]oto [T]ype definition")
        map("gr", vim.lsp.buf.references, "[G]oto [R]eferences")
        map("gs", vim.lsp.buf.signature_help, "[G]oto [S]ignature")
        map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
        map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
      end,
    })

    -- local capabilities = require("cmp_nvim_lsp").default_capabilities()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

    local servers = {
      gopls = {},
      jsonls = {},
      marksman = {},
      pyright = {},
    }

    local default_setup = function(server)
      require("lspconfig")[server].setup {
        capabilities = capabilities,
      }
    end

    require("mason").setup {}
    require("mason-lspconfig").setup {
      ensure_installed = servers,
      handlers = {
        default_setup,
        lua_ls = function()
          require("lspconfig").lua_ls.setup {
            capabilities = capabilities,
            settings = {
              Lua = {
                runtime = { version = "LuaJIT" },
                workspace = {
                  checkThirdParty = false,
                  library = { vim.env.VIMRUNTIME },
                },
                completion = {
                  callSnippet = "Replace",
                },
                diagnostics = { disable = { "missing-fields" } },
              },
            },
          }
        end,
      },
    }

    local lspconfig = require "lspconfig"

    lspconfig.dartls.setup {
      capabilities = capabilities,
      root_dir = lspconfig.util.root_pattern "pubspec.yaml",
      settings = {
        dart = {
          analysisExcludedFolders = {
            vim.fn.expand "$HOME/AppData/Local/Pub/Cache",
            vim.fn.expand "$HOME/.pub-cache",
            vim.fn.expand "/opt/homebrew/",
          },
          updateImportsOnRename = true,
          completeFunctionCalls = true,
          showTodos = true,
        },
      },
    }

    local cmp = require "cmp"

    local luasnip = require "luasnip"
    luasnip.config.setup {
      update_events = "TextChanged,TextChangedI",
    }

    require("luasnip.loaders.from_vscode").lazy_load()
    require("luasnip.loaders.from_lua").lazy_load {
      paths = { "~/.config/nvim/lua/snippets/" },
    }

    cmp.setup {
      mapping = cmp.mapping.preset.insert {
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-y>"] = cmp.mapping.confirm { select = true },
        ["<C-Space>"] = cmp.mapping.complete {},
        ["<C-j>"] = cmp.mapping(function()
          if luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          end
        end, { "i", "s" }),
        ["<C-k>"] = cmp.mapping(function()
          if luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          end
        end, { "i", "s" }),
      },
      sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "path" },
      },
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
    }
  end,
}
