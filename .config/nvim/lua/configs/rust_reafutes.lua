vim.api.nvim_create_user_command("RaFeatures", function(opts)
  local features = vim.split(opts.args, "%s+", { trimempty = true })
  local clients = vim.lsp.get_clients({ name = "rust_analyzer" })
  for _, client in ipairs(clients) do
    client.settings = vim.tbl_deep_extend("force", client.settings or {}, {
      ["rust-analyzer"] = {
        cargo = {
          features = features,
        },
      },
    })
    client:notify("workspace/didChangeConfiguration", {
      settings = client.settings,
    })
  end
  vim.notify("rust-analyzer features: " .. vim.inspect(features), vim.log.levels.INFO)
end, {
  nargs = "+",
  desc = "Set rust-analyzer cargo features",
})
