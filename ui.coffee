#!no-math-sugar

{Slider, Menu, Table, Plot} =  $blab.components

table = new Table
  container: $("#lecture-table-count")
  id: "count"  # Must be consistent with tables.json
  title: "title"
  headings: ["heading"] # ["Column 1", "Column 2"]
  widths: 500  #[100, 100]

slider = new Slider
  container: $("#lecture-slider-count")
  prompt: "length"
  unit: "digits"
  init: 1
  min: 1
  max: 50
  step: 1


# $blab.computation "compute.coffee", {slider, menu, table, plot, textOffset}
