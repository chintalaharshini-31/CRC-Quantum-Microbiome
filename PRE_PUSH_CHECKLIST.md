# Pre-push reproducibility checklist

- [ ] Restore R environment with `renv::restore()`.
- [ ] Create the pinned Python environment from `requirements.txt`.
- [ ] Knit all 14 Rmd notebooks.
- [ ] Run all 3 QSVC Python notebooks.
- [ ] Confirm no personal paths appear in code.
- [ ] Confirm session-information files are generated.
- [ ] Compare regenerated headline metrics with the validated manuscript artifacts.
- [ ] Inspect HTML navigation, figures, tables, and warnings.
- [ ] Commit the repository only after the clean run.
- [ ] Add the final GitHub URL to the manuscript.
