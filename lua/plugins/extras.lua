-- Zen Mode
require("zen-mode").setup({
  window = {
    width = 80,
    options = {
      number = false,
      relativenumber = false,
    },
  },
  plugins = {
    twilight = { enabled = true },
  },
})

-- Twilight
require("twilight").setup({})

-- GitSigns
require("gitsigns").setup()

-- Pets (Terminal Creatures)
require("pets").setup({
  row = 2,
  col = 2,
  speed = 25,
  default_pet = "dog",
  default_style = "brown",
})
