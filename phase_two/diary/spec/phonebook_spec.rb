require_relative '../lib/phonebook.rb'

RSpec.describe Phonebook do
  it "constructs" do 
    phonebook = Phonebook.new("diary")
    expect(phonebook.diary).to eq "diary"
  end
end 