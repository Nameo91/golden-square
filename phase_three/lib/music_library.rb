class MusicLibrary
  def initialize
    @tracks = []
  end

  def add(track) 
    @tracks << track
  end

  def all
    return @tracks
  end
  
  def search(keyword)
    @matched_tracks = []
    @tracks.each do |track|
      if track.matches?(keyword)
      @matched_tracks << track 
      end
    end
      @matched_tracks
  end
end