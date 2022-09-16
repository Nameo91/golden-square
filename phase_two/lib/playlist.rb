class Playlist 
  def initialize
    @lists = []
  end

  def add(music)
    fail "Duplicate song" if @lists.include?(music)
    @lists << music
  end

  def list
    return @lists
  end
end 