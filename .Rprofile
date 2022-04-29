message("Hello !")
message("Welcome to the workshop.")

if (grepl("Linux stats3", system("uname -a", intern=T))) {
  if (R.version$version.string != "R version 3.5.3 (2019-03-11)"){
    stop("Please choose R version 3.5.3 using the dropdown menu in the top right corner of RStudio Server.")
  } else {
    message("R version correct: ", R.version$version.string, "\n")
#    lib.dir <- "/homes/homedirs18/sghms/bms/shares/bdib/BDiB_2020-21/R/packages_R_3.5.3"
    lib.dir <- "/homedirs8/workshop/BDiB-2022/R/packages_R_3.5.3"
    if (!file.exists(lib.dir)) {
      message(paste("Library folder not found (.Rprofile)"))
    } else {
      .libPaths(c(lib.dir, .libPaths()))
      i <- grep("BDiB-2022", .libPaths())
      j <- grep("x86_64-pc-linux-gnu-library", .libPaths())
      k <- grep("lib64/R/library", .libPaths())
      x <- .libPaths()[c(i,j,k)]
      .libPaths(x) # set paths in new order
      message("\nLibrary paths:")
      print(.libPaths())
      rm(i, j, k, x)
    }
    rm(lib.dir)
  }
} else {
  stop("For this session it is preferred if you use RStudio Server Pro at https://stats3.sgul.ac.uk/rstudio/")
}

pacman::p_unload(package=c("all")) # unload packages
library(rmarkdown)
library(esquisse)

message("\nSession info:")
gsub("^[ \t]+|\\{.*\\}|\\\\[a-zA-Z]+", "", utils::toLatex(utils::sessionInfo(), locale = FALSE))

