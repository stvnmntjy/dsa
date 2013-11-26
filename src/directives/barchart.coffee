angular.module('dsa.directives').directive 'barChart', ->
  template:
    """
    <svg></svg>
    """
  restrict: 'E'
  replace: true
  scope:
    array: '='
  link: (scope, iElement, iAttrs, controller) ->
    height = 300
    width = iAttrs.svgWidth
    scaleX = d3.scale.ordinal().
      domain(d3.range scope.array.length).
      rangeRoundBands [0, width], .33
    scaleY = d3.scale.linear().
      domain([0, d3.max scope.array]).
      range [height, 0]
    svg = d3.selectAll(iElement).attr(
        height: height
        width: width
      )
    svg.selectAll('rect').
      data(scope.array).
      enter().append('rect').attr(
        height: (d) -> height - scaleY d
        width: scaleX.rangeBand()
        x: (d, idx) -> scaleX idx
        y: (d) -> scaleY d
      ).
      on('foo', (d, idx) ->
        console.log 'foo'
        return)
    dispatcher = d3.dispatch 'foo'
    dispatcher.foo()
    return

