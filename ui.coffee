#!no-math-sugar

{Slider, Menu, Table, Plot} =  $blab.components

table = new Table
  container: $("#lecture-table-count")
  id: "count"  # Must be consistent with tables.json
  title: "title"
  headings: ["heading"] # ["Column 1", "Column 2"]
  widths: 500  #[100, 100]

# $blab.computation "compute.coffee", {slider, menu, table, plot, textOffset}
