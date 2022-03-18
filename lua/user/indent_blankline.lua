local status_ok, indent_bline = pcall(require, "indent_blankline")
if not status_ok then
	vim.notify("indent_blankline not found")
end

indent_bline.setup({
	show_current_context = true,
	show_current_context_start = true,
})
