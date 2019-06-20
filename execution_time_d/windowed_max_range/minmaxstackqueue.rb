require_relative "minmaxstack"
require_relative "stackqueue"

class MinMaxStackQueue < StackQueue
  def initialize
    @in = MinMaxStack.new
    @out = MinMaxStack.new
  end

  def max
    nil if self.empty?
    return @in.max if @out.max.nil?
    return @out.max if @in.max.nil?
    @in.max > @out.max ? @in.max : @out.max
  end

  def min
    nil if self.empty?
    return @in.min if @out.min.nil?
    return @out.min if @in.min.nil?
    @in.min < @out.min ? @in.min : @out.min
  end

end