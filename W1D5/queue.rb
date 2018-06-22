class Queue

  def initialize
    @array = []
  end

  def enqueue(el)
    array << el
    self
  end

  def dequeue
    array.shift
  end

  def peek
    array.first
  end

  def show
    array.dup
  end
  

  private

  attr_reader :array

end
