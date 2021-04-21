import glob
import os
import calendar
# os.chdir("_posts")

# for file in glob.glob("*"):
    # print(file)

mylist = os.listdir(path='_posts')
# print(mylist)

try:
    os.makedirs("get2016")
except FileExistsError:
    # directory already exists
    pass

# years_arr = []
# months = []
# days = []
# y=""
for file in mylist:
    y = file[0:4]
    m = file[6:7]
    d = file[9:10]

    if int(m) >= 1:
        m2 = "0" + m
        # print(m2)

    if int(d) >= 1:
        d2 = "0" + d
        # print(d)

    years = '{}'.format(y)
    months = '{}/{}'.format(y, m2)
    days = '{}/{}/{}'.format(y, m2, d2)
    month_name = calendar.month_name[int(m)]
    print(month_name)
    # print(years)
    # print(months)

    try:
        os.makedirs(years)
    except FileExistsError:
        # directory already exists
        pass

    try:
        os.makedirs(months)
    except FileExistsError:
        # directory already exists
        pass

    try:
        os.makedirs(days)
    except FileExistsError:
        # directory already exists
        pass

    year_file = years + "/index.html"
    # print(year_file)

    # Generate Year Archive Pages
    yaml_open = "---"
    layout = "layout: year"
    permalink = 'permalink: "' + years + '"'
    redirect = "redirect_from: " + years
    title = 'title: ' + years
    year = "year: " + years
    yaml_close = "---"
    content = '<h1 class="archive-title">Archive for ' + years + "</h1>"
    lines = '{}\n{}\n{}\n{}\n{}\n{}\n{}\n\n{}\n'.format(yaml_open, layout, permalink, redirect, title, year, yaml_close, content)

    yf = open(year_file, 'w+')
    yf.write(lines)
    yf.close()

    # Generate Months Archive Pages
    month_file = months + "/index.html"
    # print(month_file)

    yaml_open = "---"
    layout = "layout: month"
    permalink = 'permalink: ' + months
    redirect = "redirect_from: " + months
    title = "title: Archive for " + months
    year = "year: " + years
    month = "month: " + '"' + m2 + '"'
    month_str = "month_name: " + '"' + month_name + '"'
    yaml_close = "---"
    content = '<h1 class="archive-title">Archive for ' + month_name + " " + years + "</h1>"
    lines = '{}\n{}\n{}\n{}\n{}\n{}\n{}\n{}\n{}\n\n{}\n'.format(yaml_open, layout, permalink, redirect, title, year, month, month_str, yaml_close, content)

    mf = open(month_file, 'w+')
    mf.write(lines)
    mf.close()

    # # Generate Days Archive Pages
    # day_file = days + "/index.html"
    # print(day_file)

    # yaml_open = "---"
    # # layout = "layout: day"
    # layout = "layout: month"
    # permalink = 'permalink: ' + days
    # redirect = "redirect_from: " + days
    # title = "title: Archive for " + days
    # year = "year: " + years
    # month = "month: " + '"' + m2 + '"'
    # day = "day: " + '"' + days + '"'
    # yaml_close = "---"
    # content = '<h1 class="archive-title">Archive for ' + month_name + " " + d + ", " + years + "</h1>"
    # lines = '{}\n{}\n{}\n{}\n{}\n{}\n{}\n{}\n\n{}\n'.format(yaml_open, layout, permalink, redirect, title, year, day, yaml_close, content)

    # df = open(day_file, 'w+')
    # df.write(lines)
    # df.close()
