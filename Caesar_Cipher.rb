def caesar_cipher(phrase, shift)
    split_phrase = phrase.split('')

    new_split_phrase = split_phrase.each do |letter|
        if letter == " " || /\W/ =~ letter
            letter
        else
            shift.times do
                letter.next!
            end
            letter
        end
    end

    new_phrase = new_split_phrase.join()
    return new_phrase
end

# puts caesar_cipher("Where is the door?", 2)
# puts caesar_cipher("abc", 3)
# puts caesar_cipher("Turtle", 7)
puts caesar_cipher("ZzZz", 3)
            
