def recursive_range(start, finish)
  return [] if finish <= start
  result_array = [start]
  result_array + recursive_range(start+1, finish)
end

def my_sum(arr)
  return arr[0] if arr.length <= 1
  num = arr.pop
  num += my_sum(arr)
end

def iter_my_sum(arr)
  # result = 0
  # arr.each {|el| result += el }
  # result
  # 
  arr.inject(:+)
  arr.reduce(:+)
end

# p recursive_range(1,5)
# p my_sum([1,2,3,4,5])

def exp1(num, power)
  return 1 if power.zero?
  exp1(num, power - 1) * num
end


def exp(num, power)
  return num if power == 1
  r = num  
  r *= num if power.odd? 
  r * exp(num, power / 2)
end


# p exp(2, 3)

def deep_dup(array)
  return [] if array.empty?
  inter_arr = []
  array.each do |el|
    if el.is_a?(Array)
      inter_arr << deep_dup(el)
    else
      inter_arr << el
    end
  end
  inter_arr
end

a = "bob"
b = "chris"
c = "cat"
d = "dave"
e = [c, d]
arr = [a,b,[c,d,[e]]]
arr1 = arr.dup
arr2 = deep_dup(arr)

# arr[2][2] = ['Danny']
# p arr
# p arr1
# p arr2

# p deep_dup([a,b,[c,d,[e]]]) 


def bsearch(array, target)
  return nil if array[0] != target && array.length == 1
  middle_index = array.length/2
  return middle_index if array[middle_index] == target
  
  left = array[0...middle_index]
  right = array[middle_index..-1]
  
  if array[middle_index] < target
    value = bsearch(right, target)
    return value.nil? ? nil : left.length + value
  else
    bsearch(left, target)
  end
end

# p bsearch([1, 2, 3], 1)  == 0
# p bsearch([2, 3, 4, 5], 3)  == 1
# p bsearch([2, 4, 6, 8, 10], 6)  == 2
# p bsearch([1, 3, 4, 5, 9], 5)  == 3
# p bsearch([1, 2, 3, 4, 5, 6], 6)  == 5
# p bsearch([1, 2, 3, 4, 5, 6], 0)  == nil
# p bsearch([1, 2, 3, 4, 5, 7], 6)  == nil
# 



def merge(half1, half2)
  result = []

  until half1.empty? && half2.empty?
      
    if half1.empty?
      result << half2.shift
    elsif half2.empty?
      result << half1.shift
    end
    
    next if half1.empty? || half2.empty?
    result << (half1.first < half2.first ? half1.shift : half2.shift)
  
  end
  
  result
end

def merge_sort(arr)
  
  l = arr.length
  return arr if l <= 1
  
  left = arr[0..(l/2)-1]
  right = arr[(l/2)..-1]
  
  half1 = merge_sort(left) 
  half2 = merge_sort(right)
  
  merge(half1, half2)
  
end



# p merge_sort([1,6, 5, 4])

def subsets(arr)
  p arr
  return [[]] if arr.empty?
  rval = []
  rval << arr
  # return arr if arr.empty? 

  
  
  arr.each do |el|
    underset = []
    arr.each do |el1|
      underset << el1 unless el1 == el
    end
    rval = subsets(underset) + rval
  end
  rval.uniq
end

# p subsets([1,2,3,4,5,6])

# p subsets([]) # => [[]]
# p subsets([1]) # => [[], [1]]
# p subsets([1, 2]) # => [[], [1], [2], [1, 2]]
# p subsets([1, 2, 3])
# => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]
  
def permutations(arr)
  return [arr] if arr.size <= 1
  rar = []
  arr.each_index do |i|
    sub_arr = permutations(arr[0...i] + arr[i + 1..-1])
    sub_arr.each do |el|
      rar << el.unshift(arr[i])
    end
  end
  rar
end 
# 
# p permutations([])
# p permutations([1])
# p permutations([1, 2])
# p permutations([1, 2, 3])
# 
# 
def make_change(amount, coins=[25,10,5,1])
  
  return [] if amount == 0
  rval = []
  coins.each do |coin|
    if amount >= coin
      rval << coin
      amount -= coin
      return rval + make_better_change(amount, coins)
    end
  end
  rval
end

def make_better_change(amount, coins = [25,10,5,1])
  return [] if amount == 0
  rval = []
  coins.each do |coin|
    coins.each do |coin1|
      if coin1 < coin && amount >= coin1
        rval << coin1
        amount -= coin1
        return rval + make_better_change(amount, coins)
      end
    end
  end
  rval
end

p make_change(29)
p make_better_change(29)

p make_change(24,[10,7,1])
p make_better_change(24,[10,7,1])
