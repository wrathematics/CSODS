#!/usr/bin/Rscript

to_date = function(d) as.Date(d, format="%Y/%m/%d")

start = "2022/8/25"
end = "2022/12/6"
skip = c("2022/10/6", "2022/11/24")

start = to_date(start)
end = to_date(end)
# dates = c(start, start + 5)
dates = start
while (TRUE)
{
  date = dates[length(dates)]
  if (date > end)
    break
  dates = c(dates, date + 5, date + 7)
}

dates = dates[-sapply(to_date(skip), function(s) which (s == dates))]
dates = dates[dates <= end]



template_file = "includes/template.Rmd"
template = readLines(template_file)
title_ind = grep("^title: ", template)
date_ind = grep("^date: ", template)
for (i in 1:length(dates))
{
  date = dates[i]
  template[title_ind] = paste("title: Lecture", i, "-")
  template[date_ind] = paste0("date: \"", date, "\"")
  if (i < 10) p = "0" else p = ""
  writeLines(text=template, con=paste0("lecture", p, i, ".Rmd"))
}
