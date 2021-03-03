#' @title GLA R Project Template
#' @description Function used by RStudio to create a project/package in the
#' GLA template
#' @param path Path where project should be created
#' @param ... Other parameters supplied by RStudio UI
#' @return A new project session will begin
#' @details This function will be called when the user invokes the New Project
#' wizard using the project template defined in the template file
#' at: inst/rstudio/templates/project/project_template.dcf
#' @rdname project_template
#' @export
#' @import usethis
project_template <- function(path, ...) {

  # collect inputs
  dots <- list(...)
  text <- lapply(seq_along(dots), function(i) {
    key <- names(dots)[[i]]
    val <- dots[[i]]
    paste0(key, ": ", val)
  })

  # user set up
  user <- Sys.getenv("USERNAME")

  # create basic package structure
  author <- paste('person(given = "First"',
                  'family = "Last"',
                  'role = c("aut", "cre")',
                  'email = "first.last@london.gov.uk"',
                  paste0('comment = c(username = "', user, '"))'),
                  sep = ", ")

  usethis::create_package(path,
                          fields = list(`Authors@R` = author),
                          check_name = FALSE, open = FALSE)

  usethis::local_project(path)

  usethis::use_readme_rmd(open = FALSE)

  # add data and output dirs
  dirs <- c("data/raw", "data/intermediate", "data/processed", "outputs")
  for (dir in dirs) {
    usethis::use_directory(dir)
  }
  # Add a data readme
  file.create("data/README.Rmd")

}
