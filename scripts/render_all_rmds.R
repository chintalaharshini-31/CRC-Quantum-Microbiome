# Render every R Markdown notebook in the repository.
# Run from the repository root in an R/RStudio session after renv::restore().
required <- c("rmarkdown", "knitr")
missing <- required[!vapply(required, requireNamespace, logical(1), quietly = TRUE)]
if (length(missing)) stop("Missing package(s): ", paste(missing, collapse=", "))

files <- list.files(".", pattern="\\.Rmd$", recursive=TRUE, full.names=TRUE)
files <- files[!grepl("renv|\\.git", files)]
for (f in files) {
  message("\n=== Rendering: ", f, " ===")
  rmarkdown::render(
    input = f,
    output_format = "html_document",
    envir = new.env(parent = globalenv())
  )
}
message("\nAll Rmd render jobs completed.")
