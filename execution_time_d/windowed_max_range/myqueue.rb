  class MyQueue
    def initialize
      @store = []
    end

    def enqueue(el)
      @store.push(el)
    end

    def dequeue
      @store.shift
    end

    def peek 
      @store[0]
    end

    def empty?
      @store.empty?
    end

    def size
      @store.length
    end
  end