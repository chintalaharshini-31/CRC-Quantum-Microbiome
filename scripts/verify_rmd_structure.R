# Lightweight repository integrity checks.
# This does not replace a real R/Python execution run.
root <- normalizePath(".", winslash="/")
rmds <- list.files(".", pattern="\\.Rmd$", recursive=TRUE, full.names=TRUE)
stopifnot(length(rmds) == 14)

for (f in rmds) {
  txt <- paste(readLines(f, warn=FALSE), collapse="\n")
  stopifnot(grepl("toc_float:\\s*true", txt))
  stopifnot(grepl("set.seed\\(1910\\)", txt))
  stopifnot(!grepl("C:/Users/HARSHINI/OneDrive", txt, fixed=TRUE))
  stopifnot(grepl("sessionInfo\\(\\)", txt, fixed=TRUE))
}
message("R Markdown structural checks passed for ", length(rmds), " notebooks.")
