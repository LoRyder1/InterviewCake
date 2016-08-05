require 'pry'

def lisas_workbook prbs, prb_per_chap

  pages = []
  # figure out problems per page
  prb_per_chap.each do |chap|
    num = chap / prbs
    remainder = chap % prbs
    num.times { pages << prbs }
    pages << remainder unless remainder.zero?
  end

  # run through of problems in each chapter

  prb_per_chap.map!{ |x| (1..x).to_a }.flatten!.reverse!


  # using pop means go through problems in reverse
  # create separate array for each page = max 3 probs
  pages.map!{ |x| prb_per_chap.pop(x) }

  count = 0
  # count special problems
  pages.each_with_index{ |x, xi| count += 1 if x.include? (xi+1) }

  count
  
end

# p lisas_workbook 3, [4,2,6,1,10]

# ==================== STRINGS ========================

def pangram sent
  sent.chars.delete_if{ |x| x == ' '}.map!(&:downcase).uniq.sort == ('a'..'z').to_a
end

# p pangram "We promptly judged antique ivory buckles for the next prize"

def alternating_char string
  arr = string.chars
  count = 0

  arr.each_with_index do |x,xi|
    if xi > 0
      if arr[xi-1] == 'A'
        count +=1 unless x == 'B'
      else
        count +=1 unless x == 'A'
      end
    end
  end
  count
end

# p alternating_char 'AAAA'
# p alternating_char 'BBBBB'
# p alternating_char 'ABABABAB'
# p alternating_char 'BABABA'
# p alternating_char 'AAABBB'

# def love_letter string
#   arr = string.chars
#   alpha = ('a'..'z').to_a
#   count = 0

#   arr.each_with_index do |x,xi|

#     # while char does not equal opposite char loop
#     while arr[xi] != arr[-(xi+1)]
#       # define opposite char
#       opposite = arr[-(xi+1)]
#       # define which char you need to change
#       cur_letter = [arr[xi], opposite].max
#       # define index of char in alphabet
#       alpha_index = alpha.index(cur_letter)
#       # define new char from alphabet by stepping back one
#       new_char = alpha[alpha_index-1]

#       # change only the char you need to change
#       if opposite > arr[xi]
#       # opposite char equals one step back in alphabet
#         arr[-(xi+1)] = new_char
#       # increment count
#         count += 1
#       else
#         # otherwise char equals one step back in alphabet
#         arr[xi] = new_char
#         count += 1
#       end
#     end
#   end
#   count 
# end

def love_letter string
  arr = string.chars
  alpha = ('a'..'z').to_a
  count = 0

  arr.each_with_index do |x,xi|
    
    while arr[xi] != arr[-(xi+1)]
      opposite = arr[-(xi+1)]
      cur_letter = [arr[xi], opposite].max
      a_index = alpha.index(cur_letter)
      new_char = alpha[a_index-1]

      if opposite > arr[xi]
        arr[-(xi+1)] = new_char
        count +=1
      else
        arr[xi] = new_char
        count +=1
      end
    end
  end
  count
  
end

# p love_letter 'abc'
# p love_letter 'abcba'
# p love_letter 'abcd'
# p love_letter 'cba'

# comments

def gem_element arr
  size = arr.size
  freq = Hash.new(0)
  count = 0

  arr.map!(&:chars).map!(&:uniq).flatten!

  arr.each{ |key| freq[key]+=1 }

  freq.each{ |k,v| count+=1 if v == size }

  count  
end

# a = ['abcdde','baccd','eeabg']

# p gem_element a

def funny string
  arr = string.chars
  count = 0

  arr.each_with_index do |x, xi|
    if xi > 0
      s1 = (x.ord - arr[xi-1].ord).abs
      s2 = (arr[-(xi+1)].ord - arr[-xi].ord).abs
      s1 == s2 ? count +=1 : break
    end
  end
  puts count == arr.size-1 ? 'Funny' : 'Not Funny'  
end

# funny 'acxz'
# funny 'bcxz'

def anagram string

  mid = (string.size/2) -1
  s1 = string.slice(0..mid).chars
  s2 = string.slice(mid+1..-1).chars
  freq = Hash.new(0)
  count = 0

  s1.each{ |key| freq[key]+=1 }

  s2.each do |letter|
    freq[letter] > 0 ? freq[letter] -= 1 : count += 1
  end
  
  string.size.even? ? count : -1
end

# 3
# 1
# -1
# 2
# 0
# 1

# x = ['aaabbb','ab','abc','mnop','xyyx','xaxbbbxx']
# x = ['xyyx']

# x.each do |x|
#   p anagram x
# end

def palindrome_index string
  s1 = string.chars
  s2 = string.reverse.chars
  indexes = []

  if s1 == s2
    puts -1
  else
    s1.each_with_index do |x,xi|
      if x != s2[xi]
        indexes << xi
      end
    end

    s1.delete_at(indexes.first)

    puts s1 == s1.reverse ? indexes.first : indexes.last
  end
end

# x = ['aaab','baa','aaa','aaba']

# x.each do |y|
#   palindrome_index y
# end

def two_strings a, b
  s1 = a.chars.uniq
  s2 = b.chars.uniq
  substring = false

  s2.each do |letter|
    if s1.include? letter
      substring = true
      break
    end
  end

  puts substring ? 'YES' : 'NO'

end

# two_strings 'hello', 'world'
# two_strings 'hi', 'world'

def game_of_thrones string
  s1 = string.chars
  freq = Hash.new(0)  
  count = 0
  found = false

  s1.each{ |key| freq[key]+=1 }

  freq.each{ |k,v| count +=1 if v.odd? }

  found = true if count < 2

  puts found ? 'YES' : 'NO'
end

# game_of_thrones 'aaabbbb'
# game_of_thrones 'cdefghmnopqrstuvw'

def make_anagram a, b
  s1 = a.chars
  s2 = b.chars
  freq = Hash.new(0)
  count = 0

  s1.each{ |key| freq[key] += 1 }

  s2.each{ |letter| freq[letter] -= 1 }

  freq.each{ |k,v| count += v.abs }

  puts count
end

# make_anagram 'cde', 'abc'


# ========= SEARCH ================



# def sherlock_array arr
#   left_indx = 0
#   right_indx = arr.size-1

#   left_sum = arr[left_indx]
#   right_sum = arr[right_indx]

#   while left_indx != right_indx
    
#     if left_sum < right_sum
#       left_indx += 1
#       left_sum += arr[left_indx]
#     else
#       right_indx -= 1
#       right_sum += arr[right_indx]
#     end

#     binding.pry
#   end

#   puts left_sum == right_sum ? 'YES' : 'NO'
# end


def sherlock_arr arr
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

# sherlock_arr [1,2,3]
# sherlock_arr [1,2,3,3]
# sherlock_arr [2,2,1,1]

def ice_cream m, flavors
  for i in 0...flavors.size do
    for j in i+1...flavors.size do
      if flavors[i] + flavors[j] == m
        return [i+1, j+1]
      end
    end
  end
end

# p ice_cream 4, [1,4,5,3,2] # 1,4
