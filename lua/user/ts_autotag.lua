local status_ok, tsautotag = pcall(require, "nvim-ts-autotag")
if not status_ok then
	vim.notify("tsautotag Not found!")
	return
end

local filetypes = {
	"html",
	"javascript",
	"typescript",
	"javascriptreact",
	"typescriptreact",
	"svelte",
	"vue",
	"tsx",
	"jsx",
	"rescript",
	"xml",
	"php",
	"markdown",
	"glimmer",
	"handlebars",
	"hbs",
}
local skip_tags = {
	"area",
	"base",
	"br",
	"col",
	"command",
	"embed",
	"hr",
	"img",
	"slot",
	"input",
	"keygen",
	"link",
	"meta",
	"param",
	"source",
	"track",
	"wbr",
	"menuitem",
}

tsautotag.setup({
	autotag = {
		enable = true,
		filetypes = filetypes,
		skip_tags = skip_tags,
	},
})
