local cfg = require("yaml-companion").setup({})
require("lspconfig")["yamlls"].setup(cfg)


local function get_schema()
  local schema = require("yaml-companion").get_buf_schema(0)
  if schema.result[1].name == "none" then
    return ""
  end
  return schema.result[1].name
end
