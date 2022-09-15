class GrammarStats
  def initialize
    @arr_check = []
  end

  def check(text) 
    fail "Text NOT GIVEN" if text.empty?
    start_with_capital = text.chr == text.chr.upcase
    end_with_puncuation = ["!", "?", "."].include? (text[-1])
    if start_with_capital && end_with_puncuation
      @arr_check << "true"
      return true
    else
      @arr_check << "false"
      return false
    end 
  end

  def percentage_good
    total_text_checked = @arr_check.count
    num_true_text = @arr_check.count("true")
    percentage = (num_true_text / total_text_checked.to_f) * 100
    return percentage.to_i
  end
end 