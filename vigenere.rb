require 'pry'

class Caesar
  def initialize
    @keyword = ARGV[0]
    @message = ARGV[1..-1]
    @coded_message = nil
    @rotation_array = []
    @place_in_rotation_array = 0
  end

  def create_code
    create_rotation_array(@keyword)
    @coded_message = @message.map do |word|
      shift_letters(word)
    end
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
    shift_place_in_rotation_array
    if ordinal + @rotation_array[@place_in_rotation_array] > 122
      (96 + (ordinal + @rotation_array[@place_in_rotation_array] - 122)).chr
    else
      (ordinal + @rotation_array[@place_in_rotation_array]).chr
    end
  end

  def shift_upper_case(ordinal)
    shift_place_in_rotation_array
    if (ordinal + @rotation_array[@place_in_rotation_array]) > 90
      (64 + (ordinal + @rotation_array[@place_in_rotation_array] - 90)).chr
    else
      (ordinal + @rotation_array[@place_in_rotation_array]).chr
    end
  end

  def create_rotation_array(word)
    word_array = word.downcase.chars
    alphabet_array = ("a".."z").to_a
    @rotation_array = word_array.map do |letter|
      alphabet_array.find_index(letter)
    end
    @place_in_rotation_array = (@rotation_array.length - 1)
    @rotation_array
  end

  def shift_place_in_rotation_array
    if @place_in_rotation_array == (@rotation_array.length - 1)
      @place_in_rotation_array = 0
    else
      @place_in_rotation_array += 1
    end
  end

  def print_code
    puts @coded_message.join(" ")
  end
end

caesar = Caesar.new
caesar.create_code
caesar.print_code
