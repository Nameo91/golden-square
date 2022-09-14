require './lib/reading_time.rb'

RSpec.describe "reading_time method" do
  it "returns zero if an empty text is given" do
    result = reading_time("")
    expect(result).to eq 0
    
  end

  it "returns 1 if the given text is under 200 words " do
    result = reading_time("one two three")
    expect(result).to eq 1
  end

  it "returns 1 if the given text has 200 words" do 
    result = reading_time("one " * 200)
    expect(result).to eq 1
  end

  it "returns 2 if the given text has 300 words" do
    result = reading_time("one " * 300)
    expect(result).to eq 2
  end

  it "returns 2 if the given text has 400 words" do
    result = reading_time("one " * 400)
    expect(result).to eq 2
  end

end