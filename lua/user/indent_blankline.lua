local status_ok, indent_bline = pcall(require, "indent_blankline")
if not status_ok then
	vim.notify("indent_blankline not found")
end

vim.opt.list = true

indent_bline.setup({
	show_end_of_line = true,
	show_current_context = true,
})
