-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "tomorrow_night",

	-- hl_override = {
	-- 	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	-- },
}

-- M.ui = {
--   nvdash = {
--     load_on_startup = true,
--
--     header = {
--       "           ▄ ▄                   ",
--       "       ▄   ▄▄▄     ▄ ▄▄▄ ▄ ▄     ",
--       "       █ ▄ █▄█ ▄▄▄ █ █▄█ █ █     ",
--       "    ▄▄ █▄█▄▄▄█ █▄█▄█▄▄█▄▄█ █     ",
--       "  ▄ █▄▄█ ▄ ▄▄ ▄█ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄  ",
--       "  █▄▄▄▄ ▄▄▄ █ ▄ ▄▄▄ ▄ ▄▄▄ ▄ ▄ █ ▄",
--       "▄ █ █▄█ █▄█ █ █ █▄█ █ █▄█ ▄▄▄ █ █",
--       "█▄█ ▄ █▄▄█▄▄█ █ ▄▄█ █ ▄ █ █▄█▄█ █",
--       "    █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█ █▄█▄▄▄█    ",
--     },
--
--     buttons = {
--       { "  Find File", "Spc f f", "Telescope find_files" },
--       { "󰈚  Recent Files", "Spc f o", "Telescope oldfiles" },
--       { "󰈭  Find Word", "Spc f w", "Telescope live_grep" },
--       { "  Bookmarks", "Spc m a", "Telescope marks" },
--       { "  Themes", "Spc t h", "Telescope themes" },
--       { "  Mappings", "Spc c h", "NvCheatsheet" },
--     },
--   },
-- }

-- When the dashboard is created at startup 
-- create a new file for editing when entering insert mode.
-- vim.api.nvim_create_autocmd("InsertEnter", {
--   pattern = "nvdash",
--   callback = function()
--     if vim.bo.modifiable == false then
--       -- Set the buffer as modifiable
--       vim.bo.modifiable = true
--     end
--     vim.cmd("enew") -- Open a new empty buffer
--   end,
-- })

-- M.lsp = { signature = false }

return M
