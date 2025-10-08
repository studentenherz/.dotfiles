local vscode_loader = require("luasnip.loaders.from_vscode")
local uv = vim.loop

-- Function to load all snippet files in a directory
local function load_snippets_from_directory(directory)
    -- Expand '~' to the actual home directory
    directory = vim.fn.expand(directory)

    local handle = uv.fs_scandir(directory)
    if not handle then
        print("Directory not found:", directory)
        return
    end

    while true do
        local name, type = uv.fs_scandir_next(handle)
        if not name then break end

        -- Ensure it's a file
        if type == "file" then
            -- Assuming files end with `.code-snippets`
            if name:match("%.code%-snippets$") then
                local snippet_path = directory .. "/" .. name
                vscode_loader.load_standalone({
                    path = snippet_path
                })
            end
        end
    end
end

-- Call the function for your specific directory
load_snippets_from_directory("~/.config/Code/User/snippets")

return {

}
