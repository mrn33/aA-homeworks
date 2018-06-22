class Stack
  def initialize
    @mr_arr = []
  end

  def push(el)
    mr_arr.push
    el
  end

  def pop
    mr_arr.pop
  end

  def peek
    mr_arr.last
  end

  private

  attr_reader :mr_arr

end
