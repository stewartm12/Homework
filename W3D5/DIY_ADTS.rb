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

end