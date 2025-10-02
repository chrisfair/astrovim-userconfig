return {
  {
    "LazyVim/LazyVim",
    opts = function(_, opts)
      local ghostty_conf = vim.fn.expand("~/.config/ghostty/config")
      local theme = nil

      local file = io.open(ghostty_conf, "r")
      if file then
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

      opts.colorscheme = map[theme] or "default"
    end,
  },
}

