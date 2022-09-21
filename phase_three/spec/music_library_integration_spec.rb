require_relative '../lib/music_library.rb'
require_relative '../lib/track.rb'

RSpec.describe "integration" do
  it "adds all tracks in the list" do
    library = MusicLibrary.new
    track_1 = Track.new("Carte Blanche", "Veracocha") 
    track_2 = Track.new("Synaesthesia", "The Thrillseekers") 
    library.add(track_1)
    library.add(track_2)
    expect(library.all).to eq [track_1, track_2]
  end
  
  context "with some tracks added" do
    it "searches the track when the keyword matches the title" do
      library = MusicLibrary.new
      track_1 = Track.new("Carte Blanche", "Veracocha")
      track_2 = Track.new("Synaesthesia", "The Thrillseekers")
      library.add(track_1)
      library.add(track_2)
      expect(library.search("Carte")).to eq [track_1]
    end

    it "searches the track when the keyword matches the artist" do
      library = MusicLibrary.new
      track_1 = Track.new("Carte Blanche", "Veracocha")
      track_2 = Track.new("Synaesthesia", "The Thrillseekers")
      library.add(track_1)
      library.add(track_2)
      expect(library.search("The")).to eq [track_2]
    end
  end
end 