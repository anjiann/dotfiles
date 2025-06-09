local function has_prettier_config()
  local prettier_config_files = {
    ".prettierrc",
    ".prettierrc.json",
    ".prettierrc.yml",
    ".prettierrc.yaml",
    ".prettierrc.js",
    ".prettierrc.mjs",
    ".prettierrc.cjs",
    ".prettierrc.toml",
    "prettier.config.js",
    "prettier.config.mjs",
    "prettier.config.cjs",
  }
  
  for _, config_file in ipairs(prettier_config_files) do
    if vim.fn.filereadable(vim.fn.getcwd() .. "/" .. config_file) == 1 then
      return true
    end
  end
  
  -- Check package.json for prettier config
  local package_json = vim.fn.getcwd() .. "/package.json"
  if vim.fn.filereadable(package_json) == 1 then
    local ok, content = pcall(vim.fn.readfile, package_json)
    if ok then
      local json_str = table.concat(content, "\n")
      if json_str:match('"prettier"') then
        return true
      end
    end
  end
  
  return false
end

local function has_biome_config()
  local biome_config_files = {
    "biome.json",
    "biome.jsonc",
  }
  
  for _, config_file in ipairs(biome_config_files) do
    if vim.fn.filereadable(vim.fn.getcwd() .. "/" .. config_file) == 1 then
      return true
    end
  end
  
  return false
end

local function get_formatter_for_filetype()
  local react_filetypes = {
    "javascript",
    "javascriptreact", 
    "typescript",
    "typescriptreact",
    "json",
    "jsonc",
  }
  
  local formatters = {}
  
  for _, ft in ipairs(react_filetypes) do
    if has_prettier_config() then
      formatters[ft] = { "prettier" }
    elseif has_biome_config() then
      formatters[ft] = { "biome" }
    else
      -- Default to prettier if no config is found
      formatters[ft] = { "prettier" }
    end
  end
  
  return formatters
end

return {
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = function()
      return {
        formatters_by_ft = get_formatter_for_filetype(),
      }
    end,
  },
}
