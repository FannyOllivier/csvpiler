
# csvpiler

<!-- badges: start -->
![GitHub release](https://img.shields.io/github/v/release/FannyOllivier/csvpiler)
<!-- badges: end -->

The goal of csvpiler is to pile up csv files sharing the same columns.

## Installation

You can install the development version of csvpiler from [GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("FannyOllivier/csvpiler")

# or
devtools::install_github("FannyOllivier/csvpiler")
```

## Examples
Create a single CSV file by combining all CSV files from a folder named "FichiersDonnees". No extra column added. The resulting file is saved in the same folder and a success message is printed in the console.

``` r
library(csvpiler)
## pile_csv_min(dossier="C:\\Users\\FichiersDonnees", sortie="global.csv")
```

Create a single CSV file by combining all CSV files from a folder named "FichiersDonnees". Two extra columns added: ID and source. The first six characters of each file name are used as IDs (1st column). The file name is added in the source column (last column). The resulting file is saved in the same folder and a success message is printed in the console. 

``` r
library(csvpiler)
## pile_csv(dossier="C:\\Users\\FichiersDonnees", sortie="global.csv", x=6)
```


