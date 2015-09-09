class Letters

  def letter_values
    {'a' => "023456", 'b' => '010456', 'c' => '003456',
    'd' => '003056', 'e' => '023056', 'f' => '000456',
    'g' => '000056', 'h' => '010056', 'i' => '100456',
    'j' => '100056', 'k' => '023406', 'l' => '020406',
    'm' => '003406', 'n' => '003006', 'o' => '023006',
    'p' => '000406', 'q' => '000006', 'r' => '020006',
    's' => '100406', 't' => '100006', 'u' => '023400',
    'v' => '020400','w' => '100050', 'x' => '003400',
    'y' => '003000', 'z' => '023000', ' ' => '123456'}
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
