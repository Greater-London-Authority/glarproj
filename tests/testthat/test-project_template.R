test_that("Basic functionality", {
  test_proj_name = "glarproj_testing_proj"
  expected_dirs <- c("data", "data/raw", "data/intermediate",
                     "data/processed", "outputs", "R")
  expected_files <- c(".gitignore", ".Rbuildignore", "DESCRIPTION",
                      paste0(test_proj_name, ".Rproj"),
                      "NAMESPACE", "README.Rmd", "data/README.Rmd")
  project_template(path = file.path(tempdir(), test_proj_name))
  for (dir in expected_dirs) {
    expect(dir.exists(file.path(tempdir(), test_proj_name, dir)),
           failure_message = paste(dir, "directory has not been created"))
  }
  for (file in expected_files) {
    expect(file.exists(file.path(tempdir(), test_proj_name, file)),
           failure_message = paste(file, "file has not been created"))
  }
  unlink(file.path(tempdir(), test_proj_name), recursive = TRUE)
}
)
