angular.module('dsa.services').service 'ds', ->
  class Node
    constructor: (@obj) ->
      @next = null
      @prev = null
      @uid = chance.guid()
  class LinkedList
    constructor: ->
      @f = null
      @l = null
    append: (obj) ->
      if Object(obj) is obj
        node = new Node obj
        if @isEmpty()
          @f = node
          @first().prev = null
          n = new Node node.obj
          n.uid = node.uid
          @l = n
          @f.next = @last()
          @last().prev = @f
        else if @size() is 1
          @l = node
          @last().next = null
          @last().prev = @f
          @first().next = @l
        else
          oldLast = @last()
          @l = node
          @last().next = null
          @last().prev = oldLast
          oldLast.next = @l
      return
    first: -> @f
    isEmpty: -> @size() is 0
    last: -> @l
    prepend: (obj) ->
      if Object(obj) is obj
        node = new Node obj
        if @isEmpty() or @size() is 1
          @append node
        else
          oldF = @first()
          @f = node
          @first().next = oldF
          @first().prev = null
      return
    removeFirst: ->
      node = null
      if not @isEmpty()
        node = @first()
        if @size() is 1
          @f = null
          @l = null
        else
          @f = node.next
          @first().prev = null
          node.next = null
          node.prev = null
      node
    removeLast: ->
      node = null
      if not @isEmpty()
        if @size() is 1
          node = @removeFirst()
        else
          node = @last()
          @l = node.prev
          @last().next = null
          node.next = null
          node.prev = null
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
    queue: (obj) ->
      @llist.append obj
      return
    size: -> @llist.size()
  class Stack
    constructor: ->
      @llist = new LinkedList()
    pop: -> @llist.removeLast()
    push: (obj) ->
      @llist.append obj
      return
    size: -> @llist.size()

  {
    LinkedList: LinkedList
    Node: Node
    Queue: Queue
    Stack: Stack
  }
