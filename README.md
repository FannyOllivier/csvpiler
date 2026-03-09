
# csvpiler

<!-- badges: start -->
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

## Example

This is a basic example: create a single CSV file by combining all CSV files from a folder named "FichiersDonnees". The first six characters of each file name are used as IDs. The resulting file is saved in the same folder and a success message is printed in the console. 

``` r
library(csvpiler)
## pile_csv(dossier="C:\\Users\\FichiersDonnees", sortie="global.csv", x=6)
```


