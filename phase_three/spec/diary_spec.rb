require_relative '../lib/Diary.rb'

RSpec.describe Diary do
  it "reads the contents entered" do
    diary = Diary.new("my diary")
    expect(diary.read).to eq "my diary"
  end
end