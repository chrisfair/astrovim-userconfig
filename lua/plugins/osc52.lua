return {
{
    "ojroques/nvim-osc52",
    config = function()
      require("osc52").setup{
        max_length = 0, -- Max length of text to copy
        trim = true, -- Trim text to fit in the clipboard
        silent = false, -- Don't print message when copying
        tmux_passthrough = true; -- Use tmux passthrough
      }

      local function copy()
        if vim.v.event.operator == "y" and vim.v.event.regname == "" then
          require("osc52").copy_register("")
            end
      end
      vim.api.nvim_create_autocmd("TextYankPost", { callback = copy })
    end,
  },
}
