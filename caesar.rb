class Caesar
  def initialize()
    @rotation = ARGV.first.to_i
    @message = ARGV[1..last]
    @map = create_map
  end

  def translate
    @message.map do |word|
      characters = word.chars
      characters.map do |letter|
        new_index = cipher.find_index(letter.lowercase)+@rotation
        @map[new_index]
      end
    end
  end

  def cipher
    ("a".."z").to_a
  end


end

c = Caesar.new
require 'pry'; binding.pry
c.translate
