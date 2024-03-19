local function get_schema()
  local schema = require("yaml-companion").get_buf_schema(0)
  if schema.result[1].name == "none" then
    return ""
  end
  return schema.result[1].name
end


require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'tokyonight',
  },
  sections = {
    lualine_a = {
      {
        'filename',
        path = 1,
      }
    },
    lualine_y = { 'data', "require'lsp-status'.status()" },
    lualine_x = {
      get_schema
    }
  }
}
