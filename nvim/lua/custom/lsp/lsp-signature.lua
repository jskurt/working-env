local M = {
  "ray-x/lsp_signature.nvim"
}

M.config = function()
  local signature = require("lsp_signature")
  local setup = {
    debug = false,

    bind = true,
    doc_lines = 10,

    floating_window = true,
    floating_window_above_cur_line = true,

    fix_pos = false,
    hint_enable = false,
    use_lspsaga = false,
    hi_parameter = "LspSignatureActiveParameter",
    max_height = 12,
    max_width = 120,
    handler_opts = {
      border = "rounded", -- double, rounded, single, shadow, none
    },

    always_trigger = true,

    auto_close_after = nil,
    extra_trigger_chars = {},
    zindex = 200,

    padding = "",

    transparency = nil,
    shadow_blend = 36,
    shadow_guibg = "Black",
    timer_interval = 200,
    toggle_key = nil,
  }

  signature.setup(setup)
  signature.on_attach(setup)
end

return M
