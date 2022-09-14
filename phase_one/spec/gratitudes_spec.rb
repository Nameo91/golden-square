require 'gratitudes.rb'

RSpec.describe Gratitudes do
  it "initally outputs the given format with nothing added" do
    grateful = Gratitudes.new
    expect(grateful.format).to eq "Be grateful for: "
  end
  
  it "adds the things to be grateful in the given format" do
    grateful = Gratitudes.new
    grateful.add("Sunshine")
    grateful.add("Breeze")
    grateful.add("Water")
    result = grateful.format
    expect(result).to eq "Be grateful for: Sunshine, Breeze, Water"
  end
end