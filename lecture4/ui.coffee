#!no-math-sugar

{Slider, Menu, Table, Plot} =  $blab.components

table_input = new Table
  container: $("#lecture-table-input")
  id: "input"
  title: null
  headings: null
  widths: 500

###
slider_sigfigs = new Slider
  container: $("#lecture-slider-sigfigs")
  prompt: null
  unit: null
  init: 3
  min: 1
  max: 12
  step: 1
###


$blab.computation "compute.coffee", {table_input}
