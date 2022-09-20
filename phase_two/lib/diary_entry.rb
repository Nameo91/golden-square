class DiaryEntry
  def initialize(title, contents) #title, contents are strings
    @title = title
    @contents = contents
    @next_word_read = 0
  end

  def title
    return @title
  end

  def contents
    return @contents 
  end

  def count_words
    return words.length
  end

  def reading_time(wpm)
    fail "WPM must be above zero." unless wpm.positive?
    return (count_words / wpm.to_f).ceil
  end
  
  def reading_chunk(wpm, minutes) 
    fail "WPM must be above zero." unless wpm.positive?
    words_user_can_read = wpm * minutes
    start_from = @next_word_read
    end_at = @next_word_read + words_user_can_read 
    words_chunck = words[start_from, end_at]
    if end_at >= count_words
      @next_word_read = 0
    else
      @next_word_read = end_at
    end 
    return words_chunck.join(" ")
  end 
  
  private

  def words
    return @contents.split(" ")
  end
end 

