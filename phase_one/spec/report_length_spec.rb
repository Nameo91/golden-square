require 'report_length.rb'

RSpec.describe "report_lengh method" do
  it "counts 0 character for an empty string" do
    result = report_length("")
    expect(result).to eq "This string was 0 characters long."
  end 

  it "counts the number of characters for a given string" do
    result = report_length("I LOVE Coding!")
    expect(result).to eq "This string was 14 characters long."
  end
end