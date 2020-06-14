ALPHABET = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'

def isUpper?(char)
  char === char.capitalize ? true : false
end

def letter_shift(input_letter, shift)
    
  alphabet_upper = ALPHABET.chars                                                 #array containing the alphabet upper case
  alphabet_lower = ALPHABET.downcase.chars                                        #array containing the alphabet lower case

  unless alphabet_lower.index(input_letter.downcase)                              #if its not a letter e.g a symbol or space, returns the symbol
    return input_letter
  end

  if isUpper?(input_letter)
    new_position_alpha = alphabet_upper.index(input_letter) + shift                 #[0] -> [2]         A -> C

  else
    new_position_alpha = alphabet_lower.index(input_letter) + shift       
  end
  

  if new_position_alpha > 25
    new_position_alpha = new_position_alpha%25 - 1                          # 26 -> [0]       27 -> [1]  
  end

  if new_position_alpha < -26
    new_position_alpha = new_position_alpha%26 - 26                         # -27 -> [-1]    -28 -> [-2] 
  end

  return isUpper?(input_letter) ? alphabet_upper[new_position_alpha] : alphabet_lower[new_position_alpha]
end

def caesars_chipher(input_text, change)
  shifted_str = ''
  input_text.each_char { |c| shifted_str += letter_shift(c, change) }

  return shifted_str
end


puts 'Enter a text to be shifted: '
  input_text = gets.chomp
puts ' '


puts 'Enter the amount you want to shift on the alphabet (it can be positive or negative): '
  shift = gets.chomp.to_i
puts ' '

puts "Here\'s your text shifted by #{shift}: "
puts caesars_chipher(input_text, shift)

