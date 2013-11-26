angular.module('dsa.services').service 'algos', ['ds', (ds) ->
  swap = (arr, i, j) ->
    temp = arr[i]
    arr[i] = arr[j]
    arr[j] = temp
  copy: (arr) -> (arr[i] for a, i in arr)
  invertedPairs: (arr) ->
    pairs = []
    for i in [0...arr.length]
      for j in [i+1...arr.length]
        if arr[i] > arr[j]
          pairs.push "(#{arr[i]}, #{arr[j]})"
    pairs
  bubbleSort: (arr) ->
    list = new ds.LinkedList()
    _bubbleSort = (i, iter, hasSwapped) =>
      if i + 1 isnt (arr.length - iter)
        list.append [i, i + 1]
        if arr[i] > arr[i + 1]
          swap arr, i, i + 1
          list.append [i, i + 1]
          _bubbleSort i + 1, iter, true
        else
          _bubbleSort i + 1, iter, hasSwapped
        return
      else
        if hasSwapped
          _bubbleSort 0, iter + 1, false
        return
    _bubbleSort 0, 0, false
    list
]
