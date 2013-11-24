angular.module('dsa.services').service 'ds', ->
  class Node
    constructor: (@obj) ->
      @uid = chance.guid()
      @next = null
  class LinkedList
    constructor: ->
      @f = null
      @l = null
    append: (node) ->
      if Object(node) is node
        if @isEmpty()
          @f = node
          n = new Node node.obj
          n.uid = node.uid
          @l = n
          @f.next = @last()
        else if @size() is 1
          @l = node
          @last().next = null
          @first().next = @l
        else
          oldLast = @last()
          @l = node
          @last().next = null
          oldLast.next = @l
      return
    first: -> @f
    isEmpty: -> @size() is 0
    last: -> @l
    prepend: (node) ->
      if Object(node) is node
        if @isEmpty() or @size() is 1
          @append node
        else
          oldF = @first()
          @f = node
          @first().next = oldF
      return
    removeFirst: ->
      node = null
      if isnt @isEmpty()
        node = @first()
        if @size() is 1
          @f = null
          @l = null
        else
          @f = node.next
          node.next = null
      node
    removeLast: ->
      node = null
      if isnt @isEmpty()
        if @size() is 1
          node = @removeFirst()
        else
          n = @first()
          while n.next.next isnt null
            n = node.next
          @l = n
          node = n.next
          @last().next = null
      node
    size: ->
      cnt = 0
      next = null
      if @first() isnt null
        next = @first()
        cnt += 1
        while next.next and next.uid isnt next.next.uid
          next = next.next
          cnt += 1
      cnt
  class Queue
    constructor: ->
      @llist = new LinkedList()
    dequeue: -> @llist.removeFirst()
    queue: (node) ->
      @llist.append node
      return
    size: -> @llist.size()
  class Stack
    constructor: ->
      @llist = new LinkedList()
    pop: -> @llist.removeLast()
    push: (node) ->
      @llist.append node
      return
    size: -> @llist.size()

  {
    LinkedList: LinkedList
    Node: Node
    Queue: Queue
    Stack: Stack
  }
