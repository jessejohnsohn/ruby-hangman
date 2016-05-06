# Written March 1, 2016

# this is a hangman game

puts 'Welcome to Hangman'

def play
    puts 'Type "play" to begin'
    print '>'
    @play = gets.chomp.downcase.to_s
    until @play == 'play'
        puts 'Type "play" to begin'
        print '>'
        @play = gets.chomp.downcase.to_s
    end
end

self.play

possible_words = ['HORSE', 'PIG', 'GOAT', 'PUPPY', 'FELINE', 'ROOSTER', 'BIPEDAL']
word = possible_words[rand(possible_words.length)]

letters = word.chars.to_a

remaining_letters = word.chars.to_a

alphabet = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K",
"L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]

lives = 5

puts 'Generating word...'
sleep(1)
puts '...'
sleep(1)
puts '...'
sleep(1)

until remaining_letters == [] || lives == 0
    letters.each do |letter| if alphabet.include?(letter) == true
                                            print '_ '
                                        else print "#{letter} "
                                        end
                        end
    puts ''
    alphabet.each { |letter| print "#{letter} " }
    puts ''
    puts 'Lives: ' + lives.to_s
    guess = gets.chomp.upcase.to_s

    until alphabet.include?(guess)
        puts 'Please use only a letter from above'
        guess = gets.chomp.upcase.to_s
    end

    if letters.include?(guess)
        puts 'Yes!'
        remaining_letters.delete(guess)
        alphabet.delete(guess)
    else
        puts 'Incorrect.'
        alphabet.delete(guess)
        lives -= 1
    end
end

if lives == 0
    puts 'You lose.'
else
    puts 'You win!'
end
