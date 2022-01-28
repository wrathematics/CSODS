#!/usr/bin/Rscript

to_date = function(d) as.Date(d, format="%m/%d/%Y")

start = "1/25/2022"
end = "5/10/2022"
skip = c("3/15/2022", "3/17/2022", "4/14/2022")

start = to_date(start)
end = to_date(end)
dates = c(start, start + 2)
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
