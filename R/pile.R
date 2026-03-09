
#' Pile up csv files with the same columns
#'
#' @param dossier A folder containing the csv files to pile up, e.g., "C:\\Users\\FichierDonnees".
#' @param sortie A file name for the resulting csv file.
#' @param x A number : number of characters from the csv file names which will be used to form the ID.
#' @returns A csv file with all the rows of the csv files from the folder.
#' @export
pile_csv<- function(dossier, x, sortie="resultat.csv") {
  fichiers<-list.files(path=dossier, pattern="\\.csv$", full.names = TRUE)
  if (length(fichiers)==0) stop("No csv file found in this folder")

  fichiers<-fichiers[basename(fichiers) != sortie]
  liste_df<- list()

  for(f in fichiers){
    tmp<-utils::read.csv(f, header=TRUE)
    nom_f<- basename(f)
    tmp$ID<- substr(nom_f,1,x)
    tmp$source<- nom_f

    liste_df[[length(liste_df)+1]]<- tmp
  }


  tout<- dplyr::bind_rows(liste_df)
  tout<-dplyr::relocate(tout, "ID", .before=1) #met ID en premier

  utils::write.csv(tout, file=file.path(dossier, sortie), row.names = FALSE)
  message("File successfully created: ", file.path(dossier, sortie))
  invisible(tout)

}


#' pile_csv_min: Pile up csv files with the same columns : minimal function, no column added
#'
#' @param dossier A folder containing the csv files to pile up, e.g., "C:\\Users\\FichierDonnees".
#' @param sortie A file name for the resulting csv file.
#' @returns A csv file with all the rows of the csv files from the folder.
#' @export
pile_csv_min <- function(dossier, sortie = "resultat.csv") {

  fichiers <- list.files(path = dossier, pattern = "\\.csv$", full.names = TRUE)

  if (length(fichiers) == 0) {
    stop("No csv file found in this folder")
  }



  liste_df <- lapply(fichiers, function(f) {
    utils::read.csv(f, header = TRUE)
  })

  tout <- dplyr::bind_rows(liste_df)

  utils::write.csv(tout, file = file.path(dossier, sortie), row.names = FALSE)

  message("File successfully created: ", file.path(dossier, sortie))

  invisible(tout)
}
