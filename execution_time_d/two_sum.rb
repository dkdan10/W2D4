  def bad_two_sum?(arr, target_sum)
    # your code here...
    (0...arr.length).each do |idx1|
      ((idx1+1)...arr.length).each do |idx2|
        return true if arr[idx1] + arr[idx2] == target_sum 
      end
    end
    false
  end

  def okay_two_sum?(arr, target_sum) #n
    # your code here...
    arr.sort!
    s_i = 0
    e_i = arr.length - 1
    while s_i < e_i
      case arr[s_i] + arr[e_i] <=> target_sum
      when -1
        s_i += 1
      when 1
        e_i -= 1
      when 0
        return true
      end
    end
    false
  end

  def two_sum?(arr, target_sum) #n
    # your code here...
    hash = Hash.new(0)
    arr.each do |el|
      hash[el] += 1
    end
    arr.each do |el|
      return true if hash.has_key?(target_sum - el) && ((target_sum - el) != el || hash[el] > 1)
    end
    false
  end

arr = [0, 1, 5, 7]
p bad_two_sum?(arr, 6) # => should be true
p bad_two_sum?(arr, 10) # => should be false

arr = [0, 1, 5, 7]
p okay_two_sum?(arr, 6) # => should be true
p okay_two_sum?(arr, 10) # => should be false

arr = [0, 1, 5, 7]
p two_sum?(arr, 6) # => should be true
p two_sum?(arr, 10) # => should be false

