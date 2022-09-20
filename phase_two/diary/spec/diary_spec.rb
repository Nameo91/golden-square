require_relative '../lib/diary.rb'

RSpec.describe Diary do
  it "initially" do
    diary = Diary.new
    expect(diary.list).to eq []
  end
end