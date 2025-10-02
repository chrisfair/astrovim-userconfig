return {
  {
    "LazyVim/LazyVim",
    opts = function(_, opts)
      -- Safe toggle (defaults to false)
      local use_ghostty = vim.g.use_ghostty_theme == true

      -- Only try Ghostty if toggle is on
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

        if theme and map[theme] then
          opts.colorscheme = map[theme]
        else
          -- fall back safely to AstroNvim’s built-in theme
          opts.colorscheme = "astrodark"
        end
      else
        -- Always safe fallback
        opts.colorscheme = "astrodark"
      end
    end,
  },
}

