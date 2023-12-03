local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

configs.setup({
  -- one of "all" or a list of languages
  ensure_installed = {
    "typescript",
    "javascript",
    "scss",
    "html",
    "css",
    "lua",
    "vim",
    "python",
    "markdown",
    "go",
    "graphql",
    "dockerfile",
    "json",
    "regex",
    "yaml",
    "http",
  },
  highlight = {
    -- disable because of an error. don't know why.
    -- false will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = { "lua" },
  },
  autopairs = {
    enable = true,
  },
  indent = {
    enable = true,
  },
})
