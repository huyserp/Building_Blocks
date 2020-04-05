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

     # A-Z        65 - 90
     # a-z        97 - 122

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