require './lib/make_snippet.rb'

RSpec.describe "make_snippet.rb" do
  it "returns string if the string has less than 5 words" do
    result = make_snippet("Hello I am Narae")
    expect(result).to eq "Hello I am Narae"
  end

  it "returns string if the string has 5 words" do
    result = make_snippet("Hello I am Narae Kim")
    expect(result).to eq "Hello I am Narae Kim"
  end

  it "returns the first five words with ... " do
    result = make_snippet("Hello my name is Narae Kim ")
    expect(result).to eq "Hello my name is Narae..."
  end
end