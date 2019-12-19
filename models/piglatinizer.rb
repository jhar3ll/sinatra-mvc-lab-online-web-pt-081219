class PigLatinizer

  def piglatinize(input_str)
    if input_str.split(" ").length == 1 
      piglatinize_word(input_str) 
    else 
      piglatinize_sentence(input_str)
  end
  

  def consonant?(char)
    !char.match(/[aAeEiIoOuU]/)
  end
  

  def piglatinize_word(word)
  
    if !consonant?(word[0]) 
      word += "w"
    
    elsif  constant?(word[0])
      word = word.slice(1..-1) + word.slice(0)
    
    elsif consonant?(word[0]) && consonant?(word[1])
      word = word.slice(2..-1) + word.slice(0,2)
      
    else 
      word = word.slice(3..-1) + word.slice(0,3)
      end
      word << "ay"
    end

  def piglatinize_sentence(sentence)
    sentence.split.map { |word| piglatinize_word(word) }.join
  end
end