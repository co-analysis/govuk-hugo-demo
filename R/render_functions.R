

render_rmd <- function(rmd_file, tmp_dir = tempdir()) {

  rmd_yml <- rmarkdown::yaml_front_matter(rmd_file)

  if (!is.null(rmd_yml$section)) {
    content_dir <- file.path(rmd_yml$section, "")
  } else {
    content_dir <- ""
  }

  content_dir <- file.path("content", content_dir)

  new_yml <- rmd_yml[!(names(rmd_yml) == "section")]

  tmp_rmd <- file.path(tmp_dir, basename(rmd_file))

  file.copy(rmd_file, tmp_rmd, overwrite = TRUE)

  tmp_content <- rmarkdown::render(
    tmp_rmd,
    output_format =  rmarkdown::html_fragment(
      df_print = knitr::kable
    ),
    output_file = file.path(tmp_dir, "content.html")
  )

  yml_content <- c("---",
                   paste0(names(new_yml), ": ", new_yml),
                   "---\n\n")

  tmp_out <- file.path(tmp_dir, gsub(".Rmd$|.rmd$", ".html", basename(rmd_file)))

  writeLines(yml_content, tmp_out)

  file.append(tmp_out, tmp_content)

  file.copy(tmp_out, file.path(content_dir, basename(tmp_out)), overwrite = TRUE)

}


build_hugo <- function(with_rmd = TRUE, rmd_folder = "R/Rmd") {

  if (with_rmd) {

    rmd_files <- dir("R/Rmd", full.names = TRUE)

    tmp_dir <- tempdir()

    for (rmd in rmd_files) {
      render_rmd(rmd, tmp_dir = tmp_dir)
    }

  }

  system("hugo")
}

run_hugo_server <- function(drafts = FALSE) {

  if (drafts) {
    hugo_call <- "hugo server -D"
  } else {
    hugo_call <- "hugo server"
  }

  system(hugo_call)

}
