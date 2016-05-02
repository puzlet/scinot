#!no-math-sugar

{Slider, Menu, Table, Plot} =  $blab.components

table_decimal = new Table
  container: $("#lecture-table-decimal")
  id: "decimal"
  title: null
  headings: null
  widths: 500

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

table_rep = new Table
  container: $("#lecture-table-repeated")
  id: "repeated"
  title: null
  headings: null
  widths: 500

table_shift = new Table
  container: $("#lecture-table-shift")
  id: "shift"
  title: null
  headings: null
  widths: 500

slider_exp = new Slider
  container: $("#lecture-slider-exp")
  prompt: null
  unit: null
  init: -3
  min: -32
  max: 32
  step: 1


$blab.computation "compute.coffee", {slider_exp, table_decimal, table_product, table_sn, table_rep, table_shift}
