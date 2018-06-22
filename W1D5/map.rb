class Map
  
  def initialize
    @my_map = []
  end

  def set(key, value)
    key_val_pairs_idx = my_map.index { |pair| pair[0] == key }

    if key_val_pairs_idx
      my_map[key_val_pairs_idx][1] = value
    else
      my_map.push([key, value])
    end

    value
  end


  def get(key)
    my_map.each { |pair| return pair[1] if pair[0] == key }
    nil
  end

  def delete(key)
    value = get(key)
    my_map.reject! { |pair| pair[0] == key }
    value
  end


  def show
    deep_dup(my_map)
  end

  attr_reader :my_map

  def deep_dup(arr)
    arr.map { |el| el.is_a?(Array) ? deep_dup(el) : el }
  end


end
