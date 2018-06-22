class Stack
  def initialize
    @my_arr = []
  end

  def push(el)
    my_arr.push(el)
    el
  end

  def pop
    my_arr.pop
  end

  def peek
    my_arr.last
  end

  private

  attr_reader :my_arr

end
