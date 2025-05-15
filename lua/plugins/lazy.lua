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


vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.cmd [[
      highlight Normal guibg=NONE ctermbg=NONE
      highlight NormalNC guibg=NONE ctermbg=NONE
      highlight Pmenu guibg=NONE ctermbg=NONE
      highlight FloatBorder guibg=NONE ctermbg=NONE
      highlight NormalFloat guibg=NONE ctermbg=NONE
      highlight TelescopeNormal guibg=NONE
      highlight TelescopeBorder guibg=NONE
    ]]
  end,
})


require("lazy").setup {
  { "rose-pine/neovim",       name = "rose-pine" },
  { "nvim-tree/nvim-tree.lua" },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }
    },
    config = function()
      local telescope = require("telescope")

      telescope.load_extension("fzf")

      telescope.setup({
        defaults = {
          file_ignore_patterns = {
            "venv/", "node_modules/", "build/", "dist/", "%.lock", "%.git/", "__pycache__/",
            "%.svg", "%.png", "%.jpg", "%.jpeg", "%.ico"
          },
          vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--hidden",
            "--glob", "!.git/",
            "--glob", "!venv/",
            "--glob", "!node_modules/",
            "--glob", "!build/"
          },
        },
        pickers = {
          live_grep = {
            -- Use files-with-matches to only show each file once
            additional_args = function()
              return { "--files-with-matches" }
            end
          }
        }
      })

      -- Create a custom command for files with matches
      local builtin = require('telescope.builtin')
      vim.api.nvim_create_user_command('TelescopeFilesWithMatches', function(opts)
        builtin.live_grep({
          additional_args = { "--files-with-matches" }
        })
      end, {})
    end
  }
  , { "nvim-lualine/lualine.nvim" },
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
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      strategies = {
        inline = { adapter = "anthropic" },
        chat = { adapter = "anthropic" },
      },
      anthropic = {
        api_key = os.getenv("ANTHROPIC_API_KEY"),
        model = "claude-3-7-sonnet-20241022",
      },
      suggestion = {
        enabled = true,
        auto_trigger = true,
        debounce = 75,
        accept_keymap = "<C-l>", -- Accept suggestion with Ctrl+L
      },
      log_level = "DEBUG",
    },
    config = function(_, opts)
      require("codecompanion").setup(opts)
      vim.notify("🧠 Claude 3.7 online. This crap works", vim.log.levels.INFO)
      -- Claude Token Tracker 💸
      vim.api.nvim_create_autocmd("User", {
        pattern = "CodeCompanionTokensUsed",
        callback = function(args)
          local tokens = args.data and args.data.tokens or 0
          vim.notify("🧾 Claude used " .. tokens .. " tokens in that suggestion", vim.log.levels.INFO)
        end,
      })
    end,
  }
}
