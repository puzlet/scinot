#!no-math-sugar

{Slider, Menu, Table, Plot} =  $blab.components

menu_examples = new Menu
  container: $("#lecture-menu-examples")
  init: 1
  prompt: "Example:"
  options: [
    {text: "choose example", value: 0}
    {text: "diameter of visible universe", value: 1}
    {text: "power output of sun", value: 2}
    {text: "mass of the earth", value: 3}
  ]
  align: "left"

table_count = new Table
  container: $("#lecture-table-count")
  id: "count"  # Must be consistent with tables.json
  title: null
  headings: null # ["Column 1", "Column 2"]
  widths: 500  #[100, 100]

table_product = new Table
  container: $("#lecture-table-product")
  id: "product"
  title: null
  headings: null
  widths: 500

table_sn = new Table
  container: $("#lecture-table-sn")
  id: "sn"
  title: null
  headings: null
  widths: 500

slider_count = new Slider
  container: $("#lecture-slider-count")
  prompt: "length"
  unit: "digits"
  init: 0
  min: 1
  max: 50
  step: 1

slider_shift = new Slider
  container: $("#lecture-slider-shift")
  prompt: "shift"
  unit: "points"
  init: 0
  min: 0
  max: 30
  step: 1


$blab.computation "compute.coffee", {slider_count, slider_shift, table_count, table_product, table_sn, menu_examples}
