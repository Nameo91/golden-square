def grammar_checker(text)
  fail "This is not a sentence." if text.empty?
  first_character_is_capital = text[0] == text[0].upcase
  last_character_is_punctuation = [".", "!", "?"].include?(text[-1])
  if first_character_is_capital && last_character_is_punctuation
    return "Correct!"
  else
    return "WRONG! Check your grammar."
  end
end 