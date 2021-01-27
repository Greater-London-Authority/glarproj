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

  # ensure path exists
  dir.create(path, recursive = TRUE, showWarnings = FALSE)

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
  author <- paste0('person("FirstName", "LastName", email = "@london.gov.uk", username = "',
                   user, '", role = c("aut", "cre")')

  usethis::create_package(path,
                          fields = list(`Authors@R` = author),
                          check_name = FALSE, open = FALSE)

  usethis::proj_set(path)

  # add data folders
  dir.create(path = file.path(path, "data/raw"), recursive = TRUE)
  dir.create(path = file.path(path, "data/intermediate"))
  dir.create(path = file.path(path, "data/processed"))
  file.create(path = file.path(path, "data", "README.Rmd"))

  # add outputs folder
  dir.create(path = file.path(path, "outputs"))

  usethis::use_readme_rmd(open = FALSE)
}
