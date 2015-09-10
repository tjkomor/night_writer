require './lib/text'
class NightWrite

  input = IO.readlines(ARGV[0])

  text = Text.new(input.join)
  text.split_string
  text.get_value
  text.split_values
  text.create_lines
  one = text.line_one_to_braille
  two = text.line_two_to_braille
  three = text.line_three_to_braille

  output = File.open(ARGV[1], 'w')
  lines = []
  lines << one
  lines << two
  lines << three
  output.write(lines.join("\n"))

end









# File.open(ARGV[1], 'w')
