require_relative '../lib/playlist.rb'

RSpec.describe Playlist do
  context "given no songs" do
    it "returns an empty list" do
      music_list = Playlist.new
      expect(music_list.list).to eq []
    end      
  end

  context "given one song" do
    it "has one song in the list" do
      music_list = Playlist.new
      music_list.add("Peaches - Justin Bieber")
      expect(music_list.list).to eq ["Peaches - Justin Bieber"]
    end
  end

  context "given two songs" do
    it "has two songs in the list" do
      music_list = Playlist.new
      music_list.add("Peaches - Justin Bieber")
      music_list.add("As It Was - Harry Styles")
      expect(music_list.list).to eq ["Peaches - Justin Bieber", "As It Was - Harry Styles"]
    end
  end

  context "given duplicate song" do
    it "fails" do
      music_list = Playlist.new
      music_list.add("Peaches - Justin Bieber")
      expect{ music_list.add("Peaches - Justin Bieber") }.to raise_error "Duplicate song"
    end
  end
end
