require "core"
require "plugins"
require "lsp"

vim.env.PATH = vim.env.PATH .. ':/opt/homebrew/bin:/usr/local/bin'
-- Music player using mpv
-- Music player using mpv (simplified, stable)
local function play_music(track)
  -- Kill any existing mpv (ignore errors)
  vim.fn.system("pkill -f mpv")

  -- Expand path & play track
  local full_path = vim.fn.expand(track)
  local result = vim.fn.jobstart({ "mpv", "--no-video", "--loop", full_path }, { detach = true })

  if result <= 0 then
    vim.notify("💥 Failed to start music!", vim.log.levels.ERROR)
  else
    vim.notify("🎶 Now playing: " .. full_path)
  end
end


-- 🎧 Lofi
vim.api.nvim_create_user_command("PlayLofi", function()
  play_music(vim.fn.expand("~/.config/nvim/assets/lofi.mp3"))
end, {})

-- 🌙 Nightcore
vim.api.nvim_create_user_command("PlayNightcore", function()
  play_music(vim.fn.expand("~/.config/nvim/assets/nightcore.mp3"))
end, {})

-- 🛑 Pause / Resume
vim.api.nvim_create_user_command("PauseMusic", function()
  vim.fn.system("pkill -STOP mpv")
end, {})

vim.api.nvim_create_user_command("PlayMusic", function()
  vim.fn.system("pkill -CONT mpv")
end, {})

-- 💀 Stop everything
vim.api.nvim_create_user_command("StopMusic", function()
  vim.fn.system("pkill mpv")
end, {})


--- auto stop the damn music after we quit nvim
vim.api.nvim_create_autocmd("VimLeavePre", {
  callback = function()
    vim.fn.system("pkill mpv")
  end,
})

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
