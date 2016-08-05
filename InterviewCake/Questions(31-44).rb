# 31. Recursive String Permutations
# Write a recursive function for generating all permutations of an input string. Return them as a set.
require 'set'

def get_permutations string

  # base case
  if string.length <= 1
    return Set.new [string]
  end

  all_chars_except_last = string[0..-2]
  last_char = string[-1]

  # recursive call: get all possible permutations for all chars except last
  permutations_of_all_chars_except_last = get_permutations(all_chars_except_last)

  # put the last char in all possible positions for each of the above permutations
  permutations = Set.new
  permutations_of_all_chars_except_last.each do |permutations_of_all_chars_except_last|
    (0..all_chars_except_last.length).each do |position|
      permutation = permutations_of_all_chars_except_last[0...position] + last_char + permutations_of_all_chars_except_last[position..-1]
      permutations.add(permutation)
    end
  end

  return permutations
end

# p get_permutations 'cat'

# 32. Top Scores
# counting is a common pattern in time-saving algorithms. It can often get you O(n) runtime, but at the expense of adding O(n) space.

# The idea is to define a hash or array (call it e.g. counts) where the keys/indices represent the items from the input set and the values represent the number of times the item appears. In one pass through the input you can fully populate counts:
# counts = {}
# the_array.each do |item|
#   if counts.include? item
#     counts[item] += 1
#   else
#     counts[item] = 1
#   end
# end

def sort_scores unordered_scores, highest_possible_score
  # array of 0s at indices 0..highest_possible_score
  scores_to_counts = [0] * (highest_possible_score+1)

  # populate scores_to_counts
  unordered_scores.each do |score|
    scores_to_counts[score] += 1
  end

  # populate the final sorted array
  sorted_scores = []

  # for each item in scores_to_counts
  scores_to_counts.each_with_index do |count, score|

    # for the number of times the item occurs
    (0...count).each do |time|

      # add it to the sorted array
      sorted_scores.push(score)
    end
  end

  return sorted_scores
end

# Complexity: O(n) time and O(n) space, where n is the number of scores
# The highest_possible_score as a constant, we could call it k and say we have O(n + k) time and O(n + k) space. 

# 33. Which appears twice

# 1. summ all numbers 1...n. use equation || n^2 + n / 2  ||  because the numbers in 1...n are a triangular series. 
# 2. Sum all numbers in our input array, which should be the same as our other sum but with our repeat number added in twice. The difference between these two sums is the repeated number.  

# Complexity O(n) time and O(1) additional space

# 34. Word Cloud Data

def split_words input_string
  words = []
  current_word = ''
  (0...input_string.length).each do |i|
    character = input_string[i]
    if character == ' '
      words.push(current_word)
    elsif is_etter(character)
      current_word += character
    end
  end
  return words
end

words_to_counts = {}

def add_word_to_hash word
  if words_to_counts.include? word
    words_to_counts[word] += 1
  else
    words_to_counts[word] = 1
  end
end

class WordCloudData

  attr_accessor :words_to_counts

  def initialize input_string
    @words_to_counts = {}
    self.populate_words_to_counts input_string
  end

  def populate_words_to_counts input_string
    # iterate over each character in the input string, splitting
    # words and passing them to add_word_to_hash()

    current_word = ''
    (0...input_string.length).each do |i|

      character = input_string[i]

      # if we reached the end of the string we check if the last 
      # character is a letter anc add the last word to our hash
      if i == input_string.length-1
        current_word += character if self.is_letter character
        self.add_word_to_hash(current_word) if !current_word.empty?

      # if we reacha space or emdash we know we're at the end of a word
      # so we add it to our hash and reset our current word
      elsif character == ' ' || character == "\u2014"
        self.add_word_to_hash(current_word) if !current_word.empty?
        current_word = ''

      # we want to make sure we split on ellipses so if we get two periods in 
      # a row we add the current word to our hash and reset our current word
      elsif character == '.'
        if i < input_string.length-1 && input_string[i+1] == '.'
         self.add_word_to_hash(current_word) if !current_word.empty?
         current_word = ''
        end

      # if the character is a letter or an apostrophe, we add it to our current word
      elsif self.is_letter(character) || character == '\''
        current_word += character

      # if the character is a hyphen, we want to check if it's surrounded by letters
      # if it is, we add it to our current word
      elsif character == '-'
        if i > 0 && self.is_letter(input_string[i-1]) && \
          self.is_letter(input_string[i+1])
          current_word += character
        end
      end
    end
  end

  def add_word_to_hash word
    # if the word is already in the hash we increment its count
    if @words_to_counts.include? word
      @words_to_counts[word] += 1

    # if a lowercase version is in the hash, we know our input word must be uppercase
    # but we only include uppercase words if they're always uppercase
    # so we just increment the lowercase version's count
    elsif @words_to_counts.include? word.downcase
      @words_to_counts[word.downcase] += 1

    # if an uppercase version is in the hash, we know our input word must be lowercase
    # since we only include uppercase words if they're always uppercase, we add the lowercase version and give it the uppercase version's count
    elsif @words_to_counts.include? word.capitalize
      @words_to_counts[word] = 1
      @words_to_counts[word] += @words_to_counts[word.capitalize]
      @words_to_counts.delete(word.capitalize)

    # otherwise, the word is not in the hash at all, lowercase or uppercase
    # so we add it to the hash
    else
      @words_to_counts[word] = 1
    end
  end

  def is_letter character
    return 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'.include? character
  end
end

# Complexity runtime and memory cost are both O(n)

# a = WordCloudData.new('Add milk and eggs, then add flour and sugar.')
# p a

# 35. In-Place Shuffle

# Write a function for doing an in-place shuffle of an array
# an in-place algorithm operates directly on its input and changes it, instead of creating and returning a new object. This is sometimes called desctructive, since the original input is "destroyed" when it's edited to create the new output

def get_random floor, ceiling
  rand(floor..ceiling)
end

def naive_shuffle the_array

  # for each index in the array
  (0...the_array.length).each do |first_index|

    # grab a random other index
    second_index = get_random(0, the_array.length - 1)

    # and swap the values
    the_array[first_index], the_array[second_index] = the_array[second_index], the_array[first_index]
  end
  return the_array
end

def shuffle the_array
  # if it's 1 or 0 items, just return
  if the_array.length <= 1
    return the_array
  end

  last_index_in_the_array = the_array.length - 1

  # walk through from beginning to end
  (0...the_array.length).each do |index_we_are_choosing_for|

    # choose a random not-yet-placed item to place there
    # (could also be the item currently in that spot)
    # must be an item AFTER the current item, because the stuff
    # before has all already been placed
    random_choice_index = get_random(index_we_are_choosing_for, last_index_in_the_array)
    # place our random choice in the spot by swapping
    the_array[index_we_are_choosing_for], the_array[random_choice_index] = the_array[random_choice_index], the_array[index_we_are_choosing_for]
  end
  return the_array
end

# This is a semi-famous algorithm known as the Fisher-Yates shuffle (sometimes called the Knuth shuffle)

# Complexity O(n) time and O(1) space

# p naive_shuffle [1,3,4,2,5,7]
# naive solution is non-uniform(some outcomes are more likely than others)

# p shuffle [1,3,4,2,5,7]

# 36. Single Rifle check

# a riffle - cut the deck into halves half1 and half2, grab a random number of cards from the top of half1 and throw them into the shuffled_deck

def is_single_riffle half1, half2, shuffled_deck
  half1_index = 0
  half2_index = 0
  half1_max_index = half1.length - 1
  half2_max_index = half2.length  - 1

  shuffled_deck.each do |card|
    # if we stil have cards in half1 and the "top" card in half1 is the same
    # as the top card in shuffled_deck
    if half1_index <= hlaf1_max_index and card == half1[half1_index]
      half1_index +=1

      # if we still have cards in half2
      # and the "top" card in half2 is the same
      # as the top card in shuffled_deck
    elsif half2_index <= half2_max_index and card == hlaf2[half2_index]
      half2_index += 1

      # if the top card in shuffled_deck doesn't match the top card in half1 or half2, this isn't a single riffle.
    else
      return false
    end
  end

  # all cards in shuffled_deck have been accounted for"
  # so this is a single riffle!
  return true
  
end

# Complexity: O(n) time and O(1) additional space

# 37. Simulate a 5 sided die

def rand5
  result = 7
  while result > 5
    result = rand7
  end
  return result
end

def rand5_recursive
  roll = rand7
  if roll <= 5
    return roll 
  else 
    return rand5_recursive
  end
end

# some compilers and interpreters will do what's called "tail call optimization" (TCO), where it can optimize some recursive funcitons to avoid building up a tall call stack. Python and Java decidedly do not use TCO. Some Ruby implementations do, but most don't. Scheme is one of the few languages that guarantee TCO in all implementations. In general, best not to assume your compiler/interpreter will do this work for you. 

# The call stack is what a program uses to keep track of what function it's currently  running and what to do with that function's return value.

# Whenever you call a function, a new frame gets pushed onto the call stack, which is popped off when the function returns. As functions call other functions, the stack gets taller. In recursive functions, the stack can get as tall as the number of times the function calls itself. This can cause a problem: the stack has a limited amount of space, and if it gets too big you can get a stack overflow error

def rand7

  while true

    # do our die rolls
    roll1 = rand5
    roll2 = rand5

    outcome_number = (roll1-1) * 5 + (roll2-1) + 1

    # if we hit an extraneous
    # outcome we just re-roll
    if outcome_number > 21
      next
    end

    # out outcome was fine. return it!
    return outcome_number % 7 + 1
  end

end

# Worst-case O(infinity) time ( we might keep re-rolling forever) and O(1) space