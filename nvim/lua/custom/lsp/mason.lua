local M = {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    {
      "williamboman/mason.nvim"
    },
    {
      "neovim/nvim-lspconfig",
      event = { "BufReadPre", "BufNewFile" }
    }
  },
}

local function basic_lsp_setup()
  local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end

  local diagnostic_configs = {
    virtual_text = true,
    signs = {
      active = signs,
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      border = "rounded",
      source = "always",
    },
  }

  vim.diagnostic.config(diagnostic_configs)

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
    width = 100,
  })
end

local function common_capabilities()
  local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
  if status_ok then
    return cmp_nvim_lsp.default_capabilities()
  end

  local capabilities = vim.lsp.protocol.make_client_capabilities()

  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  }

  return capabilities
end

local function lsp_keymaps(bufnr)
  local options = { noremap = true, silent = true }

  vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", options)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", options)
  vim.api.nvim_buf_set_keymap(
    bufnr,
    "n",
    "gl",
    '<cmd>lua vim.diagnostic.open_float()<CR>',
    options
  )
end

local function on_init(client)
  -- let's see if we can get this working
  -- if client.name == "tsserver" and client.server_capabilities then
  -- end
  client.server_capabilities.documentFormattingProvider = false
  client.server_capabilities.semanticTokensProvider = nil
end

local function on_attach(_, bufnr)
  vim.cmd [[
    augroup format_on_save
      autocmd!
      autocmd BufWritePre * lua vim.lsp.buf.format({ async = false })
    augroup end
  ]]

  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  lsp_keymaps(bufnr)
end

M.config = function()
  basic_lsp_setup()

  -- remove "html" because it's conflicted with "angularls"
  local servers = {
    "tsserver",
    "cssls",
    "jsonls",
    "pyright",
    "tailwindcss",
    "dockerls",
    "eslint",
    "angularls",
    "gopls",
    "prismals",
    "lua_ls"
  }
  local mason_setup = {
    ui = {
      border = "rounded",
      icons = {
        package_installed = "◍",
        package_pending = "◍",
        package_uninstalled = "◍",
      },
    },
    log_level = vim.log.levels.INFO,
    max_concurrent_installers = 4,
  }
  local mason_lspconfig_setup = {
    ensure_installed = servers,
    automatic_installation = true,
  }

  require("mason").setup(mason_setup)
  require("mason-lspconfig").setup(mason_lspconfig_setup)

  local lspconfig = require("lspconfig")

  for _, server in pairs(servers) do
    local lsp_options = {
      on_init = on_init,
      on_attach = on_attach,
      capabilities = common_capabilities(),
    }
    local has_custom_options, server_custom_options = pcall(require, "custom.lsp.settings." .. server)

    if has_custom_options then
      lsp_options = vim.tbl_deep_extend("force", lsp_options, server_custom_options)
    end

    lspconfig[server].setup(lsp_options)
  end
end

return M
