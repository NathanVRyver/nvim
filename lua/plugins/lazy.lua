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
  },

  -- avante
  {
    "yetone/avante.nvim",
    lazy = false,
    version = false,
    build = "make",
    priority = 1000,
    opts = {
      provider = "openai",
      openai = {
        endpoint = "https://api.openai.com/v1",
        model = "gpt-4o",
        timeout = 30000,
        temperature = 0,
        max_completion_tokens = 8192,
      },
    },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "hrsh7th/nvim-cmp",
      "nvim-tree/nvim-web-devicons",
      "nvim-telescope/telescope.nvim",
      {
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = { insert_mode = true },
            use_absolute_path = true,
          },
        },
      },
      {
        "MeanderingProgrammer/render-markdown.nvim",
        opts = { file_types = { "markdown", "Avante" } },
        ft = { "markdown", "Avante" },
      },
    },
  },
  -- code companion
  {
    "olimorris/codecompanion.nvim",
    cmd = "CodeCompanion",
    event = "InsertEnter",
    config = function()
      require("codecompanion").setup({
        provider = "anthropic",
        anthropic = {
          api_key = os.getenv("ANTHROPIC_API_KEY"),
          model = "claude-3-7-sonnet-20241022", -- 🔥 we're going bankrupt with this
        },
        suggestion = {
          enabled = true,
          auto_trigger = true,
          debounce = 75,
          accept_keymap = "<C-l>",
        },
        log_level = "INFO",
      })
    end,
    dependencies = { "nvim-lua/plenary.nvim" },
  }
}
