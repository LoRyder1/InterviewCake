require 'pry'

def convert time
  hours = time.slice(0..1)
  min_sec = time.slice(2..7)
  period = time.slice(8..9)
  
  if period == 'PM' && hours != '12'
    hours = (hours.to_i + 12).to_s
  elsif period == 'AM' && hours == '12'
    hours = '00'
  end
  new_format = hours + min_sec
  new_format
end

# p convert "07:40:33PM"
# p convert "12:40:33PM"
# p convert "12:40:33AM"

# 2
# 4 3
# -1 -3 4 2
# 4 2
# 0 -1 2 1

# YES
# NO

def class_canceled n, array
  late = 0
  array.each do |x|
    if x > 0
      late += 1
    end
  end

  on_time = array.size - late
  if on_time >= n
    "NO"
  else
    "YES"
  end
end

# p class_canceled 7, [26, 94, -95, 34, 67, -97, 17, 52, 1, 86]   # YES
# p class_canceled 3, [-1, -3, 4, 2] # YES 2 on time
# p class_canceled 2, [0, -1, 2, 1]  # NO

# Its digits can only be 3's and/or 5's.
# The number of 3's it contains is divisible by 5.
# The number of 5's it contains is divisible by 3.
# If there are more than one such number, we pick the largest one.
# 1000001≤N≤100000 
# n = digits
# class Integer
#   def digits
#     self.to_s.size
#   end
# end

def decent_num n
  # num_array = []
  # 1.upto(n-1) do |x|
  #   z = n - x
  #   num_array << "3"*x + "5"*z
  # end

  # list = []
  # num_array.map!{|i| i = i.chars}
  # num_array.each do |x|
  #   list.push(x.permutation.map(&:join)) 
  # end

  # list.push(("5"*n), ("3"*n))
  # new_list = list.flatten.uniq.map(&:to_i)
  # answer = []

  # new_list.each do |num|
  #   if num.to_s.size % 3 == 0
  #     answer.push(num)
  #   elsif num.to_s.size % 5 == 0
  #     answer.push(num)
  #   end
  # end

  # answer.empty? ? -1 : answer.max

  num_array = []
  1.upto(n-1) do |x|
    z = n - x
    num_array << "5"*x + "3"*z
  end

  list = []
  num_array.map!{|i| i = i.chars}
  # num_array.map!{|i| i = [i]}

  # num_array.push(("5"*n), ("3"*n))

  answer = []

  num_array.each do |num|
    threes = 0
    fives = 0

    num.each do |digit|
      if digit == '5'
        fives += 1
      elsif digit == '3'
        threes += 1
      end
    end

    if threes % 5 == 0 && fives % 3 == 0
      answer.push(num.join)
    end
  end
  answer.empty? ? -1 : answer.max
  # answer
  # list = num_array.flatten.map(&:to_i)

  # num_array.flatten!.uniq.map(&:to_i)

  # num_array.each do |x|
  #   list.push(x.permutation.map(&:join)) 
  # end

  # list.push(("5"*n), ("3"*n))
  # new_list = list.flatten.uniq.map(&:to_i)
  # answer = []

  # fives = 0
  # threes = 0

  # num_array

  # list.each do |x|
  #   digit = x.to_s.chars
  #   if digit == '5'
  #     fives += 1
  #   elsif digit == '3'
  #     threes += 1
  #   end
  # end


  # list = [55555533333]


  # list.each do |num|

  #     if fives % 3 == 0
  #         answer.push(num)
  #     elsif threes % 5 == 0
  #         answer.push(num)
  #     end
  # end
  # answer
  # answer.empty? ? -1 : answer.max

  # list
end

# p decent_num 1
# p decent_num 3
# p decent_num 5
# p decent_num 11

# -1
# 555
# 33333
# 55555533333

# p %w[a b c].permutation.map &:join

# 555, 553, 535, 355, 533, 335, 333
y = %w(5 5 3).permutation.map{ |x| x.join }
x = %w(5 3 3).permutation.map{ |x| x.join }
# 33, 55, 35, 53
a = %w(5 3).permutation.map(&:join)

# p a
# p y
# p x.uniq

# 553, 533
# digits 3

n = 3
arr = []
1.upto(n-1) do |x|
  z = n - x
  arr << "3"*x + "5"*z
end

# p arr






