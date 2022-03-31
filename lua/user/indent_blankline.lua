local status_ok, indent_bline = pcall(require, "indent_blankline")
if not status_ok then
	vim.notify("indent_blankline not found")
end

vim.opt.termguicolors = true
vim.cmd([[highlight IndentBlanklineIndent1 guibg=#1e2327 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent2 guibg=#282c34 gui=nocombine]])

indent_bline.setup({
	show_current_context = true,
	show_current_context_start = true,
	char = "",
	char_highlight_list = {
		"IndentBlanklineIndent1",
		"IndentBlanklineIndent2",
	},
	space_char_highlight_list = {
		"IndentBlanklineIndent1",
		"IndentBlanklineIndent2",
	},
	show_trailing_blankline_indent = false,
})
