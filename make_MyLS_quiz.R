library(here)
lec <- readLines(commandArgs(trailingOnly = TRUE)[1])

make_one_q <- function(q_number, ans) {
    if (ans %in% LETTERS) {
        ans <- which(ans == LETTERS)
    }

    sprintf(
        "NewQuestion,MC,,,
Title,Q%d,,,\nQuestionText,Q%d,,,\nPoints,1,,,
Option,%d,A,,\nOption,%d,B,,\nOption,%d,C,,\nOption,%d,D,,\n",
        q_number, q_number,
        100 * (ans == 1), 100 * (ans == 2),
        100 * (ans == 3), 100 * (ans == 4)
        )
}

make_all_qs <- function(anss) {
    if (length(anss) == 1) {
        anss <- strsplit(anss, "")[[1]]
    }
    paste(sapply(seq_along(anss),
        function(i) {
            make_one_q(i, anss[i])
        }), collapse = "")
}

ans <- lec[grepl("<!--- [ABCDabcd] --->", lec)] |>
    gsub(pattern = "<!--- (.*) --->", "\\1", x = _) |>
    paste0(collapse = "")

print(make_all_qs(ans))
