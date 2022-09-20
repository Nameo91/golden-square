require_relative '../lib/diary_entry.rb'

RSpec.describe DiaryEntry do
  it "constructs" do
    diary_entry = DiaryEntry.new("my title", "my contents")
    expect(diary_entry.title).to eq "my title"
    expect(diary_entry.contents).to eq "my contents"
  end

  describe "#count_words" do
    it "returns the number of words in the contents" do
      diary_entry = DiaryEntry.new("my title", "my contents")
      expect(diary_entry.count_words).to eq 2
    end

    it "returns zero with an empty string" do 
      diary_entry = DiaryEntry.new("my title", "")
      expect(diary_entry.count_words).to eq 0
    end
  end
end 