#==== Pangrams are sentences constructed from every letter from alpha====

def pangram sent
  sent.chars.map(&:downcase).uniq.reject{ |x| x == ' '}.sort == ('a'..'z').to_a
end

# p pangram "We promptly judged antique ivory buckles for the next prize" # true

# ====minimum number of deletions for alternating character string ====

def alternating_char string
  arr,count = string.chars, 0

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

# p alternating_char 'AAAA'   #  3
# p alternating_char 'BBBBB'
# p alternating_char 'ABABABAB'
# p alternating_char 'BABABA'
# p alternating_char 'AAABBB'

#=== count number of letter changes to get a palindrome by stepping back in alpha ===
# ====palindrome is a word that reads the same forwards and backwards=====

def love_letter string
  arr,count = string.chars,0
  alpha = ('a'..'z').to_a

  arr.each_with_index do |x,xi|
    while arr[xi] != arr[-(xi+1)]
      opposite = arr[-(xi+1)]
      cur_letter = [arr[xi], opposite].max
      a_index = alpha.index(cur_letter) -1
      new_char = alpha[a_index]

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

# p love_letter 'abc'   #   2
# p love_letter 'abcba'
# p love_letter 'abcd'
# p love_letter 'cba'

#=== a gem element is an occurence in each string ===

def gem_element arr
  combo = arr.map(&:chars).map(&:uniq).flatten
  freq,count = Hash.new(0), 0

  combo.each{ |key| freq[key]+=1 }
  freq.each{ |k,v| count +=1 if v == arr.size}
  count
end

# a = ['abcdde','baccd','eeabg']

# p gem_element a   # 2

# ==is string funny? funny = xi - (xi-1) ===

def funny string
  arr,count = string.chars, 0

  arr.each_with_index do |x,xi|
    if xi > 0
      s1 = (x.ord - arr[xi-1].ord).abs
      s2 = (arr[-(xi+1)].ord - arr[-xi].ord).abs

      s1 == s2 ? count +=1 : break
    end
  end
  puts count == arr.size-1 ? 'Funny' : 'Not Funny'
end

# funny('acxz') # == 'Funny'
# funny 'bcxz' # == 'Not Funny'

# ===anagram is word that is formed by rearranging the letters of another===
# figure how many changes would it take to make anagram of second string, if can not be made anagram -> -1

def anagram string
  mid = string.size/2
  s1 = string.slice(0...mid).chars
  s2 = string.slice(mid..-1).chars
  freq,count = Hash.new(0), 0

  s1.each{ |key| freq[key]+=1 }

  s2.each do |letter|
    freq[letter] > 0 ? freq[letter] -=1 : count +=1
  end

  string.size.even? ? count : -1
  
end

# x = ['aaabbb','ab','abc','mnop','xyyx','xaxbbbxx']

# x.each do |x|
#   p anagram x    # 3,1,-1,2,0,1
# end

# ====palindrome is a word that reads the same forwards and backwards===

def palindrome_index string
  s1 = string.chars
  indices = []

  if s1 == s1.reverse
    puts -1
  else
    s1.each_with_index do |x,xi|
      indices << xi if x != s1[-(xi+1)]
    end

    s1.delete_at(indices.first)
    puts s1 == s1.reverse ? indices.first : indices.last
  end
  
end

# x = ['aaab', 'baa', 'aaa', 'aaba']

# x.each do |y|
#   palindrome_index y     # 3,0,-1,1 
# end

#==== is string b a substring of string a?=====

def two_strings a,b
  substring = false

  b.chars.each do |letter|
    if a.chars.include? letter
      substring = true
      break
    end
  end

  puts substring ? 'YES' : 'NO'
end

# two_strings 'hello', 'world' # 'YES'
# two_strings 'hi', 'world' # 'NO'

#==== can any anagram of string be a palindrome? =====

def game_of_thrones string
  freq = Hash.new 0
  count = 0

  string.chars.each{ |key| freq[key]+=1 }
  # freq.each{ |k,v| count +=1 if v.odd? }
  freq.each do |k,v|
    count+=1 if v.odd?
    break if count > 1
  end

  puts count < 2 ? 'YES' : 'NO'
  
end

# game_of_thrones 'aaabbbb' # 'YES'
# game_of_thrones 'cdefghmnopqrstuvw' # 'NO'

#=== anagram is a word that can be formed by rearranging letters from another ===
# How many deletions to make strings anagrams of each other?

def make_anagram a,b
  freq, count = Hash.new(0), 0

  a.chars.each{ |key| freq[key]+=1 }
  b.chars.each{ |letter| freq[letter]-=1 }

  freq.each{ |k,v| count+= v.abs }

  puts count
  
end

# make_anagram 'cde', 'abc' # 4

#=== Find the equilibrium index ====
# Time complexity O(N^2)

def equi_index arr
  left, right = 0, arr.reduce(:+)
  indices = []

  arr.each_with_index do |x,xi|
    right -= x
    indices << xi if left == right
    left += x
  end
  
  indices.empty? ? -1 : indices.first

end


# p equi_index [-1,3,-4,5,1,-6,2,1] # 1, 3, 7
# p equi_index [1,2,3]
# p equi_index [1082132608, 0, 1082132608]
# p equi_index [1, 2, -3, 0]

# ==== Given a group of sentences, give count of words of largest sent. ===

def largest_sent paragraph
  count = []
  paragraph.split(/\?|\.|\!/).map{|x| x.split(' ')}.each do |sent|
    count << sent.size
  end
  count.max
end

# p largest_sent "We test coders? Give us a try."
# p largest_sent "We test coders. Give us a try?"
# p largest_sent "We test's coders. Give us a try?"
# p largest_sent "Forget  CVs..Save time . x x"

# ===Count all the squares in a given range ===

def squares a,b
  a = 0 if a < 0

  if b < 0
    return 0
  else
    s1 = Math.sqrt(a).ceil
    s2 = Math.sqrt(b).floor
    sqs = (s2 - s1) +1

    sqs
  end
end

# p squares 3,9
# p squares 4, 17
# p squares 3, 100
# p squares -10, 100
# p squares -10, -8
# p squares 0,1
# p squares 0,0