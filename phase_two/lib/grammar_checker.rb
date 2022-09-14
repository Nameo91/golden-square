def grammar_checker(text)
  fail "This is not a sentence." if text.empty?
  punctuation_check = [".", "!", "?"].include? text[-1]
  if text[0] == text[0].upcase && punctuation_check
    return "Correct!"
  else
    return "WRONG! Check your grammar."
  end
end 