local wk = require("which-key")

wk.setup({})
wk.register({
	b = {
		name = "buffer", -- optional group name
		b = { "<cmd>Buffers<cr>", "Find buffers" }, -- create a binding with label
		n = { "<C-b>n", "Next buffer" },
		p = { "<C-b>p", "Previous buffer" },
		d = { "<C-b>d", "Destroy buffer" },
	},
	c = {
		name = "code", -- optional group name
		b = { "<cmd>Buffers<cr>", "Find buffers" }, -- create a binding with label
		i = { "gg=G", "Reindent" }, -- create a binding with label
	},
	f = {
		name = "file", -- optional group name
		f = { "<cmd>Telescope find_files<cr>", "Find File" }, -- create a binding with label
		v = { "<cmd>Telescope git_files<cr>", "Find File" }, -- create a binding with label
		g = { "<cmd>Telescope live_grep<cr>", "Live Grep" }, -- create a binding with label
		b = { "<cmd>Telescope buffers<cr>", "Find Buffers" }, -- create a binding with label
		h = { "<cmd>Telescope help<cr>", "Find Help Tags" }, -- create a binding with label
		t = { "<cmd>Telescope treesitter<cr>", "Find Code" }, -- create a binding with label
	},
	g = {
		name = "git", -- optional group name
		g = { "<cmd>Git<cr>", "Open Git" }, -- create a binding with label
		s = { "<cmd>Git<cr>", "Open Git" }, -- create a binding with label
		p = { "<cmd>Git pull<cr>", "git pull" }, -- create a binding with label
		P = { "<cmd>Git push<cr>", "git push" }, -- create a binding with label
	},
	h = {
		name = "help", -- optional group name
		p = {
			name = "packer", -- optional group name
			s = { "<cmd>PackerSync<cr>", "Sync Plugins" }, -- create a binding with label
			u = { "<cmd>PackerUpdate<cr>", "Update Plugins" }, -- create a binding with label
			c = { "<cmd>PackerClean<cr>", "Clean Plugins" }, -- create a binding with label
			C = { "<cmd>PackerCompile<cr>", "Build Plugins" }, -- create a binding with label
			S = { "<cmd>PackerStatus<cr>", "Packer Status" }, -- create a binding with label
		},
	},
	o = {
		name = "open", -- optional group name
		f = { "<cmd>NvimTreeToggle<cr>", "Toggle File Explorer" }, -- create a binding with label
		t = { "<cmd>TroubleToggle<cr>", "Toggle Troube" }, -- create a binding with label
	},
	q = {
		name = "quit", -- optional group name
		q = { "<cmd>quitall<cr>", "Quit" }, -- create a binding with label
		Q = { "<cmd>quitall!<cr>", "Force Quit" }, -- create a binding with label
	},
	w = {
		name = "window", -- optional group name
		W = { "<cmd>Windows<cr>", "Find windows" }, -- create a binding with label
		w = { "<C-w>p", "Last window" },
		k = { "<C-w>k", "Window up" },
		j = { "<C-w>j", "Window below" },
		h = { "<C-w>h", "Window left" },
		l = { "<C-w>l", "Window right" },
		v = { "<C-w>v", "Split window right vertical" },
		s = { "<C-w>s", "Split window right horizontal" },
		d = { "<C-w>q", "Destroy window" },
	},
	[","] = { "<cmd>Telescope buffers<cr>", "Find buffers" },
	["<space>"] = { "<cmd>Telescope find_files<cr>", "Find buffers" },
}, {
	prefix = "<leader>",
})
