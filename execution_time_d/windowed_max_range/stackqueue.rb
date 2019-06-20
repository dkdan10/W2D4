require_relative "mystack"
require_relative "myqueue"
class StackQueue
   def initialize
    @stack1 = MyStack.new
    @stack2 = MyStack.new
   end

   def size
    @stack1.size
   end

   def enqueue(el)
      until @stack1.empty?
        @stack2.push(@stack1.pop)
      end
      stack1.push(el)
   end 

   def dequeue
      raise "is empty" if @stack1.empty?
      until stack2.empty?
        @stack1.push(@stack2.pop)
      end
      @stack1.pop
   end

   def empty?
    @stack1.empty?
   end

end