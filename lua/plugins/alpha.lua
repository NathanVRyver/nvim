local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
  "⠀⠀⠀⠀⠀⠀⢀⣀⣀⣀⣀⣀⡀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⣠⡾⠛⠉⠙⠛⠉⠙⠻⣦⡀⠀⠀⠀⠀",
  "⠀⠀⠀⣼⡏⠀⠀⢀⣀⠀⠀⠀⠀⠈⣿⡆⠀⠀⠀",
  "⠀⠀⠀⣿⡇⠀⢰⡿⠿⠿⣷⡄⠀⠀⢸⣿⠀⠀⠀",
  "⠀⠀⠀⣿⡇⠀⢸⡇⠀⠀⢸⡇⠀⠀⢸⣿⠀⠀⠀",
  "⠀⠀⠀⠹⣧⡀⠀⠻⣶⣶⡿⠃⠀⢀⣼⠏⠀⠀⠀",
  "⠀⠀⠀⠀⠈⠛⠷⣤⣤⣤⣤⠶⠛⠋⠁⠀⠀⠀⠀",
  "",
  "  the eye of truth type shi",
}

dashboard.section.buttons.val = {
  dashboard.button("f", "🔍 Find File", ":Telescope find_files<CR>"),
  dashboard.button("r", "🕰️  Recent Files", ":Telescope oldfiles<CR>"),
  dashboard.button("e", "📂 Explorer", ":NvimTreeToggle<CR>"),
  dashboard.button("c", "⚙️  Config", ":e ~/.config/nvim/init.lua<CR>"),
  dashboard.button("q", "🛑 Quit", ":qa<CR>"),
}

dashboard.section.footer.val = {
  "",
  "“Hokage Dattebayo”",
  " — Naruto",
}

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)
