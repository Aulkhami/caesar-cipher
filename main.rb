require 'pry-byebug'

START_UPPER = 'A'.ord
END_UPPER = 'Z'.ord
START_LOWER = 'a'.ord
END_LOWER = 'z'.ord

def caesar_cipher(string)
  encrypted_message = ""
  string.each_char do |char|
    ordinal = char.ord

    in_upper = (ordinal >= START_UPPER && ordinal <= END_UPPER)
    in_lower = (ordinal >= START_LOWER && ordinal <= END_LOWER)

    if in_upper || in_lower
      new_ord = ordinal + 3

      if in_upper
        if new_ord > END_UPPER 
          new_ord = START_UPPER - 1 + new_ord - END_UPPER
        end
      else
        if new_ord > END_LOWER 
          new_ord = START_LOWER - 1 + new_ord - END_LOWER
        end
      end

      encrypted_message += new_ord.chr
    else
      encrypted_message += char
    end
  end

  encrypted_message
end
