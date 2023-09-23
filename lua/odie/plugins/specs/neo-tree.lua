local M = {
  "nvim-neo-tree/neo-tree.nvim",
}
M.event = { "ColorScheme" }

M.branch = "v3.x"

M.dependencies = {
  { "nvim-lua/plenary.nvim" },
  { "nvim-tree/nvim-web-devicons" },
  { "MunifTanjim/nui.nvim" },
}

M.opts = function(_, opts)
  vim.fn.sign_define(
    "DiagnosticSignError",
    { text = " ", texthl = "DiagnosticSignError" }
  )
  vim.fn.sign_define(
    "DiagnosticSignWarn",
    { text = "", texthl = "DiagnosticSignWarn" }
  )
  vim.fn.sign_define(
    "DiagnosticSignInfo",
    { text = "", texthl = "DiagnosticSignInfo" }
  )
  vim.fn.sign_define(
    "DiagnosticSignHint",
    { text = "󰌵", texthl = "DiagnosticSignHint" }
  )

  return vim.tbl_deep_extend("force", {
    enable_git_status = true,
    enable_diagnostics = true,
    source_selector = {
      winbar = true,
      statusline = false,
      sources = {
        { source = "filesystem", display_name = " 󰉓 Files" },
        { source = "git_status", display_name = " 󰊢 Git" },
      },
    },
    filesystem = {
      hijack_netrw_behavior = "open_default",
      use_libuv_file_watcher = true,
      follow_current_file = {
        enabled = true,
      },
    },
    default_component_configs = {
      icon = {
        folder_closed = "",
        folder_open = "",
        folder_empty = "",
        folder_empty_open = "",
      },
      git_status = {
        symbols = {
          -- Change type
          added = "✚", -- or "✚", but this is redundant info if you use git_status_colors on the name
          modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
          deleted = "✖", -- this can only be used in the git_status source
          -- Status type
          untracked = "",
          ignored = "",
          staged = "",
          conflict = "",
          renamed = "󰁕",
          unstaged = "󰄱",
        },
      },
    },
    document_symbols = {
      kinds = {
        File = { icon = "󰈙", hl = "Tag" },
        Namespace = { icon = "󰌗", hl = "Include" },
        Package = { icon = "󰏖", hl = "Label" },
        Class = { icon = "󰌗", hl = "Include" },
        Property = { icon = "󰆧", hl = "@property" },
        Enum = { icon = "󰒻", hl = "@number" },
        Function = { icon = "󰊕", hl = "Function" },
        String = { icon = "󰀬", hl = "String" },
        Number = { icon = "󰎠", hl = "Number" },
        Array = { icon = "󰅪", hl = "Type" },
        Object = { icon = "󰅩", hl = "Type" },
        Key = { icon = "󰌋", hl = "" },
        Struct = { icon = "󰌗", hl = "Type" },
        Operator = { icon = "󰆕", hl = "Operator" },
        TypeParameter = { icon = "󰊄", hl = "Type" },
        StaticMethod = { icon = "󰠄 ", hl = "Function" },
      },
    },
    hover = {
      enabled = true,
      delay = 200,
    },
  }, opts)
end

M.keys = function(_, keys)
  return vim.tbl_deep_extend("force", {
    {
      "<leader>e",
      function()
        vim.cmd.Neotree("toggle")
      end,
      desc = "Toggle File Explorer",
    },
    {
      "<leader>fe",
      function()
        vim.cmd.Neotree("toggle")
      end,
      desc = "Toggle File Explorer",
    },
    {
      "<leader>ge",
      function()
        vim.cmd.Neotree("git_status")
      end,
      desc = "Toggle Git Explorer",
    },
  }, keys)
end

return M
