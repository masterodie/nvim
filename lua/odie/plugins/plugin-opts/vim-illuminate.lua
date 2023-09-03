return {
  providers = {
    "lsp",
    "treesitter",
    "regex",
  },
  large_file_cutoff = 2000,
  large_file_overrides = {
    providers = { "lsp" },
  },
}
