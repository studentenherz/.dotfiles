require "nvchad.mappings"

local map = vim.keymap.set

-- add yours here
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Coniguration for the "persistence" plugin
-- load the session for the current directory
map("n", "<leader>qs", function()
  require("persistence").load()
end)
-- select a session to load
map("n", "<leader>qS", function()
  require("persistence").select()
end)
-- load the last session
map("n", "<leader>ql", function()
  require("persistence").load { last = true }
end)
-- stop Persistence => session won't be saved on exit
map("n", "<leader>qd", function()
  require("persistence").stop()
end)

-- My configurations
map("n", "<A-j>", ":move + <cr>", { desc = "Move line down" })
map("n", "<A-k>", ":move -2 <cr>", { desc = "Move line up" })
map("v", "<A-j>", ":move '>+ <cr>gv=gv", { desc = "Move selection down" })
map("v", "<A-k>", ":move '<-2 <cr>gv=gv", { desc = "Move selection up" })

map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

map("n", "<leader>db", "<cmd> DapToggleBreakpoint <cr>", { desc = "Add breakpoint to at line" })
map("n", "<leader>dr", "<cmd> DapContinue <cr>", { desc = "Start or continued the debugger" })

map("n", "<leader>gd", ":Gitsigns preview_hunk <CR>", { desc = "Preview git hunk" })
map("n", "<leader>gs", ":Gitsigns stage_hunk <CR>", { desc = "Stage git hunk" })

vim.keymap.set('n', '4', '$', { noremap = true, silent = true, desc = 'Go to end of line' })
vim.keymap.set('n', '6', '^', { noremap = true, silent = true, desc = 'Go to first non-blank character' })
