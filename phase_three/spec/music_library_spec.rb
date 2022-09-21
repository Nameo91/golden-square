require_relative '../lib/music_library.rb'

RSpec.describe do
  it "initially" do
    library = MusicLibrary.new
    expect(library.all).to eq []
  end

  it "returns the track when the keyword matches the title" do
    library = MusicLibrary.new
    track_1 = double(:track, matches?: true)
    track_2 = double(:track, matches?: false)
    library.add(track_1)
    library.add(track_2)
    expect(library.search("Carte")).to eq [track_1]
  end
end

