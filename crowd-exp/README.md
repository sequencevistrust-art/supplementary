This folder contains the data and results for the two crowd experiments described in the paper.

## Study 1: Accurate Insights

All AI-generated insights are correct. Compares three explanation conditions: subsentence-level citations (with-citation), code snippets (with-code), and no citations or code (without-explanation).

- `study 1/screenshots` - screenshots of the study interface for the three conditions
- `study 1/measures.csv` — Per-participant measures (n=90, 30 per condition). Columns: subjectID, condition, accuracy (average perceived accuracy across all 10 statements), reliability (perceived overall reliability), understanding (system understanding).
- `study 1/analysis.R` — Kruskal-Wallis tests for each measure, followed by pairwise Wilcoxon rank-sum tests with Holm-Bonferroni correction.

## Study 2: Inaccurate Insights

Four of ten AI-generated insights contain errors. Same three explanation conditions. In the citation condition, inconsistencies between stated claims and referenced results are highlighted.

- `study 2/screenshots` - screenshots of the study interface for the three conditions
- `study 2/measures.csv` — Per-participant measures (n=90, 30 per condition). Columns: same as Study 1, except accuracy is averaged over only the 4 erroneous statements (original indices 1, 4, 7, 8).
- `study 2/analysis.R` — Same statistical tests as Study 1.

## Running

In R console:

```r
install.packages("coin")  # first time only
setwd("/path/to/crowd-exp/study 1")
source("analysis.R")
setwd("/path/to/crowd-exp/study 2")
source("analysis.R")
```
