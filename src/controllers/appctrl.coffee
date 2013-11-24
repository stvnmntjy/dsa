angular.module('dsa.controllers').controller 'AppCtrl', ['$scope', '$compile', 'algos', ($scope, $compile, algos) ->
  newGraph = ->
    width = $('#dsa1').parent().width()
    el = $compile("""<bar-chart data-array="arr" data-svg-width="#{width}"></bar-chart>""")($scope.$new())
    $('#dsa1').empty().append el
    return
  newArray = ->
    $scope.arr = chance.shuffle (i for i in [1..20])
    $scope.iters = []
    $scope.iters.push $scope.arr
    return
  $scope.arr = []
  $scope.iters = []
  $scope.randomize = ->
    newArray()
    $scope.restart()
    return
  $scope.restart = ->
    newGraph()
    return
  $scope.randomize()
  pairs = algos.invertedPairs $scope.arr
  console.log "# of inverted pairs: #{pairs.length}"
  swapped = true
  console.log "#{$scope.iters.length - 1} : #{$scope.iters[0]}"
  while swapped is true
    swapped = algos.bubbleSort $scope.arr, 0, $scope.iters.length - 1, false
    $scope.iters.push $scope.arr
  console.log "#{$scope.iters.length - 1} : #{$scope.iters[$scope.iters.length - 1]}"
  return
]

