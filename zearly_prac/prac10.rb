require 'pp'
class PP
  class << self
    alias_method :old_pp, :pp
    def pp(obj, out = $>, width = 40)
      old_pp(obj, out, width)
    end
  end
end

# Given a sorted list with an unsorted number e in the rightmost cell, can you write some simple code to insert e into the array so that it remains sorted?

# Print the array every time a value is shifted in the array until the array is fully sorted. The goal of this challenge is to follow the correct order of insertion sort.

# Guideline: You can copy the value of e to a variable and consider its cell "empty". Since this leaves an extra cell empty on the right, you can shift everything over until V can be inserted. This will create a duplicate of each value, but when you reach the right spot, you can replace it with e.

def insertion_sort ar
  e = ar.last
  rev = ar.reverse
  
  rev.each_with_index do |x, xi|
    unless rev[xi+1] == nil
      if e < rev[xi+1]
        rev[xi] = rev[xi+1]
        puts rev.reverse.join(' ')
      else
        rev[xi] = e
        puts rev.reverse.join(' ')
        break
      end
    end
    if xi == rev.size-1 && e < rev[xi]
      rev[xi] = e
      puts rev.reverse.join(' ')
    end
  end
end

# insertion_sort [2,4,6,8,3]

# In Insertion Sort Part 1, you sorted one element into an array. Using the same approach repeatedly, can you sort an entire unsorted array?

# Guideline: You already can place an element into a sorted array. How can you use that code to build up a sorted array, one element at a time? Note that in the first step, when you consider an element with just the first element - that is already "sorted" since there's nothing to its left that is smaller.

# In this challenge, don't print every time you move an element. Instead, print the array after each iteration of the insertion-sort, i.e., whenever the next element is placed at its correct position.

# Since the array composed of just the first element is already "sorted", begin printing from the second element and on.

# Time complexity O(n^2)

def insertionSort(ar)
  for i in 1..(ar.size-1)   
    cur_el = ar[i]
    j = i -1
    while j >= 0 and ar[j] > cur_el
      ar[j+1] = ar[j]
      j = j -1
    end
    ar[j+1] = cur_el
    puts ar.join(' ')
  end
end

# insertionSort [1,4,3,5,6,2]

# Divide and Conquer Algorithm

def partition( ar) 
  p = ar[0]
  left = []
  equal = []
  right = []
  
  ar.each do |x|
    if p == x
      equal.push(x)
    elsif x < p
      left.push(x)
    else
      right.push(x)
    end
  end
  final_arr = left + equal + right
  puts final_arr.join(' ')
end

# partition [4,5,3,7,2]

#======   Partitioning and Merging   ===========

# In Insertion Sort, you simply went through each element in order and inserted it into a sorted sub-array. In this challenge, you cannot focus on one element at a time, but instead must deal with whole sub-arrays, with a strategy known as "divide and conquer".

# When partition is called on an array, two parts of the array get 'sorted' with respect to each other. If partition is then called on each sub-array, the array will now be split into four parts. This process can be repeated until the sub-arrays are small. Notice that when partition is called on just one numbers, they end up being sorted.

# Can you repeatedly call partition so that the entire array ends up sorted?

def partition2 arr
  pivot = arr.first
  part = arr[1..-1].partition{ |e| e < pivot}
  return[part[0].size,part[0]+[pivot]+part[1]]
end

def quicksort arr
  return arr if arr.size<2
  n,arr=partition2(arr)
  answer=quicksort(arr[0...n])+[arr[n]]+quicksort(arr[(n+1)..-1])
  puts answer*' '
  answer
end

# quicksort [5,8,1,3,7,9,2]


# Watson gives Sherlock an array AA of length NN. Then he asks him to determine if there exists an element in the array such that the sum of the elements on its left is equal to the sum of the elements on its right. If there are no elements to the left/right, then the sum is considered to be zero. 
# Formally, find an ii, such that, AA1+A+A2...A...Ai-1 =A=Ai+1+A+Ai+2...A...AN.

def sherlock_array arr
  left_i = 0
  right_i = arr.size-1
  
  left = arr[left_i]
  right = arr[right_i]
  
  while left_i != right_i
    if left < right
      left_i += 1
      left += arr[left_i]
    else
      right_i -= 1
      right += arr[right_i]
    end 
  end
  
  puts left == right ? 'YES' : 'NO'
end

# sherlock_array [1,2,3]
# sherlock_array [1,2,3,3]


# Sunny and Johnny together have MM dollars they want to spend on ice cream. The parlor offers NN flavors, and they want to choose two flavors so that they end up spending the whole amount.

# You are given the cost of these flavors. The cost of the iithth flavor is denoted by ccii. You have to display the indices of the two flavors whose sum is MM.


def ice_cream_parlor num, arr
  for i in (0...arr.size) do
    for j in (i+1...arr.size) do
      if arr[i] + arr[j] == num
        puts "#{i+1} #{j+1}"
        break; break;
      end
    end
  end
end

# ice_cream_parlor 4, [1,4,5,3,2]
# ice_cream_parlor 4, [2,2,4,3]


def max_subarray arr
  neg = []
  pos = []
  
  arr.each do |x|
    x < 0 ? neg << x : pos << x
  end
  
  sum = pos.reduce(:+)
  final = []
  
  if pos.empty?
    final << neg.max
    final << neg.max 
  elsif neg.empty? || neg.size == 1
    final << sum
    final << sum
  else
    final << sum + neg.max
    final << sum
  end    
  puts final.join(' ')  
end

# max_subarray [1,2,3,4]
# max_subarray [2,-1,2,3,4,-5]



# Given an array containing positive and negative integers, return the maximum sum that
# can be generated from any contiguous set.

# For example in the following array:
# [-4,  5,  5, -7,  4, -1,  8, -6]
# The maximum subarray value is 14 coming from the continuous set [5,  5, -7,  4, -1,  8].

def max_subarray( arr )
  max = 0

  # choose a starting point in the array
  (0..arr.length-1).each do |start|
    result = 0

    # loop forward through array elements
    (start..arr.length-1).each do |num|
      result += arr[num]
      max = result if result > max
    end
  end

  puts max
end

# max_subarray [-4,  5,  5, -7,  4, -1,  8, -6]  # 14
# max_subarray [ 2, -3,  6,  5, -1,  2, -4,  3]  # 12
# max_subarray [ 2,  5, -8, -3,  8, -2, -9,  7]  # 8
# max_subarray [-4, -3,  6,  6, -9,  4, -9,  8]  # 12

def max_subarray2(xs)
  xs.inject([0, 0]) do |(max_so_far, max_up_to_here), x|
    new_max_up_to_here = [max_up_to_here + x, 0].max
    new_max_so_far = [max_so_far, new_max_up_to_here].max
    [new_max_so_far, new_max_up_to_here]
  end.first
end

def max_subarray3 arr
  arr.reduce([0,0]) do |(max_so_far, max_up_to_here), x|
    new_max_up_to_here = [max_up_to_here + x, 0].max
    new_max_so_far = [max_so_far, new_max_up_to_here].max
    [new_max_so_far, new_max_up_to_here]
  end.first
end

# xs = [31, -41, 59, 26, -53, 58, 97, -93, -23, 84]
# p max_subarray2(xs) #=> 187
# p max_subarray2 [-1 -2 -3 -4 -5 -6]  # -1

# p max_subarray3(xs) #=> 187


# This is a well-known problem that displays overlapping optimal substructure, which suggests a dynamic programming (DP) solution. Although DP solutions are usually quite tricky (I think so at least!), this one is a great example to get introduced to the whole concept.

# The first thing to note is that the maximal subarray (which must be a contiguous portion of the given array A) ending at position j either consists of the maximimal subarray ending at position j-1 plus A[j], or is empty (this only occurs if A[j] < 0). In other words, we are asking whether the element A[j] is contributing positively to the current maximum sum ending at position j-1. If yes, include it in the maximal subarray so far; if not, don't. Thus, from solving smaller subproblems that overlap we can build up an optimal solution.

# The sum of the maximal subarray ending at position j can then be given recursively by the following relation:

# sum[0] = max(0, A[0])
# sum[j] = max(0, sum[j-1] + A[j])
# We can build up these answers in a bottom-up fashion by scanning A from left to right. We update sum[j] as we consider A[j]. We can keep track of the overall maximum value and the location of the maximal subarray through this process as well.
# This is clearly a linear O(N) algorithm since only one pass through the list is required. 


def DP_solve arr
  max, head, tail = 0, 0, 0
  cur_head = 0
  sum = [ [0, arr[0]].max ] # base case
  (1...arr.size).each do |j|
    sum[j] = [0, sum[j-1] + arr[j]].max # bottom-up
    p sum[j]
    cur_head = j if sum[j-1] == 0 and sum[j] > 0
    if sum[j] > max
      head = cur_head
      tail = j
      max = sum[j]
    end
  end
  return max, head, tail
end

# Time complexity O(N)

# p DP_solve [-4,5,5,-7,4,-1,8,-6]  # 14
# p DP_solve [-1,-2,-3,-4,-5, -6]  # -1
# p DP_solve [1,-2,-3,-4,-5, -6]  # 1

# p DP_solve [1]  # 1
# p DP_solve [1,-2]  # 1

# p DP_solve [1,2,3]  # 
# p DP_solve [-10]  # 
# p DP_solve [1,-1,-1,-1,-1,5]  # 


# xs = [31, -41, 59, 26, -53, 58, 97, -93, -23, 84]
# p max_subarray2(xs) #=> 187
# p DP_solve(xs) #=> 187


def xmax_subarray arr
  pos = []
  arr.each{ |x| pos << x if x > 0 }
  pos_sum = pos.reduce(:+)

  max_ending_here = max_so_far = arr.shift
  arr.each do |x|
    max_ending_here = [x, max_ending_here + x].max
    max_so_far = [max_so_far, max_ending_here].max
  end

  if pos.empty?
    puts "#{max_so_far} #{max_so_far}"
  else
    puts "#{max_so_far} #{pos_sum}"
  end
  # max_so_far
end

# xmax_subarray [-4,5,5,-7,4,-1,8,-6]  # 14
# xmax_subarray [-1,-2,-3,-4,-5, -6]  # -1
# xmax_subarray [1]  # 1
# xmax_subarray [1,2,3,4]
# xmax_subarray [2,-1,2,3,4,-5]

# Time complexity O(N) using Kadane's algorithm 

# Because of the way this algorithm uses optimal substructures (the maximum subarray ending at each position is calculated in a simple way from a related but smaller and overlapping subproblem: the maximum subarray ending at the previous position) this algorithm can be viewed as a simple example of dynamic programming.

# Kadane's algorithm consists of a scan through the array values, computing at each position the maximum (positive sum) subarray ending at that position. This subarray is either empty (in which case its sum is zero) or consists of one more element than the maximum subarray ending at the previous position. The algorithm only needs to keep track of the ending position because the implied starting position is just after the last position the sum went negative, and you can always get a higher sum by dropping any negative-sum prefix. 
# Kadane's Algo - look at each index and figure out max sum subarray ending at this index. 

def the_max_subarray arr
  max_ending_here = max_so_far = arr.shift
  arr.each do |x|
    max_ending_here = [x, max_ending_here + x].max
    max_so_far = [max_so_far, max_ending_here].max
  end
  p max_so_far
end

# the_max_subarray [-4,5,5,-7,4,-1,8,-6]  # 14
# the_max_subarray [-1,-2,-3,-4,-5, -6]  # -1
# the_max_subarray [1] # 1
# the_max_subarray [1,2,3,4] # 10
# the_max_subarray [2,-1,2,3,4,-5] # 10
# the_max_subarray [31, -41, 59, 26, -53, 58, 97, -93, -23, 84] # 187 


# Maximum Sum Subarray 
# - Brute Force - Time Complexity O(N^2)
# - Kadane's Algo = Time Complexity O(N^2) - divide and conquer method
#  -- but can do much better with Kadane! - can run at linear time O(N)
# - local max subarray is either the current element or current element combined with the previous subarray
# - use this method for every element except for first element

# When I ask these kinds of question, the answer isn't necessarily the goal. The goal is to see how they break down a problem. The main thing I personally look for is:
# 1) identify a brute strength algorithm
# 2) identify that #1 is a brute strength approach
# 3) can they identify any parameters which can limit the problem's scope
# 4) can they improve their #1
# For #3 in this problem the limiting parameter is that the empty set will have a sum of 0 and thus is the case to beat.
# On a related note my personal favorite questions are similar to what you suggest. I just want to state that there is value to these questions. Maybe it isn't the best way all the time and it can be misused, but it isn't useless.




# ======== Count the number of negative numbers row wise and column wise ===========
# Worst case time complexity is O(N*M) - n is the #of rows, m is the #of columns.
# Optimal = starting from last element in row find first negative number and record its position = now you know that all to the left is negative. - Time complexity is O(N+M) - n = rows, m = columns

# def count_neg_num grid
#   # pp grid
#   count = 0
#   grid.each_with_index do |x,xi|
#     x.each_with_index do |y,yi|
#       i = xi
#       j = yi -1
#       while j >= 0 and i < grid.size
#         if grid[i][j] < 0
#           count += (j+1)
#           i += 1
#         else
#           j -= 1
#         end
#       end
#         p count
#     end
#   end
#   p count
# end


def count_neg_num grid
  count = 0

  rows = grid[0].size
  grid.each_with_index do |x,xi|
    x.reverse.each_with_index do |y,yi|
      if y < 0
        count += rows - yi
        break
      end
      p y
    end
  end
  p count
end

grid = [[-3,-2,-1,1],
        [-2,2,3,4],
        [4,5,7,8]]

count_neg_num grid
# 7 vs 12 Naive solution O(N*M) vs Optimal solution O(N+M)