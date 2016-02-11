class Caesar
  def initialize
    @rotation = ARGV[0].to_i
    @message = ARGV[1..-1]
    @coded_message = nil
  end

  def create_code
    @coded_message = @message.map do |word|
      shift_letters(word)
    end
  end

  def print_code
    puts @coded_message.join(" ")
  end

  def shift_letters(word)
    letters = word.chars
    coded_word = letters.map do |letter|
      ordinal = letter.ord
      if 97 <= ordinal && ordinal <= 122
        shift_lower_case(ordinal)
      elsif 65 <= ordinal && ordinal <= 90
        shift_upper_case(ordinal)
      else
        letter
      end
    end.join
  end

  def shift_lower_case(ordinal)
    if ordinal + @rotation > 122
      (96 + (ordinal + @rotation - 122)).chr
    else
      (ordinal + @rotation).chr
    end
  end

  def shift_upper_case(ordinal)
    if ordinal + @rotation > 90
      (64 + (ordinal + @rotation - 90)).chr
    else
      (ordinal + @rotation).chr
    end
  end
end

caesar = Caesar.new
caesar.create_code
caesar.print_code
