class SortedArray
  attr_accessor :internal_arr # This is for convenience in the tests.

  def initialize(input_arr=[])
    @internal_arr = []
    input_arr.each do |element|
      add(element)
    end
  end

  def [](index)
    return @internal_arr[index]
  end
  
  def first_larger_index(target, start_ind=0, end_ind=@internal_arr.size)
    # array is empty, immediately return
    return 0 if @internal_arr.empty?
    # array has at least one element
    midpoint = ((end_ind - start_ind) / 2) + start_ind
    mid_element = @internal_arr[midpoint]
    # array contains one element
    if start_ind == midpoint
      if target < mid_element
        return midpoint
      else
        return end_ind
      end  
    elsif target > mid_element
      return first_larger_index(target, midpoint, end_ind)
    else 
      # target is less than the midpoint element
      return first_larger_index(target, start_ind, midpoint)
    end
  end

  def add(new_ele)
    index = first_larger_index(new_ele)
    @internal_arr.insert(index, new_ele)
  end

  def size
    @internal_arr.size
  end

  def index(target)
    return @internal_arr.index(target)
  end
end
