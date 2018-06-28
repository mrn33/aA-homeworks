fish_arr = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']


#O(n^2)
def biggest_fish(arr)
  arr.each_with_index do |str1, i|
    longest = true #sets max length to longest str
    arr.each_with_index do |str2, k|
      next if i == k #compares i to all other index's (k)
      longest = false if str2.length > str1.length
    end

    return str1 if longest
  end
end

p biggest_fish(fish_arr) == "fiiiissshhhhhh"






#O(n log n) --> merge sort #STILL NO LUCK WITH MERGE_SORT
class Array

  def merge_sort_fish(&prc)
    prc ||= Proc.new {|x, y| x <=> y}
    return self if count <= 1

    mid_idx = self.length / 2
    left = self.take(mid_idx).merge_sort_fish(&prc)
    right = self.drop(mid_idx).merge_sort_fish(&prc)

    merge(left, right, &prc)
  end

  def merge(left, right, &prc)
    result = []

    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        result << left.shift
      when 0
        result << left.shift
      when 1
        result << right.shift
      end
    end

    result.concat(left)
    result.concat(right)

    result
  end
end

def nlogn_fish(arr)
  prc = Proc.new { |x, y| y.length <=> x.length }
  arr.merge_sort_fish(&prc)[0]
end

p nlogn_fish(fish_arr)







#Clever Octopus

def clever_fish(arr)
  longest = arr[0]

  arr.each do |el|
    if el.length > longest.length
      longest = el
    end
  end

  longest
end

p clever_fish(fish_arr) == "fiiiissshhhhhh"



#Slow Dance
tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_dance(str, arr)
  arr.each_with_index do |curr_str, idx|
    return idx if curr_str == str
  end
end

p slow_dance("up", tiles_array) == 0
p slow_dance("right-down", tiles_array) == 3



#Constant Dance!
tiles_hash = { "up" => 0,
               "right-up" => 1,
               "right" => 2,
               "right-down" => 3,
               "down" => 4,
               "left-down" => 5,
               "left" => 6,
               "left-up" => 7
             }

 def constant_dance(key, tiles_hash)
   return tiles_hash[key]
 end

 p constant_dance("up", tiles_hash) == 0
 p constant_dance("right-down", tiles_hash) == 3
