local M = {}

function M.setup(opts)
	opts = opts or {}

	local this_file = assert(debug.getinfo(1, "S").source:match("^@(.+)$"))
	local query_dir = vim.fs.normalize(vim.fs.joinpath(vim.fs.dirname(this_file), "..", "..", "queries"))

	if opts.scheme and opts.scheme.enabled then
		local scheme_opts = opts.scheme

		local queries = nil

		if scheme_opts.variants then
			local variants = scheme_opts.variants
			if variants.guile or variants.guix then
				queries = queries or ""
				queries = (
					queries
					.. "\n"
					.. table.concat(vim.fn.readfile(query_dir .. "/scheme/guile-highlights.scm"))
				)
				if variants["guix"] then
					queries = queries or ""
					queries = (
						queries
						.. "\n"
						.. table.concat(vim.fn.readfile(query_dir .. "/scheme/guix-highlights.scm"))
					)
				end
			end
			if variants["guix"] then
				queries = queries or ""
				queries = (queries .. "\n" .. table.concat(vim.fn.readfile(query_dir .. "/scheme/guix-highlights.scm")))
			end
		end

		local lang = vim.treesitter.language.get_lang("scheme")
		if queries and lang then
			queries = [[;; inherits: scheme
;; extends

      ]] .. queries

			vim.treesitter.query.set(lang, "highlights", queries)
		end
	end
end

return M
