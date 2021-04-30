# Author: Luna Lunapiena
# Author Site: https://lunacodesdesign.com
# License: GPL 3+

require 'fileutils'
require 'date'

def canonical_form(str)
	str.tr('^0-9', '')
end

def generate_year_files(year)
	yaml_div = "---"
	layout = "layout: year"
	permalink = "permalink: /#{year}/"
	redirect = "redirect_from:\n - /#{year}"
	title = "title: Archive for #{year} Archives"
	year_str = "year: '#{year}'"

	lines = [yaml_div, layout, permalink, redirect, title, year_str, yaml_div]
	return lines
end

def generate_month_files(year, month)
	yaml_div = "---"
	layout = "layout: month"
	permalink = "permalink: /#{year}/#{month}/"
	redirect = "redirect_from:\n - /#{year}/#{month}"

	month_sing = month.dup
	month_sing.sub!(/^0/, "")

	# (month_sing != month) ? (redirect += "\n - /#{year}/#{month_sing}") : ''

	if (month_sing != month)
		redirect += "\n - /#{year}/#{month_sing}"
	end

	year_str = "year: '#{year}'"

	month_str = "month: '#{month}'"
	month_name = Date::MONTHNAMES[month.to_i]
	month_name_str = "month_name: " +  month_name.to_s

	title = "title: #{month_name} #{year} Archives"

	lines = [yaml_div, layout, permalink, redirect, title, year_str, month_str, month_name_str, yaml_div]
	return lines
end

def generate_day_files(year, month, day)
	yaml_div = "---"
	layout = "layout: day"

	permalink = "permalink: /#{year}/#{month}/#{day}/"
	redirect = "redirect_from:\n - /#{year}/#{month}/#{day}"

	month_sing = month.dup
	month_sing.sub!(/^0/, "")
	month_identical = (month_sing == month)

	day_sing = day.dup
	day_sing.sub!(/^0/, "")
	day_identical = (day_sing == day)

	if (month_identical == false)
		# If only Month has a leading zero
		redirect += "\n - /#{year}/#{month_sing}/#{day}"
		if (day_identical == false)
			# Month & Day have leading zero
			redirect += "\n - /#{year}/#{month_sing}/#{day_sing}"
		end
	end

	if (day_identical == false)
		# Only day has leading zero
		redirect += "\n - /#{year}/#{month}/#{day_sing}"
	end

	year_str = "year: '#{year}'"

	month_str = "month: '#{month}'"
	month_name = Date::MONTHNAMES[month.to_i]
	month_name_str = "month_name: " +  month_name.to_s

	day_str = "day: '#{day}'"

	title = "title: #{month_name} #{day}, #{year} Archives"

	lines = [yaml_div, layout, permalink, redirect, title, year_str, month_str, month_name_str, day_str, yaml_div]
	return lines
end


if Dir.exist?('../collections/_posts/') || Dir.exist?('collections/_posts')
	files = Dir['collections/_posts/*']

	files.each do |item|
		str = canonical_form(item)
		y = str.slice(0..3).to_str
		m = str.slice(4..5).to_str
		d = str.slice(6..8).to_str

		year_dir = "collections/_blog_archives/" + y

		year_file = year_dir + "/index.html"

		month_dir = "collections/_blog_archives/" + y + "/" + m

		month_fname = month_dir + "/index.html"

		day_dir = "collections/_blog_archives/" + y + "/" + m + "/" + d
		day_fname = day_dir + "/index.html"
		# puts "day_fname: #{day_fname}"


		FileUtils.mkdir_p year_dir
		lines = generate_year_files(y)

		File.open(year_file, "w", universal_newline: true) do |f|
			f.puts(lines)
		end

		FileUtils.mkdir_p month_dir
		lines = generate_month_files(y, m)

		File.open(month_fname, "w", universal_newline: true) do |f|
			f.puts(lines)
		end

		FileUtils.mkdir_p day_dir
		lines = generate_day_files(y, m, d)

		File.open(day_fname, "w", universal_newline: true) do |f|
			f.puts(lines)
		end

	end

else
	puts "_plugins/archives_generator.rb: Error - Unable to find _posts directory. Archive pages will not be generated"
end

# puts "archives_generator.rb has finished"
