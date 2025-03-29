local links = {
	"https://docs.google.com/forms/d/e/1FAIpQLScfAB1kvVJAdRr_268uZeUkE3z8crcmWY7h30LO_9PA82nYwA/viewform",
	"https://docs.google.com/forms/d/e/1FAIpQLSekcuoC_lfKLxeYCtR7eEKrQvQHy-Nt12MHwaAokSceSSL1Og/viewform",
	"https://docs.google.com/forms/d/e/1FAIpQLSf_w9L_Bfg7SnBh0wuOkEz5_OXDw7sZl5eW1FYKFnVy1W_TPg/viewform",
	"https://docs.google.com/forms/d/e/1FAIpQLSfHacaagXaUFuYMdvNKEGvtkQIEKjky4GdjH2wH5GU82QTKGQ/viewform",
	"https://docs.google.com/forms/d/e/1FAIpQLSdPttezc_GcTmo0KFJa9u_xngUC1xTRqY1RhPFds5VGOWsE-A/viewform",
	"https://docs.google.com/forms/d/e/1FAIpQLScSKg9UHd_YSsMaWOoVHvFmg42bW-3J-4O447NmFKRg9TJQgA/viewform",
	"https://docs.google.com/forms/d/e/1FAIpQLSeuDBFsVJBohHcRE4_gU40X6oQ3NAL7cCZA9_iepQNAs5E0rQ/viewform",
	"https://docs.google.com/forms/d/e/1FAIpQLScVHM-WOqWeH4QtzPaGw97IeD7SH3xCjra7hHpxoEKL5SVcuA/viewform",
	"https://docs.google.com/forms/d/e/1FAIpQLSfjErECx_Jfvhz1mvVaoOxNmnUhV7OmKo8RTwmFEg8A8vV7zw/viewform",
	"https://docs.google.com/forms/d/e/1FAIpQLSfciqI9X5nkYGHTjG3lB5PHv3cM4QG6-QRel6uOvB3o1IuepA/viewform",
	"https://docs.google.com/forms/d/e/1FAIpQLSflMYIh5slnc-djgUCEF78qbZQWgp5E2CShVdzyY7BvYf5YGA/viewform",
	"https://docs.google.com/forms/d/e/1FAIpQLSe6BXMTrTozJvNgHztY2lXYGvLfPsUa5ccYAS_pWAArAa_Fng/viewform",
	"https://docs.google.com/forms/d/e/1FAIpQLSdmGd2bx9A7V_YQnLwgyP5WGGtuUkxO_cCmkC-m-HR4DEc4bA/viewform",
}

for i = 1, 13 do
	local filename = string.format("chapter-%d.md", i)

	-- Check if the file exists
	local f = io.open(filename, "r")
	if f then
		f:close()

		-- Open file in buffer
		vim.cmd("edit " .. filename)

		-- Get buffer number
		local buf = vim.api.nvim_get_current_buf()

		-- Get number of lines in buffer
		local line_count = vim.api.nvim_buf_line_count(buf)

		-- Append formatted header as the link
		vim.api.nvim_buf_set_lines(buf, line_count, line_count, false, {
			"",
			string.format("### [Chapter %d Quiz](%s)", i, links[i]),
		})

		-- Save and close buffer
		vim.cmd("write")
		vim.cmd("bdelete")
	else
		print("File " .. filename .. " not found, skipping...")
	end
end
