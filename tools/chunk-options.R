# These settings control the behavior of all chunks in the novice R materials.
# For example, to generate the lessons with all the output hidden, simply change
# `results` from "markup" to "hide".
# For more information on available chunk options, see
# http://yihui.name/knitr/options#chunk_options

library("knitr")

fix_fig_path <- function(pth) file.path("..", pth)


## We set the path for the figures globally below, so if we want to
## customize it for individual episodes, we can append a prefix to the
## global path. For instance, if we call knitr_fig_path("01-") in the
## first episode of the lesson, it will generate the figures in
## `fig/rmd-01-`
knitr_fig_path <- function(prefix) {
  new_path <- paste0(opts_chunk$get("fig.path"),
                     prefix)
  opts_chunk$set(fig.path = new_path)
}

opts_chunk$set(tidy = FALSE, results = "markup", comment = NA,
               fig.align = "center", fig.path = "images/")

# The hooks below add html tags to the code chunks and their output so that they
# are properly formatted when the site is built.
hook_in <- function(x, options) {
  stringr::str_c("\n\n~~~sourcecode\n",
                 paste0(x, collapse="\n"),
                 "\n~~~\n\n")
}

hook_out <- function(x, options) {
  stringr::str_c("\n\n~~~output\n",
                 paste0(x, collapse="\n"),
                 "\n~~~\n\n")
}

hook_error <- function(x, options) {
  stringr::str_c("\n\n~~~err\n",
                 paste0(x, collapse="\n"),
                 "\n~~~\n\n")
}

knit_hooks$set(source = hook_in, output = hook_out, warning = hook_error,
               error = hook_error, message = hook_out)