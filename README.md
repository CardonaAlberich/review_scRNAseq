# Figure Reproducibility for "Elucidating the cellular dynamics of the brain with single-cell RNA sequencing"

This repository contains the R code used to generate the figure published in:

**Elucidating the cellular dynamics of the brain with single-cell RNA sequencing**  
*RNA Biology*, Volume 18, 2021  
https://doi.org/10.1080/15476286.2020.1870362

---

## Repository Contents

- `R_script_fig2.R`: Main R script that processes data and generates the figure  
- `table for fig.xlsx/`: Input data used for the figure  
- `scripts_for_review_figures`: RStudio project file for easy setup  
- `.gitignore`: Specifies files and folders ignored by Git  
- `README.md`: This file


---

## Requirements
 
It requires the following R packages:

```r
install.packages(c("ggplot2", "dplyr", "readr"))