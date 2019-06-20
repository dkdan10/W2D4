require_relative 'mystack.rb'

class MinMaxStack < MyStack

  def initizalize
    super
    @max = nil
    @min = nil
  end

  def push(el)
    push_data = {val: el, prev_max: @max, prev_min: @min}
    @max = el if @max.nil? || el > @max
    @min = el if @min.nil? || el < @min
    @store.push(push_data)
  end

  def pop
    pop_data = @store.pop
    @max = pop_data[:prev_max]
    @min = pop_data[:prev_min]
    return pop_data[:val]
  end

  def max
    @max
  end

  def min
    @min
  end

end