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
  permalink = 'permalink: /' + year + "/"
  redirect = "redirect_from: " +  '"/' + year + '"'
  # redirect = ""
  title = 'title: ' + year
  year_str = "year: " + year
  yaml_close = "---"
  content = "\n" + '<h1 class="archive-title">Archive for ' + year + "</h1>"

  lines = [yaml_open, layout, permalink, redirect, title, year_str, yaml_close, content]
  return lines
end

def generate_month_files month
  yaml_open = "---"
  layout = "layout: month"
  permalink = 'permalink: /' + month + "/"
  redirect = "redirect_from: " + '"' + month + '"'
  # redirect = ""
  title = 'title: Archive For ' + month
  year_str = "year: " + month.slice(0..3)
  month_num = month.slice(-2..)
  month_str = "month: " + month_num
  month_name = Date::MONTHNAMES[month_num.to_i]
  month_name_str = "month_name: " +  month_name.to_s
  yaml_close = "---"
  content = "\n" + '<h1 class="archive-title">Archive for ' + month_name + year_str + "</h1>"

  lines = [yaml_open, layout, permalink, redirect, title, year_str, month_str, month_name_str, yaml_close, content]
  return lines
end

if Dir.exist?('../_posts/') || Dir.exist?('_posts')
  files = Dir['_posts/*']

  files.each do |item|
    str = canonical_form(item)

    y = str.slice(0..3)
    m = str.slice(4..5)
    # d = str.slice(6..8)

    year = y.to_str
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
  puts "_posts directory doesn't exist"
end
