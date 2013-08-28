reactivity = require 'reactivity'
bidibinder = require 'bidibinder'

module.exports =
  connect: ( cell1, cell2, equals ) ->
    binding = bidibinder
      get_a: cell1
      set_a: cell1
      get_b: cell2
      set_b: cell2
      equals: equals
    stop1 = reactivity cell1, -> binding.touch_a()
    stop2 = reactivity cell2, -> binding.touch_b()
    binding.touch_a()
    -> stop1() ; stop2()