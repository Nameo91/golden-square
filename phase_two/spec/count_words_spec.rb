require './lib/count_words.rb'

RSpec.describe "count_words method" do
  it "initally returns zero for an empty string" do
    result = count_words("")
  end

  it "returns the number of words in the given string" do
    result = count_words("Hello Makers")
    expect(result).to eq 2
  end 
end 