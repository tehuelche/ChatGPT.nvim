-- main module file
local api = require("chatgpt.api")
local module = require("chatgpt.module")
local config = require("chatgpt.config")
local signs = require("chatgpt.signs")

local M = {}

M.setup = function(options)
  -- set custom highlights
  vim.api.nvim_set_hl(0, "LeoGPTQuestion", { fg = "#b4befe", italic = true, bold = false, default = true })

  vim.api.nvim_set_hl(0, "LeoGPTWelcome", { fg = "#9399b2", italic = true, bold = false, default = true })

  vim.api.nvim_set_hl(0, "LeoGPTTotalTokens", { fg = "#ffffff", bg = "#444444", default = true })
  vim.api.nvim_set_hl(0, "LeoGPTTotalTokensBorder", { fg = "#444444", default = true })

  vim.api.nvim_set_hl(0, "LeoGPTMessageAction", { fg = "#ffffff", bg = "#1d4c61", italic = true, default = true })

  vim.api.nvim_set_hl(0, "LeoGPTCompletion", { fg = "#9399b2", italic = true, bold = false, default = true })

  vim.cmd("highlight default link LeoGPTSelectedMessage ColorColumn")

  config.setup(options)
  api.setup()
  signs.setup()
end

--
-- public methods for the plugin
--

M.openChat = function()
  module.open_chat()
end

M.selectAwesomePrompt = function()
  module.open_chat_with_awesome_prompt()
end

M.edit_with_instructions = function()
  module.edit_with_instructions()
end

M.run_action = function(opts)
  module.run_action(opts)
end

M.complete_code = module.complete_code

return M
