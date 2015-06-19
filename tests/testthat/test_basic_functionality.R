library(dimple)
context("Basic functionality")

partial_data <-
  subset(sales, Owner %in% c("Aperture", "Black Mesa"))

testplot<-
  dimple(partial_data,
         xCategory="Month",
         yMeasure="Unit.Sales",
         xOrderRule="Date",
         chartType="steparea",
         series="Channel",
         seriesLineWeight = 1,
         legend=TRUE)


test_that("an object of containing the classes dimple and htmlwidget is returned", {
  expect_true("dimple" %in% class(testplot))
  expect_true("htmlwidget" %in% class(testplot))
})
