require_relative '../lib/track.rb'

RSpec.describe do
  it "constructs" do
    track = Track.new("Carte Blanche", "Veracocha")
  end
  
  it "fails the title is not given" do
    expect{ Track.new("", "Veracocha") }.to raise_error "The title is missing!"
  end  
  
  it "fails if the artist is not given" do
    expect{ Track.new("Carte Blanche", "") }.to raise_error "The artist is missing!"
  end

  it "returns true if the keyword matches either title or artist" do
    track = Track.new("Carte Blanche", "Veracocha")
    expect(track.matches?("Carte")).to eq true
    expect(track.matches?("Ver")).to eq true
  end

  it "returs false if the keyword doesn't match" do
    track = Track.new("Carte Blanche", "Veracocha")
    track.matches?("abc") # => false
  end
end