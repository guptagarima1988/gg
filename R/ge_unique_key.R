#' Check for a unique and non-null key in a data frame
#'
#' This function verifies that a given set of columns forms a unique key for a data frame.
#' It checks two conditions:
#' 1. That there are no `NA` values in the key columns.
#' 2. That the combination of key columns is unique across all rows.
#'
#' It prints informative messages to the console (via `message()`), but is silent when used
#' with `suppressMessages()`. It returns `TRUE` invisibly if both conditions are met,
#' and `FALSE` otherwise (with a warning).
#'
#' @param df A data frame.
#' @param key A character vector of column names to be tested as a composite unique key.
#'
#' @return Invisibly returns `TRUE` if the key is unique and non-null, otherwise `FALSE`.
#'         Also prints summary messages and issues warnings if the check fails.
#'
#' @examples
#' df <- data.frame(a = 1:3, b = c("x", "y", "z"))
#' ge_unique_key(df, c("a", "b"))  # Should return TRUE
#'
#' df2 <- rbind(df, df[1, ])
#' ge_unique_key(df2, c("a", "b"))  # Should return FALSE with warning
#'
#' @export
ge_unique_key <- function(df, key) {
  stopifnot(is.data.frame(df))
  stopifnot(all(key %in% names(df)))

  n_total <- nrow(df)
  n_na_rows <- df |>
    dplyr::select(dplyr::all_of(key)) |>
    dplyr::filter(dplyr::if_any(dplyr::everything(), is.na)) |>
    nrow()

  n_distinct <- df |>
    dplyr::select(dplyr::all_of(key)) |>
    dplyr::distinct() |>
    nrow()

  message("🧪 Good Enough unique key check:")
  message("  - Total rows: ", n_total)
  message("  - Rows with NA in key: ", n_na_rows)
  message("  - Distinct key combinations: ", n_distinct)

  if (n_na_rows > 0) {
    warning("\n❌ Some rows have NA in key columns.")
  }

  if (n_distinct != n_total) {
    warning("\n❌ Key is not unique: ", n_total - n_distinct, " duplicates found.")
    return(invisible(FALSE))
  }

  if (n_na_rows == 0 && n_distinct == n_total) {
    message("\n✅ Key is unique and non-null.")
    return(invisible(TRUE))
  }

  invisible(FALSE)
}
