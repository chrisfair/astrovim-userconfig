return {
  {
    "AstroNvim/astroui",  -- ✅ patch AstroUI, not AstroCore (colorscheme is an AstroUI option)
    opts = function(_, opts)
      local use_ghostty = vim.g.use_ghostty_theme == true or vim.env.TERM == "xterm-ghostty"

      if use_ghostty then
        local ghostty_conf = vim.fn.expand("~/.config/ghostty/config")
        local theme = nil
        local ok, file = pcall(io.open, ghostty_conf, "r")

        if ok and file then
          for line in file:lines() do
            local t = line:match("^theme%s*=%s*(.+)")
            if t then
              theme = t:gsub("%s+", "")
              break
            end
          end
          file:close()
        end

        local map = {
          dracula = "dracula",
          catppuccin = "catppuccin",
          gruvbox = "gruvbox",
        }

        opts.colorscheme = map[theme] or "astrodark"
      else
        opts.colorscheme = "astrodark"
      end
    end,
  },
}

