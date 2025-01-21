return {
  "saghen/blink.cmp",
  opts = {
    keymap = {
      ["<C-c>"] = {
        function(cmp)
          if not cmp.is_visible() then
            return cmp.show()
          end

          if cmp.snippet_active() then
            return cmp.accept()
          else
            return cmp.select_and_accept()
          end
        end,
        "snippet_forward",
        "fallback",
      },
    },
    completion = {
      menu = {
        auto_show = false,
      },
      ghost_text = {
        enabled = false,
      },
    },
  },
}
