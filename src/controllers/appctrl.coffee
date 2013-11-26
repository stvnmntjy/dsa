angular.module('dsa.controllers').controller 'AppCtrl', ['$scope', '$compile', 'algos', ($scope, $compile, algos) ->
  newGraph = (str) ->
    width = $('#dsa1').parent().width()
    el = $compile("""<bar-chart data-array="#{str}" data-svg-width="#{width}"></bar-chart>""")($scope.$new())
    $('#dsa1').empty().append el
    return
  newArray = ->
    $scope.arr = chance.shuffle (i for i in [1..20])
    return
  newAlgo = ->
    result = $scope.algo algos.copy $scope.arr
    $scope.endArr = result.array
    $scope.moves = result.moves
    return
  $scope.algo = algos.bubbleSort
  $scope.arr = []
  $scope.endArr = []
  $scope.moves = null
  $scope.end = -> $scope.moves.last()
  $scope.finish = ->
    newGraph 'endArr'
    return
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
    newGraph 'arr'
    newAlgo()
    return
  $scope.start = -> $scope.moves.first()
  $scope.randomize()
]

