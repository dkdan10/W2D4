class MyStack
  def initialize
    @store = []
  end

  def push(el)
    @store.push(el)
  end

  def pop
    @store.pop
  end

  def peek 
    @store[-1]
  end

  def empty?
    @store.empty?
  end

  def size
    @store.length
  end

end