class Diary
  def initialize
    @entries = []
  end

  def add(entry) 
    @entries << entry
  end

  def all
    return @entries
  end

  def count_words
    @entries.sum(&:count_words)
  end

  def reading_time(wpm) 
    fail "WPM must be above zero." unless wpm > 0
    return (count_words / wpm.to_f).ceil
  end 

  def find_best_entry_for_reading_time(wpm, minutes)
    fail "WPM must be above zero." unless wpm > 0
    return readable_entry(wpm,minutes).max_by(&:count_words)
  end
end 

private

def readable_entry(wpm, minutes)
  return @entries.select do |entry| 
    entry.reading_time(wpm) <= minutes 
  end
end