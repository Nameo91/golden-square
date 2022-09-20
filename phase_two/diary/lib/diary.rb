class Diary
  def initialize
    @entries = []
  end

  def add(entry) 
    @entries << entry
  end

  def list
    return @entries
  end
end 