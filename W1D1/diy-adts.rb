#Ex 1 STACK
class Stack
  def initialize
    # create ivar to store stack here!
    @stack = []
  end

  def push(el)
    # adds an element to the stack
    @stack << el
  end

  def pop
    # removes one element from the stack
    @stack.pop
  end

  def peek
    # returns, but doesn't remove, the top element in the stack
    @stack[-1]
  end
end

# s = Stack.new
# s.push(1)
# s.push(2)
# s.pop
# p s.peek


#Ex 2 Queue
class Queue
    def initialize
        @queue = []
    end

    def enqueue(el)
        @queue << el
    end

    def dequeue
        @queue.shift
    end

    def peek
        @queue[0]
    end
end

q = Queue.new
q.enqueue(1)
q.enqueue(2)
q.enqueue(3)
q.dequeue
p q.peek