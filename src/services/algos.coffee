angular.module('dsa.services').service 'algos', ->
  swap = (arr, i, j) ->
    temp = arr[i]
    arr[i] = arr[j]
    arr[j] = temp
  bubbleSort: (arr, i, numIters, hasSwapped) ->
    if i + 1 isnt (arr.length - numIters)
      if arr[i] > arr[i + 1]
        swap arr, i, i + 1
        bubbleSort arr, i + 1, numIters, true
      else
        bubbleSort arr, i + 1, numIters, hasSwapped
    else
      hasSwapped
