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


vim.api.nvim_create_user_command("PauseMusic", function()
  vim.fn.system("pkill -STOP mpv")
end, {})

vim.api.nvim_create_user_command("PlayMusic", function()
  vim.fn.system("pkill -CONT mpv")
end, {})
