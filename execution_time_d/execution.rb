require "byebug"
def my_min_nn(list) #n^2
  list.each {|el1|
    return el1 if list.all? {|el2| el2 >= el1 }
  }
end

def my_min_n(list) #n
  smallest = list.first
  list.each {|el| smallest = el if smallest > el }
  smallest
end

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
my_min_n(list)  # =>  -5

def largest_contiguous_subsum_nn(list) #n^2
  subs_arr = []
  (0...list.length).each do |i1|
    (i1...list.length).each do |i2|
      subs_arr << list[i1..i2]
    end
  end

  subs_arr.map {|sub_el| sub_el.sum}.max
end

def largest_contiguous_subsum(list) #n
  return list.max if list.all? {|el| el < 0}
  return list.sum  if list.all? {|el| el > 0}
  best_sum = 0
  curr_sum = 0
  list.each do |el|
    curr_sum += el
    best_sum = curr_sum if curr_sum > best_sum
    curr_sum = 0 if curr_sum < 0
  end
  best_sum
end


list = [5, 3, -7] #8
p largest_contiguous_subsum(list) # => 8

list = [2, 3, -6, 7, -6, 7]
p largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])

list = [-5, -1, -3]
p largest_contiguous_subsum(list) # => -1 (from [-1])

