require './lib/text'

class NightWrite
  attr_reader :input

  def initialize(input_filename, output_filename)
    @input  = IO.readlines(input_filename)
    @output = File.open(output_filename, 'w')
  end

  def make_braille
    output_braille(text.braille)
  end

  private

  def output_braille(braille)
    @output.write(braille)
  end

  def text
    @text ||= Text.new(@input.join)
  end
end

NightWrite.new(ARGV[0], ARGV[1]).make_braille
