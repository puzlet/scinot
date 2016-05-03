#!no-math-sugar

{Slider, Menu, Table, Plot} =  $blab.components

###
table_decimal = new Table
  container: $("#lecture-table-decimal")
  id: "decimal"
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


$blab.computation "compute.coffee", {slider_sigfigs}
