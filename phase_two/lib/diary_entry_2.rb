class DiaryEntry
  def initialize(title, contents) 
    @title = title
    @contents = contents 
    @word_start = 0
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
    fail "WPM must be above zero." unless wpm > 0 
    return (count_words / wpm.to_f).ceil
  end

  def reading_chunk(wpm, minutes) 
    fail "WPM must be above zero." unless wpm > 0
    words_can_read = wpm * minutes
    start_from = @word_start
    end_at = @word_start + words_can_read 
    chunk_readable = words[start_from, end_at]
    if end_at >= count_words
      @word_start = 0
    else
      @word_start = end_at
    end
    return chunk_readable.join(" ")
  end
end

private

def words
  return @contents.split
end
