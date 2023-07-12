local plugins = require("odie.core.lazy")

pcall(require, "odie.custom")

plugins.setup(" ", {})

require("odie.core.settings")
require("odie.core.mappings")
require("odie.core.autocmds")
pcall(require, "odie.custom.config")
