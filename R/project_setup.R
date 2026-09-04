# Project-wide setup helpers
# This file contains only path/reproducibility utilities. Analysis code remains in each notebook.

find_project_root <- function(start = getwd()) {
  current <- normalizePath(start, winslash = "/", mustWork = TRUE)
  repeat {
    if (file.exists(file.path(current, "enhanced_classical_ml_pipeline.Rproj")) ||
        dir.exists(file.path(current, "02 Classical ML"))) {
      return(current)
    }
    parent <- dirname(current)
    if (identical(parent, current)) break
    current <- parent
  }
  stop(
    "Project root not found. Knit/run this notebook from inside the ",
    "CRC_Quantum_Microbiome GitHub repository."
  )
}

project_root <- find_project_root()
classical_dir <- file.path(project_root, "02 Classical ML")
quantum_dir <- file.path(project_root, "03 Quantum_ML", "05 QSVC")
set.seed(1910)

dir.create(file.path(classical_dir, "results", "session_info"), recursive = TRUE, showWarnings = FALSE)
dir.create(file.path(quantum_dir, "results", "session_info"), recursive = TRUE, showWarnings = FALSE)

write_session_info <- function(path) {
  dir.create(dirname(path), recursive = TRUE, showWarnings = FALSE)
  capture.output(sessionInfo(), file = path)
  invisible(path)
}
