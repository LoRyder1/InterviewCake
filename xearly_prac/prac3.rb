require 'pry'

def anagram string

  my_string = string

  size = string.size
  mid = (size/2) - 1
  
  arr1 = my_string.slice!(0..mid).chars.sort
  arr2 = my_string.chars.sort

  freq1 = Hash.new(0)
  arr1.each do |key|
    freq1.store(key,freq1[key]+1)
  end

  count = 0

  arr2.each_with_index do |x,xi|
    if freq1[x] != nil && freq1[x] > 0
      freq1[x] -= 1
    else
      count +=1
    end
  end

  count

end

# p anagram 'hhpddlnnsjfoyxpciioigvjqzfbpllssuj'

# a = 'xtnipeqhxvafqaggqoanvwkmthtfirwhmjrbphlmeluvoa'

# b = [
# 'aaabbb',
# 'ab',
# 'abc',
# 'mnop',
# 'xyyx',
# 'xaxbbbxx']

# d = [
# 'hhpddlnnsjfoyxpciioigvjqzfbpllssuj',
# 'xulkowreuowzxgnhmiqekxhzistdocbnyozmnqthhpievvlj',
# 'dnqaurlplofnrtmh',
# 'aujteqimwfkjoqodgqaxbrkrwykpmuimqtgulojjwtukjiqrasqejbvfbixnchzsahpnyayutsgecwvcqngzoehrmeeqlgknnb',
# 'lbafwuoawkxydlfcbjjtxpzpchzrvbtievqbpedlqbktorypcjkzzkodrpvosqzxmpad',
# 'vxxzsqjqsnibgydzlyynqcrayvwjurfsqfrivayopgrxewwruvemzy',
# 'xtnipeqhxvafqaggqoanvwkmthtfirwhmjrbphlmeluvoa'
# ]

# d.each do |x|
#   p anagram x
# end

# p anagram 'hhpddlnnsjfoyxpciioigvjqzfbpllssuj'


# ["a", "a", "a", "b"]
# ["b", "a", "a", "a"]

def palindrome_index string
  s1 = string.chars
  s2 = s1.reverse

  if s1 == s2
    -1
  else
    index = []

    s1.each_with_index do |x,xi|
      if x != s2[xi]
        index << xi
      end
    end

    s1.delete_at(index.first)

    # m2 = s1.delete_at(index.last)

    if s1 == s1.reverse
      index.first
    else
      index.last
    end
  end
end

# x = ['aaab','baa','aaa']

# x.each{ |x| p palindrome_index x }


def game_of_thrones string
  s1 = string.chars
  freq = Hash.new(0)
  
  s1.each do |key|
    freq.store(key, freq[key]+1)
  end

  count = 0
  freq.each do |key, value|
    if value.odd?
      count += 1
    end
  end

  if count > 1
    found = 0
  else
    found = 1
  end

  found

end

# p game_of_thrones 'aaabbbb'
# p game_of_thrones 'cdefghmnopqrstuvw'
# p game_of_thrones 'cdcdcdcdeeeef'


def make_anagram word1, word2
  s1 = word1.chars
  s2 = word2.chars

  count = 0

  # s1.each do |x|
  #   if s2.include? x
  #     count +=1
  #   end
  # end  
  # ana = (word1.size - count)*2

  freq = Hash.new(0)
  s1.each do |key|
    freq.store(key, freq[key]+1)
  end
  freq

  s2.each do |x|
    if freq[x] != nil
      freq[x] -= 1
    end
  end

  freq

  freq.each do |key,value|
    if value != 0
      count += value.abs
    end
  end

  count

end

# p make_anagram 'cde', 'abc'

# p make_anagram('cdeadfadafdsfa', 'cdeadfadgfdsfa')
# 30

# x = 'fcrxzwscanmligyxyvym'
# y = 'jxwtrhvujlmrpdoqbisbwhmgpmeoke'

# p make_anagram x,y


def grid_search grid, target
  match = []
  i = 0

  grid.each_with_index do |x,xi|
    x.each_with_index do |y,yi|
      if y == target[i][i] && grid[xi][yi+1] == target[i][i+1] && grid[xi][yi+2] == target[i][i+2]
        match << [xi,yi]
      end
      # if y == target[i+1][i] && grid[xi][yi+1] == target[i+1][i+1]
      #   match << [xi,yi]
      # end
    end
  end
  match

  # if match.size == target.size
  #   puts "YES"
  # else
  #   puts 'NO'
  # end
end

# x = [1,2,3,4]
# y = [2,3]

# x = [[1,2,3,4],
#      [5,6,2,5],
#      [1,2,4,6],
#      [4,3,1,9]]

# y = [[6,2],
#      [2,4]]

x = 

[[7,2,8,3,4,5,5,8,6,4],
[6,7,3,1,1,5,8,6,1,9],
[8,9,8,8,2,4,2,6,4,3],
[3,8,3,0,5,8,9,3,2,4],
[2,2,2,9,5,0,5,8,1,3],
[5,6,3,3,8,4,5,3,7,4],
[6,4,7,3,5,3,0,2,9,3],
[7,0,5,3,1,0,6,6,0,1],
[0,8,3,4,2,8,2,9,5,6],
[4,6,0,7,9,2,4,1,3,7]]

y =

[[9,5,0,5],
[3,8,4,5],
[3,5,3,0]]

# p grid_search x, y

# N = gets().to_i
# (1..N).each do |num|

# # Read in the larger 2D grid

# r,c = gets().strip.split(" ").map{|x|x.to_i}
# text = ""
# (1..r).each do |row|
#         line = gets()
#     text += line.strip
# end

# # Read in the smaller 2D grid  

# r2,c2 = gets().split(" ").map{|x|x.to_i}
# regular = ""
# (1..r2).each do |row|
#     line = gets()
#     regular += line.strip+"[0-9]{#{c-c2}}"
# end

# # Create a regular expression from the search pattern

# r = Regexp.new regular

# position = text.index(r)

# # We don't want to match a case where this pattern might match a block which crosses the edges of the larger 2D grid - we want to match the pattern strictly inside the larger 2D grid  

# while (position!=nil) && ((position%c+c2)>c)
#     warn "looping"
#     position = text.index(r,position+1)
# end
# if position == nil
#     puts "NO"
# else
#     row = (position/c) + 1
#     col = (position%c) + 1
#     puts "YES" 
# end
# each_with_index
# end

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

# 14

# a = [1, 3, 5, 9, 13, 22, 27, 35, 46, 51, 55, 83, 87, 23]
# b = [2, 3, 4, 5, 6, 7, 8, 9, 10, 1]

# p insertion_sort [2,4,6,8,3]

# p insertion_sort(a)

# p insertion_sort(b)

# def insertion2 arr
#   for i in 1..(arr.size-1)
#     cur_el = arr[i]
#     j = i -1
#     while j >= 0 and arr[j] > cur_el
#       arr[j+1] = arr[j] # replace next element with last element if last element is greater
#       j = j -1 # step back and loop again and check if last element is greater than current element
#     end
#     arr[j+1] = cur_el # replace last element with cur element
#     puts arr.join(' ')
#   end
# end





def insertion2 arr
  for i in 1..(arr.size-1)
    cur_el = arr[i]
    j = i -1
    while j >= 0 and arr[j] > cur_el
      arr[j+1] = arr[j]
      j = j-1
    end
    arr[j+1] = cur_el
    puts arr.join(' ')
  end
  
end

# insertion2 [1, 4, 3, 5, 6, 2]
# puts "=============================="
# insertion2 [9, 8, 6, 7, 3, 5, 4, 1, 2]


def quickSort(arr,from,to)
    return if from >= to    
    pivot = arr[from]
    i = from
    for j in (1+from)..to
        if arr[j] < pivot
            i = i + 1
            temp = arr[i]
            arr[i] = arr[j]
            arr[j] = temp
        end 
    end
    quickSort(arr,from,i-1);
    quickSort(arr,i+1,to);
end


# original_array=[2,19,5,4,3,14,2]
# # puts "Sorted Array Using Quick Sort:"
# p quickSort(original_array,0,original_array.length - 1)
# # p original_array

def mergesort(array)
  if array.count <= 1
    # Array of length 1 or less is always sorted
    return array
  end

  # Apply "Divide & Conquer" strategy

  # 1. Divide
  mid = array.count / 2
  part_a = mergesort array.slice(0, mid)
  part_b = mergesort array.slice(mid, array.count - mid)

  # 2. Conquer
  array = []
  offset_a = 0
  offset_b = 0
  while offset_a < part_a.count && offset_b < part_b.count
    a = part_a[offset_a]
    b = part_b[offset_b]
    # Take the smallest of the two, and push it on our array
    if a <= b
      array << a
      offset_a += 1
    else
      array << b
      offset_b += 1
    end
  end

  # There is at least one element left in either part_a or part_b (not both)
  while offset_a < part_a.count
    array << part_a[offset_a]
    offset_a += 1
  end

  while offset_b < part_b.count
    array << part_b[offset_b]
    offset_b += 1
  end

  return array
end

# 2 3
# 1 2 3
# 7 8 9
# 1 2 3 5 7 8 9
# p mergesort [5, 8, 1, 3, 7, 9, 2]

# def max_subarray( arr )
#   max = 0

#   # choose a starting point in the array
#   (0..arr.length-1).each do |start|
#     result = 0

#     # loop forward through array elements
#     (start..arr.length-1).each do |num|
#       result += arr[num]
#       max = result if result > max
#     end
#   end

#   max
# end

# p max_subarray [2, -1, 2, 3, 4, -5]

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

# p max_subarray [1]
# p max_subarray [-1, -2, -3, -4, -5, -6]
# max_subarray [1, -2]
# max_subarray [1, 2, 3]
# max_subarray [-10]
# max_subarray [1, -1, -1, -1, -1, 5]

# 1
# 1

# 6
# -1 -2 -3 -4 -5 -6

# 2
# 1 -2

# 3
# 1 2 3

# 1
# -10

# 6
# 1 -1 -1 -1 -1 5



# 1 1
# -1 -1
# 1 1
# 6 6
# -10 -10
# 5 6

class Move
  attr_reader :rolls, :position
  
  def initialize(position, rolls)
    @position = position
    @rolls = rolls
  end
end
 
test_cases = gets.chomp.to_i
test_cases.times do
  (ladders_count, snakes_count) = gets.chomp.split(",").map { |e| e.to_i }
  ladders = gets.chomp.split
  snakes = gets.chomp.split
  ladders_hash = Hash.new
  snakes_hash = Hash.new
  ladders.each do |ladder|
    (start_p, end_p) = ladder.split(",").map { |e| e.to_i }
    ladders_hash[start_p] = end_p
  end
  
  snakes.each do |snake|
    (start_p, end_p) = snake.split(",").map { |e| e.to_i }
    snakes_hash[start_p] = end_p
  end
  
  start = Move.new(1, 0)
  moves = []
  moves.push(start)
  rolls_at_hundred = []
  while !moves.empty? do
    move = moves.shift
    actual_position = move.position
    actual_rolls = move.rolls
    
    if actual_position >= 100
      rolls_at_hundred << actual_rolls
      next 
    end
    
    for i in 1..5
      pos = ladders_hash[actual_position + i]
      if !pos.nil?
        new_move = Move.new(pos, actual_rolls + 1)
        moves.push(new_move)
      end
    end
    
    pos = ladders_hash[actual_position + 6]
    if pos.nil?
      without_ladder = Move.new(actual_position + 6, actual_rolls + 1)
      moves.push(without_ladder)
    else
      new_move = Move.new(pos, actual_rolls + 1)
      moves.push(new_move)
    end
  end
 
  rolls_at_hundred.sort! { |k, l| k <=> l}
  puts rolls_at_hundred[0]
end


Partition Function:
    Function Arguments:  A[], startIndex, endIndex, A2[]
          # Array A,
              # we are interested to EXAMINE elements from startIndex to endIndex
          # Array A2 is a copy of A,
              # we are interested to MODIFY  elements from startIndex to endIndex

     # NOTE:
          # i is index for array A
          # j is index for array A2
      # 
     # Assume pivot as 1st element (i.e. at startIndex)
    pivot = A[startIndex]
    j = startIndex
    
    
    # // Aim1:
    # //      Save all elements, smaller than pivot, in A2
    for each element in A, from (startIndex+1) to (endIndex):
        if  element < pivot:
            A2[j] = element
            j++
    
    # // Now we have pivot element position, at j index, save it
    # int pivotIndex = j;
    
    
    # // Aim2:
    # //      Save the pivot, in A2
    A2[j] = pivot
    j++;
    
    
    # // Aim3:
    # //      Save all elements, greater than pivot, in A2
    for each element in A, from (startIndex+1) to (endIndex):
        if  element > pivot:
            A2[j] = element
            j++
    
    # // return the pivotIndex
    return pivotIndex

