require 'string_builder.rb'

RSpec.describe StringBuilder do
  context "given an empty string" do 
    it "initially returns an empty string" do
      string = StringBuilder.new
      string.add("")
      expect(string.output).to eq ""
    end

    it "initially returns a length of 0" do
      string = StringBuilder.new
      string.add("")
      expect(string.size).to eq 0
    end
  end

  it "returns a length of the given string" do
    string = StringBuilder.new
    string.add("Hello")
    expect(string.size).to eq 5
  end

  it "outputs the given string" do 
    string = StringBuilder.new
    string.add("Hello")
    expect(string.output).to eq "Hello"
  end
end 