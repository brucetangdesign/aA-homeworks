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

# q = Queue.new
# q.enqueue(1)
# q.enqueue(2)
# q.enqueue(3)
# q.dequeue
# p q.peek


# Exercise 3 - Map
# As you saw in the videos for tonight, a map can be implemented using a 2D array. Let's write a Map class (following a similar pattern to Stack and Queue) that implements a map using only arrays.

# Remember, a map stores information in key-value pairs, where the keys are always unique. When implemented with arrays, a map might look something like this: my_map = [[k1, v1], [k2, v2], [k3, v2], ...].

# Our Map class should have the following instance methods: set(key, value), get(key), delete(key), show. Note that the set method can be used to either create a new key-value pair or update the value for a pre-existing key. It's up to you to check whether a key currently exists!

class Map
    def initialize
        @map = Array.new
    end

    def set(key,value)
        if @map.any? {|el| el[0] == key }
            (0...@map.length).each do |i|
                if @map[i][0] == key
                    @map[i][1] = value
                    break
                end
            end
        else
            @map << [key,value]
        end
    end

    def get(key)
        value = nil
        if @map.any? {|el| el[0] == key }
            (0...@map.length).each do |i|
                if @map[i][0] == key
                    value = @map[i][1] 
                    break
                end
            end 
        end
        value
    end

    def delete(key)
        if @map.any? {|el| el[0] == key }
            (0...@map.length).each do |i|
                @map.delete_at(i) if @map[i][0] == key
                break
            end
        end
    end

    def[](key)
        get(key)
    end
end

m = Map.new
m.set(1,"a")
m.set(2,"b")
m.delete(1)