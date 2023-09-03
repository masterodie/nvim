return {
  fps = 60,
  render = "compact",
  on_open = function(win)
    vim.api.nvim_win_set_config(win, { border = "none" })
  end,
}
