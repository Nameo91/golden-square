class SelectEntry
  def initialize(wpm,diary) 
    @wpm = wpm
    @diary = diary
  end

  def wpm
    fail "WPM must be above zero." unless @wpm.positive?
    return @wpm
  end
  
  def diary
    return @diary
  end

  def find_best_readable_entry(minute) 
    fail "Time must be given more than zero." unless minute.positive?
    return readable_entry(minute).max_by(&:count_words)
  end
end 

private

def readable_entry(minute) 
  return @diary.list.select do |entry|
    (entry.count_words / @wpm.to_f).ceil <= minute
  end
end 