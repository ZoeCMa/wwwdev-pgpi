# Author: Luna Lunapiena
# Author Site: https://lunacodesdesign.com
# License: GPL 3+

require 'fileutils'
require 'date'

def canonical_form str
  str.tr('^0-9', '')
end

def generate_year_files year
  yaml_open = "---"
  layout = "layout: year"
  permalink = "permalink: /#{year}/"
  redirect = "redirect_from: /#{year}"
  title = "title: Archive for #{year} Archives"
  year_str = "year: '#{year}'"
  yaml_close = "---"

  lines = [yaml_open, layout, permalink, redirect, title, year_str, yaml_close]
  return lines
end

def generate_month_files month
  yaml_open = "---"
  layout = "layout: month"
  permalink = "permalink: /#{month}/"
  redirect = "redirect_from: #{month}"
  # redirect = ""
  year_num = month.slice(0..3)
  year_str = "year: '#{year_num}'"
  month_num = month.slice(-2..)
  # month_str = "month: " + '"' + month_num + '"'
  month_str = "month: '#{month_num}'"
  month_name = Date::MONTHNAMES[month_num.to_i]
  month_name_str = "month_name: " +  month_name.to_s
  title = "title: #{month_name} #{year_num} Archives"
  yaml_close = "---"

  lines = [yaml_open, layout, permalink, redirect, title, year_str, month_str, month_name_str, yaml_close]
  return lines
end

# puts "archives_generator.rb is running"

if Dir.exist?('../collections/_posts/') || Dir.exist?('collections/_posts')
  # puts "Dir Exists"
  files = Dir['collections/_posts/*']
  # puts "#{files}"

  files.each do |item|
    str = canonical_form(item)
    y = str.slice(0..3).to_str
    m = str.slice(4..5).to_str
    # d = str.slice(6..8)

    year = y
    y_file = year + ".html"
    y_index = year + "/index.html"
    month = y + "/" + m
    m_index = month + "/index.html"

    FileUtils.mkdir_p year
    lines = generate_year_files(year)

    File.open(y_index, "w") do |f|
      f.puts(lines)
    end

    FileUtils.mkdir_p month
    lines = generate_month_files(month)

    File.open(m_index, "w") do |f|
      f.puts(lines)
    end

  end

else
  puts "_plugins/archives_generator.rb: Error - Unable to find _posts directory. Archive pages will not be generated"
end

# puts "archives_generator.rb has finished"
