# QSVC analysis

This directory contains the exploratory quantum-kernel component of the CRC microbiome project.

## Run order

1. `01_QSVC_Data_Preparation.Rmd`
2. `02_QSVC_External_Validation_Prerequisite.Rmd`
3. `QSVC_CRC_vs_Healthy.ipynb`
4. `QSVC_External_Validation_CRC_vs_Healthy.ipynb`
5. `QSVC_External_Validation_CRC_vs_Healthy_with_DeLong.ipynb`

The Python notebooks use the frozen discovery artifacts and the project-wide seed `1910`. The QSVC uses 8 features, `ZZFeatureMap(reps=1, entanglement="linear")`, `FidelityQuantumKernel` with `ComputeUncompute`, exact statevector simulation, and `C=1.0`.

Run the Python environment from the repository root using `requirements.txt`. Do not use the old `%pip install` cell from earlier drafts, because unpinned installation defeats the point of reproducibility.

All important outputs are written to `results/`, figures to `figures/`, model artifacts to `models/`, and final provenance to `results/session_info/`.
