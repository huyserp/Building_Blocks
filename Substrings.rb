dictionary = [
    "below","down","go",
    "going","horn","how",
    "howdy","it","i","low",
    "own","part","partner","sit"
]

def substrings(check, dictionary)
    phrase = check.downcase
    substrs = {}

    dictionary.each do |word|
        if phrase.include?(word)
            substrs[word] = phrase.scan(/(?=#{word})/).count
        else
            next
        end
    end
    substrs
end
puts puts
puts substrings("below", dictionary)
puts puts puts
puts substrings("Howdy partner, sit down! How's it going?", dictionary)
puts puts