class Letters

  def letter_values
    {'a' => "011111", 'b' => '010111', 'c' => '001111',
    'd' => '001011', 'e' => '011011', 'f' => '000111',
    'g' => '000011', 'h' => '010011', 'i' => '100111',
    'j' => '100011', 'k' => '011101', 'l' => '010101',
    'm' => '001101', 'n' => '001001', 'o' => '011001',
    'p' => '000101', 'q' => '000001', 'r' => '010001',
    's' => '100101', 't' => '100001', 'u' => '011100',
    'v' => '010100','w' => '100010', 'x' => '001100',
    'y' => '001000', 'z' => '011000', ' ' => '111111'}
  end

  def find_value(key)
    letter_values.each_key do |value|
      until letter_values[value] == key
          return letter_values[key]
      end
    end
  end

  def find_key(value)
    letter_values.key(value)
  end
                                        # => :letter_values
end  # => :value
