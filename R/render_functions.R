# A function for converting rendered R Markdown to html
# that can be processed by Hugo
hugo_html <- function(rmd_html) {

  # read the rmd html file
  in_html <- readLines(rmd_html)

  # find the <body> tags, and the Rmd rendered title and date
  # add/subtract 1 to exclude lines
  # body_start:title_line captures everything after the <body> tag
  # up to but not including the rendered title (hugo will create this from YAML)
  # date_line:body_end captures everything after the rendered date
  body_start <- which(in_html == "<body>") + 1
  title_line <- which(grepl("<h1 class=\"title", in_html)) - 1
  date_line <- which(grepl("<h4 class=\"date", in_html)) + 1
  body_end <- which(in_html == "</body>") - 1

  # handle missing/multiple title lines
  if (length(date_line) == 0) {
    title_line <- body_start
  } else if (length(date_line) != 1) {
    warning("Multiple title lines detected, using the first")
    title_line <- title_line[1]
  }

  # handle missing/multiple date lines
  if (length(date_line) == 0) {
    date_line <- title_line + 1
  } else if (length(date_line) != 1) {
    warning("Multiple date lines detected, using the first")
    date_line <- date_line[1]
  }

  # replace <pre><code> with hugo highlight shortcode
  out_html <- gsub("<pre class=\"(r)\"><code>", "{{< highlight \\1 >}}", in_html)
  out_html <- gsub("<pre><code>", "{{< highlight txt >}}", out_html)
  out_html <- gsub("</code></pre>", "{{< /highlight >}}", out_html)

  # extract html excluding title/date lines
  # if not next to each other throw an error
  if (date_line - title_line == 3) {
    out_html <- out_html[c(body_start:title_line, date_line:body_end)]
  } else {
    stop(paste(
      "Title and date lines are not next to each other.",
      "This is an unexpected problem, please report it at:",
      "http://github.com/co-analysis/govuk-hugo-r/issues."))
  }

  return(out_html)

}

# render an rmd to a hugo html file
render_rmd <- function(rmd_file,
                       tmp_dir = tempdir(),
                       out_dir = NULL) {

  # extract the YAML front matter from the Rmd
  rmd_yml <- rmarkdown::yaml_front_matter(rmd_file)

  # if defined extract the section from YAML
  if (!is.null(rmd_yml$section)) {
    content_dir <- file.path(rmd_yml$section, "")
  } else {
    content_dir <- ""
  }

  # section as sub-folder of content
  content_dir <- file.path("content", content_dir)

  # remove section from the YAML
  new_yml <- rmd_yml[!(names(rmd_yml) == "section")]

  # add rmarkdown flag to YAML
  new_yml <- append(new_yml, c("rmarkdown" = "true"))

  # copy rmd to a temporary folder
  tmp_rmd <- file.path(tmp_dir, basename(rmd_file))
  file.copy(rmd_file, tmp_rmd, overwrite = TRUE)

  # render the rmd to html
  tmp_content <- rmarkdown::render(
    tmp_rmd,
    output_format =  rmarkdown::html_document(
      theme = NULL, mathjax = NULL, self_contained = TRUE
    ),
    output_file = file.path(tmp_dir, "content.html"),
    quiet = TRUE
  )

  # hugo-ify the html
  tmp_html <- hugo_html(tmp_content)

  # build YAML front-matter for the HTML
  yml_content <- c("---",
                   paste0(names(new_yml), ": ", new_yml),
                   "---")

  # combine the YAML and hugo-ified html
  tmp_out <- file.path(tmp_dir, gsub(".Rmd$|.rmd$", ".html", basename(rmd_file)))
  writeLines(c(yml_content, tmp_html), tmp_out)

  # if a custom output directory is specified use that
  # otherwise use the content_dir
  if (is.null(out_dir)) {

    out_file <- paste0(content_dir, basename(tmp_out))

  } else {

    out_file <- paste0(out_dir, basename(tmp_out))

  }

  file.copy(tmp_out, out_file, overwrite = TRUE)
  message(rmd_file, " hugo-ified as: ", out_file)

}

# bulk convert rmd files in a folder
build_rmd <- function(rmd_folder = "R/Rmd") {

  # get rmd files
  rmd_files <- dir(rmd_folder,
                   pattern = "\\.Rmd",
                   full.names = TRUE,
                   recursive = TRUE)

  # set a common temp directory
  tmp_dir <- tempdir()

  # render files
  for (rmd in rmd_files) {
    render_rmd(rmd, tmp_dir = tmp_dir)
  }

}

# build a hugo site
build_hugo <- function(with_rmd = TRUE,
                       rmd_folder = "R/Rmd") {

  # convert rmds
  if (with_rmd) {
    build_rmd(rmd_folder)
  }

  # call hugo
  system("hugo")

}

# run a hugo server instance
run_hugo_server <- function(drafts = FALSE,
                            build_rmd = FALSE,
                            rmd_folder = "R/Rmd",
                            hugo_opts = FALSE) {

  # determine whether Rmds should be built
  if (build_rmd) {
    build_rmd(rmd_folder)
  }

  # determine if drafts should be served
  if (drafts) {
    hugo_call <- "hugo server -D"
  } else {
    hugo_call <- "hugo server"
  }

  # if supplied add hugo options
  if (!is.null(hugo_opts)) {
    hugo_call <- paste(hugo_call, hugo_opts)
  }

  # call hugo
  system(hugo_call)

}
