require './lib/text'
class NightWrite
  attr_reader :input
  def initialize
    @input = IO.readlines(ARGV[0])
    @output = File.open(ARGV[1], 'w')
    @lines = []
  end

  def convert_text
    text = Text.new(@input.join)
    text.split_string
    text.get_value
    text.split_values
    text.create_lines
    @one = text.line_one_to_braille
    @two = text.line_two_to_braille
    @three = text.line_three_to_braille
  end

  def join_braille
    @lines << @one
    @lines << @two
    @lines << @three
  end

  def output_braille
    @output.write(@lines.join("\n"))
  end

end

write = NightWrite.new
write.convert_text
write.join_braille
write.output_braille








# File.open(ARGV[1], 'w')
