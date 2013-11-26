angular.module('dsa.controllers').controller 'AppCtrl', ['$scope', '$compile', 'ds', 'algos', ($scope, $compile, ds, algos) ->
  newGraph = ->
    width = $('#dsa1').parent().width()
    el = $compile("""<bar-chart data-array="arr" data-svg-width="#{width}"></bar-chart>""")($scope.$new())
    $('#dsa1').empty().append el
    return
  newArray = ->
    $scope.arr = chance.shuffle (i for i in [1..20])
    return
  $scope.arr = []
  $scope.end = ->
  $scope.nextStep = ->
  $scope.nextSwap = ->
  $scope.pause = ->
  $scope.play = ->
  $scope.prevStep = ->
  $scope.prevSwap = ->
  $scope.randomize = ->
    newArray()
    $scope.restart()
    return
  $scope.restart = ->
    newGraph()
    return
  $scope.start = ->
  $scope.randomize()
  pairs = algos.invertedPairs $scope.arr
  console.log "# of inverted pairs: #{pairs.length}"
  console.log $scope.arr
  llist = algos.bubbleSort $scope.arr
  node = llist.first()
  while node.next isnt null
    node = node.next
  return
]

