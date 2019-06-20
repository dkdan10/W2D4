require_relative "mystack"
require_relative "myqueue"
class StackQueue
   def initialize
    @in = MyStack.new
    @out = MyStack.new
   end

   def size
    @in.size + @out.size
   end

   def enqueue(el)
      @in.push(el)
   end 

   def dequeue
      raise "is empty" if @in.empty?
      return @out.pop unless @out.empty?
      until @in.empty?
        @out.push(@in.pop)
      end
      @out.pop
   end

   def empty?
    @in.empty? && @out.empty?
   end

end