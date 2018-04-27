def my_min_phase_one(array) 
  array.each_with_index do |number, idx| 
    sorted = true 
    array.each_with_index do |other_number, idx2| 
      if idx == idx2 
        next 
      end 
      if number > other_number 
        sorted = false 
      end 
    end 
    if sorted 
      return number 
    end 
  end 
  return "we suck"
  # actually this algorithmn sucks
end 

def my_min_phase_two(array)
  smallest = array[0]
  array.each do |number| 
    if number < smallest 
      smallest = number 
    end 
  end 
  smallest 
  # N complexity 
end 

def largest_contiguous_sub_sum_phase_one(array)
  sub_arrays = []
  array.size.times do |start| 
    (start...array.size).each do |stop| 
      sub_arrays.push(array[start..stop])
    end 
  end 
  hash = Hash.new(0)
  sub_arrays.each do |sub_array| 
    sub_array.each do |number| 
      hash[sub_array] += number 
    end 
  end 
  hash.max_by{|k,v| v}[1]
end 

def largest_contiguous_sub_sum_phase_two(array)
  largest_sum = array[0] 
  curr_sum = array[0]
  reset_trigger = array[0] # this is only used to handle 0 and negative numbers 
  if reset_trigger > 0 
    reset_trigger = 0 
  end 
  array[1..-1].each do |number|
    # this stuff is to handle dumbass negative numbers
    if number > largest_sum
      # this tells us we received a positive number 
      if number > 0 
        # in case our base value was a negative number, set it now to 0
        reset_trigger = 0 
      else 
        #this tells us we received a negative number, set reset_trigger to this larger negative number 
        reset_trigger = number 
      end  
    end 
    # this is to check if we should restart our sequence from a new number 
    # this condition means the curr_sum either goes below 0, which means we reset 
    # or base value was updated with a larger negative number than before, meaning we should restart at that negative number 
    
    if curr_sum + number < reset_trigger #only happen if we hit a negative number
      # if adding this number to our sequence would make our sequence less than a 
      #previous base to go back to, restart sequence 
      curr_sum = reset_trigger 
    else 
    # this is the base case of continuing our sequence 
      curr_sum += number
    end  
    if curr_sum > largest_sum 
      largest_sum = curr_sum 
    end
  end 
  largest_sum
end

if __FILE__ == $0 
  list = [-5, -1, -3]
  p largest_contiguous_sub_sum_phase_two(list) 
end 