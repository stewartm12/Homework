class Stack

  def initialize
    @stack = []
  end

  def push(el)
    @stack << el
  end

  def pop
    @stack.pop
  end

  def peek
    @stack.first
  end
end

#######################################

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
    @queue.first 
  end
end

#####################################

class Map

  def initialize
    @array = []
  end

  def set(key, value)
    @array.each do |sub|
      sub.each { |ele| sub[1] = value if sub[0] == key } 
    end

    @array << [key, value] if !@array.include?([key, value])
    @array
  end

  def get(key)
    @array.each do |sub|
      return sub[1] if sub[0] == key
    end

    nil
  end

  def delete(key)
    @array.reject! { |sub| sub[0] == key }
  end

  def show
    deep_dup(@array)
  end

  
  def deep_dup(arr)
    arr.map do |sub_arr|
      if sub_arr.is_a?(Array)
        deep_dup(sub_arr)
      else  
        sub_arr
      end
    end
  end 

end