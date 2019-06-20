def first_anagram?(str1, str2)

  str1.chars.permutation(str1.length).map{|el| el.join("")}.include?(str2)
  

end

p first_anagram?("gizmo", "sally")    #=> false
p first_anagram?("elvis", "lives")    #=> true

def second_anagram?(str1, str2)
  str2 = str2.split("")
  str1.chars.each{|el| 
    if !str2.include?(el)
      return false
    else
      str2.delete(el)
    end
    }
  puts str2
  str2.empty?
end


p second_anagram?("gizmo", "sally")    #=> false
p second_anagram?("elvis", "lives")    #=> true

def third_anagram?(str1, str2)
  str1.chars.sort == str2.chars.sort
end


p third_anagram?("gizmo", "sally")    #=> false
p third_anagram?("elvis", "lives")    #=> true

def fourth_anagram?(str1, str2)
  hash = Hash.new(0)
  hash2 = Hash.new(0)
  str1.chars.each {|el| hash[el] += 1}

  str2.each_char {|el| hash2[el] += 1}
  hash == hash2
end



p fourth_anagram?("gizmo", "sally")    #=> false
p fourth_anagram?("elvis", "lives")    #=> true



def fifth_anagram?(str1, str2)
  hash = Hash.new(0)
  str1.chars.each {|el| hash[el] += 1}

  str2.each_char {|el| hash[el] -= 1}
  hash.all? {|k,v|v==0}
end



p fifth_anagram?("gizmo", "sally")    #=> false
p fifth_anagram?("elvis", "lives")    #=> true




