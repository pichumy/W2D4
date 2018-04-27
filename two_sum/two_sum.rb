# Easiest way to solve problem with brute force :
# double looping through the array and trying all possible permutations,
# return true if one of them match

def bad_two_sum?(arr, target_sum)
  arr.size.times do |start|
    (start + 1...arr.size).each do |stop|
      return true if arr[start] + arr[stop] == target_sum
    end
  end
  false
end

# this is an n^2 solution

def okay_two_sum?(arr, target_sum)
  arr.sort!
  arr.each do |el|
    return true if arr.bsearch { |x| x >= (target_sum - el)}
  end
  false
end

def two_sum?(arr, target_sum)
  hash = Hash.new{|h,k| h[k] = nil}
  arr.each do |el|
    return true unless hash[(target_sum - el)].nil?
    hash[el] = el
  end
  false
end

if __FILE__ == $0
  arr = [0,1,5,7]
  p two_sum?(arr, 6) # true
  p two_sum?(arr, 10) #false
end
