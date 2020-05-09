=begin

### THE PROBLEM ###
Write a program that takes a message and an integer value as inputs.
manipulate the message by sliding each letter the number of positions in the alphabet indicated 
by the value of the integer input.  positive, slide right though the alphabet, negative slide left.
output a new message that is a transformation of the input message with the shift applied.

### PLAN ###
This problem does not have an interface, it will be called and run from the command line.

This program will take 2 inputs, a message and an integer value that will identify how many values each character in the 
message will change. The 2 inputs will be parameters to the method, creating two local variables and the user will pass them 
to the method as arguments.

The desired output is a message that is the same length as the one given, but each character will be a new character that is 
the number of positions within the alphabet away from the original character indicated by the integer value given as the second input.


### THE ALGORITHM ###
define a method that takes two inputs as local variables: phrase and shift.

phrase is a string message of any length; shift is a positive or negative integer.

break the phrase apart into individual characters and store this new array in a varible called 'split_phrase'.

loop over all of the items in 'split_phrase' and apply a change to each one.  each character will be called 'letter':
  if 'letter' is not a letter in the alphabet, leave it as it is, it is probably a space or punctuation

  if 'letter' is lowercase, convert it to its unicode integer and add to it the value stored in in the 'shift' variable.
  store this new value in a variable called 'slide'.

  if the value of slide is greater than the unicode value of 'z' then take the difference of the two numeric values and 
  add that to the beginning of the alphabet, so as to "go around the 'U'".

  convert the integer value stored in 'slide' back to a letter and store it back in the original 'letter' variable.

  If 'letter' is a capital letter, we want to make sure we maintain the same case. repeat the same steps as when 'letter' is lowercase, but 
  using the unicode numbers that correspond to uppercase letters.

after the loop has completed we should have a new array of characters that represent a change indicated by the value input to 'shift'

push the mutated array, saved in 'split_pharse', back together into a string and return it as the output.

Numeric values corresponding to the Characters in the alphabet:
     # A-Z        65 - 90
     # a-z        97 - 122

=end


def caesar_cipher(phrase, shift)
   split_phrase = phrase.split("")

    split_phrase.collect! do |letter|
        if /\W/ =~ letter
            letter
        else
            if letter == letter.downcase
                slide = letter.ord + shift
                slide = (slide - 122) + 96 if slide > 122
                slide = (97 - slide) + 96 if slide < 97
                letter = slide.chr
            else
                slide = letter.ord + shift
                slide = (slide - 90) + 64 if slide > 90
                slide = (65 - slide) + 64 if slide < 65
                letter = slide.chr
            end
        end
    end
    
    new_phrase = split_phrase.join
end

puts puts
puts "Caesar_Cipher: Where is the door?; slide 2"
puts caesar_cipher("Where is the door?", 2)
puts puts
puts "Caesar_Cipher: Turtle; slide 7"
puts caesar_cipher("Turtle", 7)
puts puts
puts "Caesar_Cipher: ZzZz; slide 3"
puts caesar_cipher("ZzZz", 3)
puts puts
puts "Caesar_Cipher: CcCc; slide -2"
puts caesar_cipher("CcCc", -2)
puts puts
puts "Caesar_Cipher: Please, kind sir, would you point me to the nearest exit?; slide -3"
puts caesar_cipher("Please, kind sir, would you point me to the nearest exit?", -3)
puts puts

#ALTERNATE PROGRAM - DOESNT ALLOW BACK AND FORTH, OR ARUOND THE "U"
# def caesar_cipher(phrase, shift)
#     split_phrase = phrase.split('')

#     new_split_phrase = split_phrase.each do |letter|
#         if /\W/ =~ letter
#             letter
#         else
#             shift.times do
#                 letter.next!
#             end
#             if letter.length > 1
#                 letter.delete!(letter[0])
#             end
#             letter
#         end
#     end

#     new_phrase = new_split_phrase.join()
#     return new_phrase
# end