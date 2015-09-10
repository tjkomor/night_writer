require './lib/text'
# handle = File.open(ARGV[0], 'r')

input = IO.readlines(ARGV[0])

text = Text.new(input.join)
text.split_string
text.get_value
text.split_values
text.create_lines
p text.line_one_to_braille
p text.line_two_to_braille
p text.line_three_to_braille









# File.open(ARGV[1], 'w')
