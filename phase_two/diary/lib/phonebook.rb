class Phonebook
  def initialize(diary) #diary is an instance of DiaryEntry
    @diary = diary
    @numbers = []
  end

  def diary
    return @diary
  end

  def extract_phone_number
    @diary.list.each do |entry|
      entry.contents.scan(/[0-9]{11}/).each do |number|
        @numbers << number
      end
    end
    @numbers.uniq
  end  
end 