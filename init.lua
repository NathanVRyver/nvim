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
--- debug keys
vim.notify("TOKEN = " .. tostring(os.getenv("GITHUB_TOKEN")), vim.log.levels.INFO)

--- auto stop the damn music after we quit nvim
vim.api.nvim_create_autocmd("VimLeavePre", {
  callback = function()
    vim.fn.system("pkill mpv")
  end,
})

vim.api.nvim_create_user_command("PauseMusic", function()
  vim.fn.system("pkill -STOP mpv")
end, {})

vim.api.nvim_create_user_command("PlayMusic", function()
  vim.fn.system("pkill -CONT mpv")
end, {})
--- doggo
vim.api.nvim_create_user_command("Doggo", function()
  vim.cmd("PetsNew dog")
end, {})


-- Summon the pet squad
vim.api.nvim_create_user_command("Catto", function()
  vim.cmd("PetsNew cat")
end, {})

vim.api.nvim_create_user_command("Bunbun", function()
  vim.cmd("PetsNew bunny")
end, {})

vim.api.nvim_create_user_command("Frogchamp", function()
  vim.cmd("PetsNew frog")
end, {})
-- evict the pets
vim.api.nvim_create_user_command("RMPets", function()
  vim.cmd("PetsKillAll")
end, {})
