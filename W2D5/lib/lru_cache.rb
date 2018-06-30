class LRUCache

  def initialize(size)
    @cache = Array.new(size) {Array.new}
    @size = size
  end

  def count
    @cache.length
  end

  def add
    if @cache.include?(el)
      @cache.delete(el)
      @cache.push(el)
    elsif count >= @size
      @cache.shift
      @cache.push(el)
    else
      @cache.push(el)
    end
  end

  def show
    p @cache
  end

end
