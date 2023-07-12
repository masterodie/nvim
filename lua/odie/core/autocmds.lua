local group = vim.api.nvim_create_augroup("UserLspConfig", {})

vim.api.nvim_create_autocmd("LspAttach", {
  group = group,
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    local function get_options(desc)
      local opts = { buffer = ev.buf }
      return vim.tbl_deep_extend("force", opts, { desc = desc })
    end

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, get_options("[G]o to [D]eclaration"))
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, get_options("[G]o to [D]efninition"))
    vim.keymap.set("n", "K", vim.lsp.buf.hover, get_options("Hover"))
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, get_options("[G]o to [I]mplementation"))
    vim.keymap.set("n", "H", vim.lsp.buf.signature_help, get_options("Show signature help"))
    vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, get_options("Add Workspace Folder"))
    vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, get_options("Remove Workspace Folder"))
    vim.keymap.set("n", "<space>wl", function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end,
      get_options("List Workspace Folders"))
    vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, get_options("Go to type defnition"))
    vim.keymap.set("n", "<space>cr", vim.lsp.buf.rename, get_options("LSP [R]e[n]ame"))
    vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, get_options("LSP [C]ode [A]ction"))
    vim.keymap.set("n", "gr", vim.lsp.buf.references, get_options("[G]o to [R]references"))
    vim.keymap.set("n", "<space>cf", function() vim.lsp.buf.format({ async = true }) end, get_options("Format Code"))
    vim.keymap.set("n", "<space>fm", function() vim.lsp.buf.format({ async = true }) end, get_options("Format Code"))
  end
})
