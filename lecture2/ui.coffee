#!no-math-sugar

{Slider, Menu, Table, Plot} =  $blab.components

table_shift = new Table
  container: $("#lecture-table-shift")
  id: "shift"
  title: null
  headings: null
  widths: 500

table_rep = new Table
  container: $("#lecture-table-rep")
  id: "rep"
  title: null
  headings: null
  widths: 500

table_number = new Table
  container: $("#lecture-table-number")
  id: "number"
  title: null
  headings: null
  widths: 500

slider_shift = new Slider
  container: $("#lecture-slider-shift")
  prompt: "shift"
  unit: "points"
  init: 0
  min: -10
  max: 10
  step: 1

$blab.computation "compute.coffee", {slider_shift, table_shift, table_rep, table_number}
