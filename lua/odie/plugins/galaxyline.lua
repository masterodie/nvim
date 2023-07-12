local gl = require("galaxyline")
local gls = gl.section
local colors = require("galaxyline.theme").default
local condition = require("galaxyline.condition")

gl.short_line_list = { "NvimTree", "startify" }

colors.bg = "#232526"
colors.section_bg = "#293739"

function line_column()
	local line = vim.fn.line(".")
	local column = vim.fn.col(".")
	return string.format("%d:%d ", line, column)
end

gls.left[1] = {
	RainbowRed = {
		provider = function()
			return "▊ "
		end,
		highlight = { colors.blue, colors.section_bg },
	},
}

gls.left[2] = {
	ViMode = {
		provider = function()
			-- auto change color according the vim mode
			local mode_color = {
				n = colors.magenta,
				i = colors.green,
				v = colors.blue,
				[""] = colors.blue,
				V = colors.blue,
				c = colors.red,
				no = colors.magenta,
				s = colors.orange,
				S = colors.orange,
				[""] = colors.orange,
				ic = colors.yellow,
				R = colors.violet,
				Rv = colors.violet,
				cv = colors.red,
				ce = colors.red,
				r = colors.cyan,
				rm = colors.cyan,
				["r?"] = colors.cyan,
				["!"] = colors.red,
				t = colors.red,
			}
			vim.api.nvim_command("hi GalaxyViMode guifg=" .. mode_color[vim.fn.mode()])
			return "  "
		end,
		highlight = { colors.red, colors.section_bg, "bold" },
	},
}

gls.left[3] = {
	FileIcon = {
		provider = "FileIcon",
		condition = condition.buffer_not_empty,
		highlight = { require("galaxyline.provider_fileinfo").get_file_icon_color, colors.section_bg },
	},
}

gls.left[4] = {
	FileName = {
		provider = "FileName",
		condition = condition.buffer_not_empty,
		highlight = { colors.magenta, colors.section_bg, "bold" },
		separator_highlight = { colors.bg, colors.section_bg },
	},
}

gls.left[5] = {
	LineInfo = {
		provider = line_column,
		highlight = { colors.fg, colors.section_bg },
	},
}

gls.left[6] = {
	ScrollBar = {
		provider = "ScrollBar",
		highlight = { colors.blue, colors.section_bg },
	},
}

gls.left[7] = {
	DiagnosticError = {
		provider = "DiagnosticError",
		condition = condition.check_active_lsp,
		icon = "   ",
		highlight = { colors.red, colors.section_bg },
	},
}
gls.left[8] = {
	DiagnosticWarn = {
		provider = "DiagnosticWarn",
		condition = condition.check_active_lsp,
		icon = "   ",
		highlight = { colors.yellow, colors.section_bg },
	},
}

gls.left[9] = {
	DiagnosticHint = {
		provider = "DiagnosticHint",
		condition = condition.check_active_lsp,
		icon = "   ",
		highlight = { colors.cyan, colors.section_bg },
	},
}

gls.left[10] = {
	DiagnosticInfo = {
		provider = "DiagnosticInfo",
		icon = "   ",
		condition = condition.check_active_lsp,
		highlight = { colors.blue, colors.section_bg },
	},
}
gls.left[11] = {
	LeftEnd = {
		provider = function()
			return " "
		end,
		highlight = { colors.section_bg, colors.bg },
	},
}

gls.right[1] = {
	RightEnd = {
		provider = function()
			return " "
		end,
		highlight = { colors.section_bg, colors.bg },
	},
}
gls.right[2] = {
	FileEncode = {
		provider = "FileEncode",
		condition = condition.hide_in_width,
		highlight = { colors.green, colors.section_bg, "bold" },
	},
}

gls.right[3] = {
	FileFormat = {
		provider = "FileFormat",
		condition = condition.hide_in_width,
		separator = " ",
		separator_highlight = { "NONE", colors.section_bg },
		highlight = { colors.green, colors.section_bg, "bold" },
	},
}

gls.right[4] = {
	BufferType = {
		provider = "FileTypeName",
		separator = " ",
		separator_highlight = { "NONE", colors.section_bg },
		highlight = { colors.blue, colors.section_bg, "bold" },
	},
}

gls.right[5] = {
	GitIcon = {
		provider = function()
			return "  "
		end,
		condition = condition.check_git_workspace,
		separator = " ",
		separator_highlight = { "NONE", colors.section_bg },
		highlight = { colors.violet, colors.section_bg, "bold" },
	},
}

gls.right[6] = {
	GitBranch = {
		provider = "GitBranch",
		condition = condition.check_git_workspace,
		highlight = { colors.violet, colors.section_bg, "bold" },
	},
}

gls.right[7] = {
	DiffAdd = {
		provider = "DiffAdd",
		condition = condition.hide_in_width,
		icon = "   ",
		highlight = { colors.green, colors.section_bg },
	},
}

gls.right[8] = {
	DiffModified = {
		provider = "DiffModified",
		condition = condition.hide_in_width,
		icon = "  柳",
		highlight = { colors.orange, colors.section_bg },
	},
}
gls.right[9] = {
	DiffRemove = {
		provider = "DiffRemove",
		condition = condition.hide_in_width,
		icon = "   ",
		highlight = { colors.red, colors.section_bg },
	},
}

gls.right[10] = {
	RainbowBlue = {
		provider = function()
			return "  ▊"
		end,
		highlight = { colors.blue, colors.section_bg },
		separator_highlight = { colors.bg, colors.section_bg },
	},
}

gls.short_line_left[1] = {
	BufferType = {
		provider = "FileTypeName",
		separator = " ",
		separator_highlight = { "NONE", colors.bg },
		highlight = { colors.blue, colors.bg, "bold" },
	},
}

gls.short_line_left[2] = {
	SFileName = {
		provider = function()
			local fileinfo = require("galaxyline.provider_fileinfo")
			local fname = fileinfo.get_current_file_name()
			for _, v in ipairs(gl.short_line_list) do
				if v == vim.bo.filetype then
					return ""
				end
			end
			return fname
		end,
		condition = buffer_not_empty,
		highlight = { colors.white, colors.bg, "bold" },
	},
}

gls.short_line_right[1] = {
	BufferIcon = {
		provider = "BufferIcon",
		highlight = { colors.fg, colors.bg },
	},
}
