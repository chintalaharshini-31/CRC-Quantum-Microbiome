# CRC Quantum Microbiome: Reproducible Analysis Repository

**Project:** Gut Microbiome-Based Colorectal Cancer Classification: Classical and Quantum-Kernel Approaches.

**Author:** Harshini Chintala  
**Institution:** Malla Reddy University, Hyderabad, Telangana, India

---

## 1. What this repository contains

This repository contains the analysis code and computational artifacts supporting the CRC microbiome manuscript.

### Classical machine learning

The `02 Classical ML/` directory contains the manuscript-relevant R Markdown analyses:

| ID | Notebook | Purpose |
|---|---|---|
| 01 | `01_Binomial_Logistic_Regression.Rmd` | Primary binomial logistic regression |
| 02 | `02_Binary_RandomForest_CRC_vs_Healthy.Rmd` | Primary Random Forest |
| 03 | `03_Binary_SVM_CRC_vs_Healthy.Rmd` | Primary RBF SVM |
| 04 | `04_Binary_XGBoost_CRC_vs_Healthy.Rmd` | Primary XGBoost |
| 05 | `05_Binary_LASSO_Sensitivity.Rmd` | Penalized logistic sensitivity analysis |
| 06 | `06_CLR_Compositional_Sensitivity.Rmd` | CLR compositional sensitivity analysis |
| 07 | `07_Nested_CV_Sensitivity_Audit.Rmd` | Fully nested CV leakage/generalization audit |
| 08 | `08_XGBoost_Forensic_Audit.Rmd` | Forensic audit of the original 48-configuration XGBoost CV result |
| 09 | `09_Feature_Selection_Stability.Rmd` | Boruta feature-selection stability |
| 10 | `10_External_Validation_FengQ_2015.Rmd` | First independent external validation |
| 11 | `11_External_Validation_VogtmannE_2016.Rmd` | Second independent external validation |
| 12 | `12_Model_Comparison.Rmd` | Consolidated model comparison |

### Quantum machine learning

The `03 Quantum_ML/05 QSVC/` directory contains:

- `QSVC_CRC_vs_Healthy.ipynb`  
- `QSVC_External_Validation_CRC_vs_Healthy.ipynb`
- `QSVC_External_Validation_CRC_vs_Healthy_with_DeLong.ipynb`
- `01_QSVC_Data_Preparation.Rmd`
- `02_QSVC_External_Validation_Prerequisite.Rmd`

The quantum notebooks implement the exploratory 8-feature QSVC workflow and its independent external validation, including matched classical baselines and paired DeLong/FDR analysis where applicable.

---

## 2. Fixed scientific settings

The repository is intentionally aligned with the validated manuscript analysis. Do not casually change these settings and then describe the resulting run as the manuscript analysis.

- **Discovery cohort:** ZellerG_2014 from `curatedMetagenomicData`
- **Task:** Healthy vs CRC; adenoma excluded
- **Discovery split:** stratified 80:20, **92 training / 22 held-out test**
- **Project seed:** **1910**
- **Primary Boruta panel:** 20 microbial features
- **External cohorts:** FengQ_2015 and VogtmannE_2016
- **Bootstrap analyses:** B = 2000 where specified by the validated analysis
- **QSVC feature count:** 8
- **QSVC feature map:** ZZFeatureMap, reps = 1, linear entanglement
- **QSVC kernel:** FidelityQuantumKernel with ComputeUncompute and exact statevector simulation
- **QSVC C:** 1.0
- **QSVC angle scaling:** frozen training-derived MinMax scaling to [0, 2π], with no clipping
- **Validated R environment:** R 4.6.0; `curatedMetagenomicData` 3.20.0; key analysis packages are recorded in `renv.lock`
- **Validated Python environment:** Python 3.14.6; Qiskit 2.5.1; Qiskit Machine Learning 0.9.0; Qiskit Aer 0.17.2; scikit-learn 1.9.0; NumPy 2.5.1; pandas 3.0.5; matplotlib 3.11.1; joblib 1.5.3

---

## 3. Reproducibility design

Every R Markdown notebook begins with:

1. a project-root resolver, so it does not depend on a personal OneDrive path;
2. explicit `set.seed(1910)`;
3. standardized knitr options;
4. a documented output location;
5. package checks rather than silent installation of unpinned versions.

The 12 classical R Markdown notebooks save session information under:

```text
02 Classical ML/results/session_info/
```

The two QSVC R Markdown notebooks use the same project-level provenance approach, while the Python QSVC notebooks record Python/platform/package provenance under:

```text
03 Quantum_ML/05 QSVC/results/session_info/
```

---

## 4. R environment

The repository includes `renv.lock`.

From the repository root:

```r
install.packages("renv")
renv::restore()
```

Then open RStudio and knit the desired `.Rmd`.

The notebooks intentionally do **not** install whatever package version happens to be current at knit time. The environment should be restored first. This prevents a future package update from quietly changing the analysis.

> Note: the lockfile records the validated project package versions. If a future environment requires additional dependency resolution, `renv` should be allowed to resolve the transitive dependencies from the lockfile rather than editing the analysis notebooks.

---

## 5. Python environment

Create a clean environment using Python 3.14.6 where available, then:

```bash
python -m venv .venv
```

Activate it and install:

```bash
python -m pip install --upgrade pip
python -m pip install -r requirements.txt
```

Register/select the environment as the Jupyter kernel, then run the QSVC notebooks from:

```text
03 Quantum_ML/05 QSVC/
```

Do not replace the pinned Qiskit versions for a manuscript-reproduction run.

---

## 6. Running the R Markdown notebooks

The notebooks are designed for normal RStudio knitting.

Each knitted HTML has:

- a **floating table of contents** on the left;
- numbered sections;
- collapsible source code;
- readable tables;
- centered high-resolution figures;
- explicit explanatory text before analysis blocks;
- saved machine-readable outputs;
- a final session-information section.

To render all R Markdown notebooks from the repository root:

```r
source("scripts/render_all_rmds.R")
```

The script renders each notebook independently in a fresh environment.

---

## 7. Outputs

Analysis outputs are kept alongside the validated project structure under:

```text
02 Classical ML/results/
03 Quantum_ML/05 QSVC/results/
```

Important output categories include:

- model metrics and confidence intervals;
- predictions;
- ROC coordinates;
- calibration outputs;
- feature-selection stability;
- nested-CV records;
- XGBoost forensic audit files;
- CLR zero/pseudocount audits;
- LASSO tuning and coefficient files;
- QSVC reproducibility gates;
- QSVC external-validation metrics;
- paired DeLong/FDR results;
- figures;
- model/scaler artifacts;
- session information.

The repository does not contain the raw source microbiome cohort as a copied dataset. The R pipeline retrieves the public `curatedMetagenomicData` resource as documented in the manuscript.

---

## 8. What reproducibility means here

A knitted HTML file is a report, not proof by itself.

The stronger reproducibility chain is:

```text
Pinned environment
       ↓
Fixed seed + fixed inputs
       ↓
Rmd / Python notebook
       ↓
Analysis execution
       ↓
Saved tables + figures + models
       ↓
Session / package provenance
       ↓
Knitted human-readable report
```

For a true clean-room reproduction, a user should restore the environments, run the notebooks, and compare the regenerated outputs with the saved validated artifacts.

---

## 9. Important scope notes

- The primary classical models use the validated 20-feature Boruta representation.
- The QSVC is an exploratory quantum-kernel comparison using a training-data-ranked top-8 subset for computational feasibility.
- The QSVC is therefore not a claim that an 8-feature quantum model outperforms the full 20-feature classical models.
- External validation evaluates frozen discovery-trained representations/models and does not refit them on external cohorts.
- The XGBoost forensic audit explains the original apparent CV AUC = 1.00 result as selection optimism from choosing the maximum boosting-round performance on the same CV trajectory, supported by an independent manual out-of-fold rerun.
- Missing external metadata are not fabricated. Where stage, BMI, sequencing platform, treatment status, or collection details were not part of the validated extracted artifacts, the manuscript and repository do not invent them.

---





