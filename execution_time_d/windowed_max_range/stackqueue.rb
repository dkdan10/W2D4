require './mystack.rb'
require "./myqueue"
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
      raise "is empty" if self.empty?
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