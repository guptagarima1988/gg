# test-ge_unique_key.R

library(testthat)

source("R/ge_unique_key.R")

test_that("ge_unique_key detects a valid key", {
  df <- data.frame(id = 1:5, code = letters[1:5])
  expect_true(ge_unique_key(df, c("id", "code")))
})

test_that("ge_unique_key detects non-uniqueness", {
  df <- data.frame(id = c(1, 2, 2), code = c("a", "b", "b"))
  expect_false(suppressWarnings(ge_unique_key(df, c("id", "code"))))
})

test_that("ge_unique_key detects NAs in key", {
  df <- data.frame(id = c(1, 2, NA), code = c("a", "b", "c"))
  expect_false(suppressWarnings(ge_unique_key(df, c("id", "code"))))
})

test_that("ge_unique_key detects both NA and duplicates", {
  df <- data.frame(id = c(1, 2, NA, 2), code = c("a", "b", "c", "b"))
  expect_false(suppressWarnings(ge_unique_key(df, c("id", "code"))))
})

test_that("ge_unique_key message output can be suppressed", {
  df <- data.frame(id = 1:3, x = letters[1:3])
  result <- suppressMessages(ge_unique_key(df, c("id", "x")))
  expect_true(result)
})
