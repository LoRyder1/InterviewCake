require 'pry'
require 'pp'

# t = gets.strip.to_i
# for a0 in (0..t-1)
#     n,k = gets.strip.split(' ')
#     n = n.to_i
#     k = k.to_i
    
#     f = Math.sqrt(n)
#     s = Math.sqrt(k)
    
#     count = 0
#     integers = (s - f)
    
#     if integers > 1
#         count = integers.ceil
#     elsif f == s
#         count = 1
#     else
#         nil
#     end
#     puts count
# end



# def decent_num n
#   num_array = []
#   1.upto(n-1) do |x|
#     z = n - x
#     num_array << "5"*x + "3"*z
#   end

#   num_array.push(("5"*n), ("3"*n))

#   num_array.map!{|x| x.split("")}
  
#   num_array.each do |x|
#     x.map!(&:to_i)
#   end

#   num_array

  # answer = []

  # num_array.each do |num|
  #   threes = 0
  #   fives = 0

  #   num = num.split("").map(&:to_i)

  #   num.each do |digit|
  #     if digit > 3
  #       fives += 1
  #     else
  #       threes += 1
  #     end
  #   end

  #   if threes % 5 == 0 && fives % 3 == 0
  #     num = num.inject{|a,i| a*10 + i}
  #     answer.push(num)
  #   end
  # end
  # answer.empty? ? -1 : answer.max
# end

# p decent_num 1
# p decent_num 3
# p decent_num 5
# p decent_num 11

# p decent_num 5
# p decent_num 2194
# p decent_num 12002
# p decent_num 21965
# p decent_num 55140
# p decent_num 57634


# def grow cycles

#   height = 1

#   (1..cycles).each do |x|
#     if x.odd?
#       height = height*2
#     else
#       height +=1
#     end
#   end
  
#   height  
# end

# p grow(0)
# p grow(1)
# p grow 2 # 3
# p grow 4

# The number 12 is broken into two digits, 1 and 2. When 12 is divided by either of those digits, the calculation's remainder is 00; thus, the number of evenly-divisible digits in 1212 is 22.

# def counting n
#   digits = n.to_s.split("")
#   digits.map!(&:to_i)
#   count = 0
#   digits.each do |x|
#     if x == 0
#       nil
#     elsif n % x == 0
#       count +=1
#     end
#   end
#   count
# end

# p counting 12
# p counting 1012

def chocolate n, c, m
  num_choc = n / c # 3 choc

  bonus = num_choc / m
  leftover_wrappers = (num_choc % m) + bonus
  bonus2 = leftover_wrappers / m

  num_choc += bonus + bonus2
  num_choc
end

# 10 2 5

# p chocolate 10,2,5 #6
# p chocolate 12,4,4 #6
# p chocolate 6,2,2 #6


# 3 9
# 17 24


def square x, y
  arr = []
  (1..y).each do |z|
    arr.push(z*z)
  end
  arr
  # count = 0
  # (x..y).each do |z|
  #   if arr.include? z
  #     count += 1
  #   end
  # end
  # count
end

squares = [1, 4, 9, 16, 25, 36, 49, 64, 81]




@cache = Hash.new
# (1..(10**7)).each do |x|
#   a = Math.sqrt(x)
#   if a % 1 == 0
#     @cache[x] = a.to_i
#   end
# end

# ((10**7)..(10**8)).each do |x|
#   a = Math.sqrt(x)
#   if a % 1 == 0
#     @cache[x] = a.to_i
#   end
# end

 # Count all integers found between the square roots given.

# def is_square? x, y

#   # count = 0
#   # (x..y).each do |x|
#   #   if @cache.key?(x)
#   #     count += 1
#   #   end
#   # end
#   # count
#   a = Math.sqrt(x).ceil
#   b = Math.sqrt(y).ceil

#   # puts a
#   # puts b
#   # puts b - a

#   count = 0
#   integers = (b -a)
#   integers

#   if integers > 1
#     count += integers
#   elsif a == b && a % 1 == 0
#     count += 1
#   else
#     nil
#   end
#   # count

#   # count = 0
#   if Math.sqrt(x) % 1 == 0
#     count += 1
#   elsif Math.sqrt(y) % 1 == 0
#     count += 1
#   end



#   count

# end

# p is_square? 3, 9 # 2
# p is_square? 3, 10 # 2
# p is_square? 3, 8 # 1
# p is_square? 4, 4
# p is_square? 17, 24
# p is_square? 15, 26 # 2
# p is_square? 15, 15 # 2

# p square 3, 9
# p square 17, 24

# Memoization. Sometimes Math methods, and more complex calculations involving many calls, are slow. We can use a memoization approach to avoid calculating the same thing twice.

# Here:
# We use a cache (a Hash) and check to see if it contains the square root of the argument.
# Hash
# Then:
# We fetch the square root from the Hash, avoiding sqrt, when possible. We reduce an operation to a lookup.
# Tip:
# For slow computations, this can improve performance. But it will make fast computations slower than before.

# def check_sqrt(a, cache)
#     # See if the cache contains a square root for this argument.
#     if cache.key?(a)
#       return cache[a]
#     end

#     # Compute square root and memoize it.
#     cache[a] = Math.sqrt(a)
#     return cache[a]
# end

# Use memoize square root method with Hash.
# cache = Hash.new()
# puts check_sqrt(9, cache)
# puts check_sqrt(9, cache)


squares = [1, 4, 9, 16, 25, 36, 49, 64, 81]

def how_many_sq x, y
  count = 0
  a = Math.sqrt(x).ceil
  b = Math.sqrt(y).floor
    # count = 0
    # f = Math.sqrt(n).ceil
    # s = Math.sqrt(k).floor
  integers = b - a
  
  count = integers
  
  if f % 1 == 0 && s % 1 == 0
      count += 1
  elsif s.ceil - f.ceil == 0
      count = 0
  end
      
  puts count
  
end

# p how_many_sq 5, 80 # 6
# p how_many_sq 3, 9 # 2
# p how_many_sq 17, 24 # 0
# puts "====="

# p how_many_sq 4, 15 # 2
# p how_many_sq 4, 16 # 3
# p how_many_sq 4, 9 # 2

# puts "======="
# p how_many_sq 5, 16 # 2
# p how_many_sq 5, 10 # 1
# p how_many_sq 5, 17 # 2
# puts "===="
# p how_many_sq 2, 17 # 3
# p how_many_sq 2, 16 # 3
# p how_many_sq 3, 9 # 2
# p how_many_sq 4, 4 # 1
# p how_many_sq 17, 24 # 0

def decent_num num

  arr = []

  if num % 5 == 0
    arr << ("3"*num).to_i
  end

  num.downto(1).each do |fi|
    th = num - fi
    if th % 5 == 0 && fi % 3 == 0
      arr << ("5"*fi + "3"*th).to_i
      break
    end
  end


  if arr.empty?
    -1
  else
    arr.max
  end

end

    # answer = 0
    # wr = 0

    # # write code to compute answer

    # while A>0 and A >= B:
 
    #     A -= B ; answer +=1
    #     wr +=1
    #     if wr == C1:
    #         answer +=1
    #         wr = 1


  # total = 0

  # total += money / price

  # num_wrap = total

  # while(num_wrap >= wrappers)
  #   bonus = num_wrap/wrappers
  #   remainder = num_wrap % wrappers

  #   total += bonus
  #   num_wrap -= wrappers*(bonus)
  #   num_wrap += remainder
  # end

  # total


def buy_choc money, price, num_wr

  total = 0

  total += money /price

  total_wr = total

  while total_wr >= num_wr
    bonus = total_wr / num_wr
    remainder = total_wr % num_wr

    total += bonus

    total_wr = bonus + remainder
  end
  total

end
# p buy_choc(4586, 14, 98) == 330
# p buy_choc(43203, 60, 5) == 899
# p buy_choc 10,2,5  #6
# p buy_choc 12,4,4 #3 
# p buy_choc 6,2,2 #5

# 2 3 1 2 3 2 3 3

# 0 3
# 4 6
# 6 7
# 3 5
# 0 7

def service_lane lane, enter, exit
  segment = []
  (enter..exit).each do |x|
    segment << lane[x]
  end
  width = segment.min
  
end 

lane = [2,3,1,2,3,2,3,3]

# p service_lane lane, 0, 3

def cut_sticks sticks
  
  # num_cut = []
  # min_length = sticks.min
  # sticks.map!{|x| x-min_length}
  # num_cut << sticks.length
  # num_cut

  num_cut = []

  while sticks.length != 0

    min_length = sticks.min
    sticks.map!{|x| x-min_length}
    num_cut << sticks.length

    sticks.reject!{|x| x < 1}
  end

  num_cut

end

# sticks = [5,4,4,2,2,8]
# p cut_sticks sticks

def spec_prob prob, num_probs
  count = 0
  pages = []

  num_probs.each do |x|
    num = x / prob
    leftover = x % prob
    if x >= prob
      num.times{ pages.push(prob) }
    end
    if leftover != 0
      pages.push(leftover)
    end
  end

  # p num_probs
  # p pages

  the_pages = []
  num_probs.each do |x|
    pr = (1..x).to_a
    the_pages.push(pr)
  end

  the_pages.flatten!.reverse!
  # p the_pages

  pages_to_probs = []

  pages.each_with_index do |x, i|
    page = the_pages.pop(x)
    pages_to_probs << page
  end

  # p pages_to_probs

  pages_to_probs.each_with_index do |x,i|
    if x.include?(i+1)
      count += 1
    end
  end

  p count

end


# probs = [3, 8, 15, 11, 14, 1, 9, 2, 24, 31]

# spec_prob 5, probs

def cavity grid
  # copy_g = grid

  # # size = copy_g[0].length

  # copy_g.delete_at(size-1)
  # copy_g.delete_at(0)

  # copy_g[0].delete_at(size-1)
  # copy_g[0].delete_at(0)

  # # p copy_g

  # center = []

  # size = grid.size -1


  # (1..size).each do |i|
  #   j = size - i
  #   center << [i,j]
  #   center << [i,j+1]
  # end
  # p center

center = []
cavity = []
size = grid.size-1

copy_g = grid

grid.each_with_index do |x, xi|
  x.each_with_index do |y, yi|


    if xi != 0 && yi != 0 && xi != size && yi != size
      # p "element [#{xi}, #{yi}] is #{y}"
      center << [xi, yi]

      if grid[xi][yi + 1] < y && grid[xi][yi - 1] < y
        cavity << [xi, yi]
        copy_g[xi][yi] = 'X'
      end

    end
  end
end

p center
p cavity
p copy_g

end

# grid = [[1,1,1],
#         [1,9,1],
#         [1,8,9]]

# grid = [[1,1,1,2],
#         [1,9,1,2],
#         [1,8,9,2],
#         [1,2,3,4]]

# def cavity n, grid
  
#   center
# end

# grid =  ["1112", "1912", "1892", "1234"]
grid =  ["1612", "1512", "1492", "1234"]

n = 4

# ["1112",
#  "1912", 
#  "1892", 
#  "1234"]

# ["1412",
#  "1512", 
#  "1692", 
#  "1234"]


new_grid = []

grid.each do |x|
  # new_grid << x.split('').map(&:to_i)
  new_grid << x.split('')
end

center = []

copy_g = new_grid

cavity = []

# new_grid.each_with_index do |x, xi|
#   x.each_with_index do |y, yi|

#     if xi !=0 && yi !=0 && xi != n-1 && yi != n-1
#       center << [xi, yi]

#       if new_grid[xi][yi +1] < y && new_grid[xi][yi -1] < y && new_grid[xi+1][yi] < y && new_grid[xi-1][yi] < y
#         cavity << [xi, yi]
#         copy_g[xi][yi] = 'X'
#       end
#     end
#   end
# end

# copy_g.each do |x|
#   puts x.join.to_s
# end



# abc =
# '179443854
# 961621369
# 164139922
# 968633951
# 812882578
# 257829163
# 812438597
# 176656233
# 485773814'


# ghi = '
# 179443854
# 961X21369
# 164139922
# 96X633951
# 812882578
# 25782X163
# 8124385X7
# 176656233
# 485773814'

# puts abc

# copy_g = my_grid

# my_grid.each_with_index do |x,xi|
#     x.each_with_index do |y,yi|
        
#         if xi != 0 && yi != 0 && xi != n-1 && yi != n-1
#             if my_grid[xi][yi+1] < y && my_grid[xi][yi-1] < y
#                 copy_g[xi][yi] = 'X'
#             end
#         end
#     end
# end

# copy_g.each do |x|
#     puts x.join.to_s
# end

def convert_sent sent
  # y = []
  # sent.split(' ').each do |x|
  #   y << x.split('')
  # end
  # y
  # sent.split(' ').map(&:chars)

  alpha = ('a'..'z').to_a

  sent.chars.map(&:downcase).reject{ |x| x == ' ' }.uniq.sort == alpha
  sent.chars.map(&:downcase).reject{ |x| x == ' ' }.uniq.push('x').sort == alpha

end


# p convert_sent 'We promptly judged antique ivory buckles for the prize'


# def check_alt string
#   count = 0

#   firstL = string[0]
#   string[0] = ''
#   firstA = firstL == 'A'
#   firstB = firstL == 'B'

#   arr = string.chars

#   indexes = (1..(string.length+1)).to_a

#   index_to_del = []

#   forB = false

#   arr.each_with_index do |x,xi|
#     # puts "#{x} with index:#{xi}"
#     if firstA
#       if x != 'B' && !forB
#         index_to_del << xi +1
#       else
#         forB = true
#       end
#     end

#     if firstB
#       if x != 'A' && forB
#         index_to_del << xi + 1
#       else
#         forB = false
#       end
#     end



#   end

#   index_to_del
# end

def check_alt string
  count = 0  
  arr = string.chars

  arr.each_with_index do |x, xi|
    if xi > 0

      if arr[xi-1] == 'A'
        if x != 'B'
          count +=1
        end
      end

      if arr[xi-1] == 'B'
        if x != 'A'
          count += 1
        end
      end
    end
  end

  count
  
end


# x = 'AAAA'
# y = 'BBBBB'
# z = 'ABABABAB'
# a = 'BABABA'
# b = 'AAABBB'

# p check_alt x
# p check_alt y

# p check_alt z

# p check_alt a
# p check_alt b

def love_letter string

  count = 0

  arr = string.chars

  alpha = ('a'..'z').to_a

  arr.each_with_index do |x,xi|
    while arr[xi] != arr[-(xi+1)]
      opposite = arr[-(xi+1)]
      cur_letter = [arr[xi], opposite].max

      alpha_index = alpha.index(cur_letter)

      if opposite > arr[xi]
        arr[-(xi+1)] = alpha[alpha_index - 1]
        count += 1
      end

      if arr[xi] > opposite
        arr[xi] = alpha[alpha_index-1]
        count +=1
      end

    end
  end

  count

end

# a = 'abc'
# c = 'abcba'
# d = 'abcd'
# e = 'cba'


# p love_letter a
# p love_letter c
# p love_letter d
# p love_letter e


def gem_stones array

  gem_list = []

  array.map! do |x|
    x.chars.uniq.sort
  end

  sum_of_array = array.flatten
  freq = Hash.new(0)
  sum_of_array.each do |key|
    freq.store(key, freq[key]+1)
  end
  freq.each do |key, value|
    if value == array.size
      gem_list << key
    end
  end
  gem_list  
end

# a = 'abcdde'
# b = 'baccd'
# c = 'eeabg'

# p gem_stones [a,b,c]

def funny_string string
  my_string = string.chars
  rev_string = string.reverse.chars

  count = 0

  my_string.each_with_index do |x, xi|

    if xi > 0
      my_funny = (x.ord - (my_string[xi-1].ord)).abs
      rev_funny = (my_string[-(xi+1)].ord - my_string[-xi].ord).abs

      if my_funny == rev_funny
        count +=1
      else
        break
      end

    end

  end

  if count == (my_string.size) -1
    return true
  else
    false
  end

end

# a = 'acxz'
# b = 'bcxz'

# p funny_string a
# p funny_string b








