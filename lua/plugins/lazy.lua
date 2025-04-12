local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup {
  { "rose-pine/neovim",                 name = "rose-pine" },
  { "nvim-tree/nvim-tree.lua" },
  { "nvim-telescope/telescope.nvim",    dependencies = { "nvim-lua/plenary.nvim" } },
  { "nvim-lualine/lualine.nvim" },
  { "nvim-tree/nvim-web-devicons" },
  { "goolord/alpha-nvim" },
  { "folke/which-key.nvim" },
  -- for the doggo
  { "edluffy/hologram.nvim" },
  -- 🧠 LSP Setup
  { "neovim/nvim-lspconfig" },
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  -- 🧘 Zen & Twilight
  { "folke/zen-mode.nvim" },
  { "folke/twilight.nvim" },

  -- 📘 Git Gutter
  { "lewis6991/gitsigns.nvim" },

  -- 🐾 Terminal Pets
  {
    "giusgad/pets.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
  }
}
