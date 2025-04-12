require "core"
require "plugins"
require "lsp"

--- music maybe
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.fn.jobstart(
      { "mpv", "--no-video", "--loop", vim.fn.expand "~/.config/nvim/assets/lofi.mp3" },
      { detach = true }
    )
  end,
})
