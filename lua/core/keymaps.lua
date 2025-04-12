vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    local map = vim.keymap.set
    map("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle File Explorer" })
    map("n", "<leader>f", ":Telescope find_files<CR>", { desc = "Find Files" })
  end,
})
