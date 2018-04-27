def first_anagram?(string, string_target)
  allsubstrings = permutation(string.chars)
  allsubstrings.select! {|el| el.length == string.length}
  allsubstrings.map!(&:join)
  allsubstrings.include?(string_target)
  # this algorithmn sucks
end

def permutation(arr)
  results = []
  return [arr] if arr.length == 1
  pivot = arr[0]
  set = permutation(arr[1...arr.length])
  set.each do |array|
    (array.length + 1).times do |idx|
       results.push(array.dup.insert(idx,pivot))
    end
   end
   results
end

def second_anagram?(string, string_target)
  str1_arr = string.chars
  str2_arr = string_target.chars
  until str1_arr.empty?
    target_idx = str2_arr.index(str1_arr[0])
    return false if target_idx.nil?
    str1_arr.delete_at(0)
    str2_arr.delete_at(target_idx)
  end
  str2_arr.empty?
end

def third_anagram?(string, string_target)
  string.chars.sort == string_target.chars.sort
end

def fourth_anagram?(string, string_target)
  hash = Hash.new(0)
  hash_target = Hash.new(0)
  string.chars.each do |char|
    hash[char] += 1
  end
  string_target.chars.each do |char|
    hash_target[char] += 1
  end
  hash == hash_target
end

def fourth_anagram_bonus?(string, string_target)
  hash = Hash.new(0)
  string.chars.each do |char|
    hash[char] += 1
  end
  string_target.chars.each do |char|
    hash[char] += 1
  end
  hash.all? { |k,v| v.even? }
end

if __FILE__ == $0
  p fourth_anagram_bonus?("gizmo", "mogiz")
end
