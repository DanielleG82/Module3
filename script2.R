# 1. You can also compile the report through the render function from the rmarkdown package
rmarkdown::render("Steak_Article_param.Rmd",
                  params = list(region = "Mountain"))





# 2a. R code to create the custom function
#       When you'll run the function, you just need to specify which region you want as an argument
render_report <-function(regionvar){
        template <-"Steak_Article_param.Rmd"
        outfile <-sprintf("steakArticle_%s.html",regionvar)
        parameters <-list(region = regionvar)
        rmarkdown::render(template,
                          output_file=outfile,
                          params=parameters)
        invisible(TRUE)
}

# 2b. Use the custom function
render_report("Pacific")





# 3. R code to use the custom function with purrr for batch process
#       Creates a report for each region
library(purrr)
params_list <- list(list("East North Central",
                         "East South Central", "Middle Atlantic",
                         "Mountain", "New England", "Pacific",
                         "South Atlantic", "West North Central",
                         "West South Central"))
purrr::pmap(params_list,render_report)