require_relative "minmaxstackqueue"

# NAIVE
def windowed_max_range_bad(array, window_size)
  current_max_range = nil
  (0..(array.length-window_size)).each do |idx|
    ((idx+window_size)..array.length).each do |end_i|
      if end_i == idx + window_size
        cur_win = array[idx...end_i]
        range = cur_win.max - cur_win.min
        current_max_range = range if current_max_range.nil? || current_max_range < range
      end
    end
  end
  return current_max_range
end

windowed_max_range_bad([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
windowed_max_range_bad([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
windowed_max_range_bad([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
windowed_max_range_bad([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8

def windowed_max_range_good(array, window_size)
  mmsq = MinMaxStackQueue.new
  big_diff = nil
  i = 0
  while i < array.length
    mmsq.enqueue(array[i])
    if mmsq.size == window_size
      mmsq.size
      next_diff = mmsq.max - mmsq.min
      big_diff = next_diff if big_diff.nil? || big_diff < next_diff
      mmsq.dequeue
    end
    i+=1
  end
  big_diff
end

p windowed_max_range_good([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p windowed_max_range_good([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p windowed_max_range_good([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p windowed_max_range_good([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8
