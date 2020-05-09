
=begin
### THE PROBLEM ###

Write a program that takes a message, and checks a given 'dictionary' which contains a collection of words, or substrings
to see how many different words in that dictionary can be found within the given message. 


### THE PLAN ###

This program does not have a user interface, it will be run from the command line.

The program will take two inputs, the first being a message of any length, the second being a collection of words or phrases aka 'dictionary'.  Both inputs will be entered as arguments to the defined method.

The desired output is a hash that lists all the words or phrases from the 'dictionary' collection that can be found within the message.
Each found item from the dictionary will be stored as a 'key' in the hash, the number of different times each item can be found in the message
will be stored as that key's value.

### THE ALGORITHM ###

create an array that holds a collection of words and/or substrings that you want to check for - store this array in a varible called 'dictionary'.

define a method that takes two parameters - one is a message that you want to inspect, the other is the dictionary you previously created. 
The message that you want to check will be stored in a local variable called 'check'.

within the method make sure that your given message and the dictionary all consist of the the same case - so that they can be compared.  
All upcase or all downcase. set the message in 'check' to downcase - store this in a new variable called 'phrase'

create the empty hash that will hold the values to be output.  call this 'substrs'.

loop through 'dictionary' and look at each item.  within this loop each item will be nameed 'word'.

if 'phrase' includes the 'word' in the current itoration, create a key in 'substrs' that is that particular 'word'.
set the value of this particular 'word' key to be the number of times that 'word' can be found in our 'phrase'.
    to do this, look through all of 'phrase' for the specifc 'word' and count how many times 'word' appears this result will be your value.

after you've itorated competely though 'dictionary', the 'substrs' hash will be populated with key: value pairs of items from 'dictionary' and how many times
they appear in 'phrase'

return the hash substrs as the output of your program.
    
=end



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