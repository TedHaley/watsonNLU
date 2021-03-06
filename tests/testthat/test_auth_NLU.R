# auth_NLU tests
#
# Testing includes:
#

library(watsonNLU)
context("Keyword Relevance")

# username <- readRDS("username.rds")
# password <- readRDS("password.rds")

credentials <- readRDS("credentials.rds")
username <- credentials$username
password <- credentials$password

test_that("Check error handling for missing input", {

  expect_error(with_config({auth_NLU(username = NULL, password = password)}, override = TRUE),
               "Please specify a valid username and password combination as string arguments.")
})

test_that("Check error handling for non-character input", {
  expect_error(auth_NLU(username = username, password = as.factor(password)),
               "Please specify a valid username and password combination as string arguments.")
})

# can't clear cache

# test_that("Check error handling for if valid credential authorization works.", {
#   cache <- ".httr-oauth"
#   if (file.exists(cache)) file.remove(cache)
#   # revoke_all()
#   set_config(authenticate(username, "XXXXX"), override = TRUE)
#   with_config(authenticate(username, "XXXXX"), expect_equal(auth_NLU(username = username, password = "XXXXX"),
#                "Invalid credentials provided."), override = TRUE)
#   reset_config()
# })

test_that("Check if valid credential authorization works.", {
  expect_equal(auth_NLU(username = username, password = password),
               "Valid credentials provided.")
})
