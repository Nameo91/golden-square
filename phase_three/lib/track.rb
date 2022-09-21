class Track
  def initialize(title, artist)
    fail "The title is missing!" if title == ""
    fail "The artist is missing!" if artist ==""
    @title = title
    @artist = artist
  end

  def matches?(keyword) 
    return @title.include?(keyword) || @artist.include?(keyword)
  end
end