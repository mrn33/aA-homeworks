class Stack
  def initialize
    @my_arr = []
  end

  def push(el)
    my_arr << el
    self
  end

  def pop
    my_arr.pop
  end

  def peek
    my_arr.last
  end

  def inspect
    "#<stack:#{self.object_id} top=#{peek}>"
  end
  
  private

  attr_reader :my_arr

end
