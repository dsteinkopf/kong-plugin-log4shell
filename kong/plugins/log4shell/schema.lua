-- see https://docs.konghq.com/gateway/3.4.x/plugin-development/configuration/
-- see https://github.com/Kong/kong-plugin/blob/master/kong/plugins/myplugin/schema.lua

local typedefs = require "kong.db.schema.typedefs"

-- Grab pluginname from module name
local plugin_name = ({...})[1]:match("^kong%.plugins%.([^%.]+)")

local schema = {
  name = plugin_name,
  fields = {
    {
      protocols = {
        type = "set",
        elements = typedefs.protocol,
        default = { "http", "https" },
      },
    },
    {
      config = {
        type = "record",
        fields = {
          -- none
        },
      },
    },
  },
}

return schema
