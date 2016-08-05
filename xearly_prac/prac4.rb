def partition arr
  pivot = arr.first
  part = arr[1..-1].partition{ |e| e < pivot}
  return[part[0].size,part[0]+[pivot]+part[1]]
end

def quicksort arr
  return arr if arr.size<2
  n,arr=partition(arr)
  answer=quicksort(arr[0...n])+[arr[n]]+quicksort(arr[(n+1)..-1])
  puts answer*' '
  answer
end

# a = [5, 8, 1, 3, 7, 9, 2]

# p partition a
# p quicksort a

# quicksort a
# gets;quicksort(gets.split.map(&:to_i))


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

n = 2
height = 1

# (1..n).each do |x|
#   if x.even?
#     height = height*2
#   else
#     height = height*2 +1
#   end
# end


def grow cycles
  height = 1
  (1..cycles).each do |x|
    x.odd? ? height *= 2 : height +=1 
  end
  height
end

# p grow 4 # == 7
# p grow 3 # == 6


def squares n, n2

  s1 = Math.sqrt(n).ceil
  s2 = Math.sqrt(n2).floor
  
  squares = s2 - s1

  puts squares == 1 ? squares : 0
  
end

p squares 3,9

def cut_sticks arr
  num_cut = []

  while arr.size != 0
    min_length = arr.min
    arr.map!{ |x| x - min_length }
    num_cut << arr.size
    arr.delete_if{ |x| x < 1}
  end
  num_cut
end

# a = [5,4,4,2,2,8]

# p cut_sticks a

def buy_choc n, c, m

  total = n/c # 6/2
  w = total + n%c  # 3 + 0

  while w >= m
    total += w/m  # 3/2
    w = w/m + w%m
  end

  return total
  
end

# p buy_choc 10, 2, 5 # 6
# p buy_choc 12,4,4 # 3
# p buy_choc 6,2,2  # 6/2 = 3/2 = 1
  
def lisas_workbook probs, probs_per_chap
  
  
  pages = []

  probs_per_chap.each do |chap_probs|
    num = chap_probs/probs
    remainder = chap_probs % probs
    num.times { pages << probs}
    pages << remainder unless remainder == 0
  end

  probs_per_chap.map! do |x|
    (1..x).to_a
  end.flatten!.reverse!
  
  pages.map! do |x|
    probs_per_chap.pop(x)
  end

  count = 0

  pages.each_with_index do |x,xi|
    count += 1 if x.include? xi+1
  end

  count
end



# 3 problems per page 
# 4 problems in first chapter
# count special problems = page index
# p lisas_workbook 3, [4,2,6,1,10]

# string = gets.strip

#     count = 0
#     alpha = ('a'..'z').to_a
#     arr = string.chars
    
#     arr.each_with_index do |x,xi|
        
#         while arr[xi] != arr[-(xi+1)]
#             opposite = arr[-(xi+1)]
#             cur_letter = [arr[xi], opposite].max
            
#             alpha_index = alpha.index(cur_letter)
            
#             if opposite > arr[xi]
#                 arr[-(xi+1)] = alpha[alpha_index-1]
#                 count +=1
#             else
#                 arr[xi] = alpha[alpha_index-1]
#                 count += 1
#             end
#         end
#     end
    
#     # puts count



