require_relative '../lib/diary_entry_2.rb'

RSpec.describe DiaryEntry do
  it "constructs" do
    diary_entry = DiaryEntry.new("title 1", "content 1")
    expect(diary_entry.title).to eq "title 1"
    expect(diary_entry.contents).to eq "content 1"
  end
  
  describe "#count_words" do 
    it "returns zero if content is empty" do
      diary_entry = DiaryEntry.new("title 1", "")
      expect(diary_entry.count_words).to eq 0
    end 
    
    it "returns one if content has one word" do
      diary_entry = DiaryEntry.new("title 1", "content")
      expect(diary_entry.count_words).to eq 1
    end 

    it "counts the number of words in the string" do
      diary_entry = DiaryEntry.new("title 1", "content one two three")
      expect(diary_entry.count_words).to eq 4
    end
  end

  describe "#reading_time" do 
    it "fails if wpm is zero" do
      diary_entry = DiaryEntry.new("title 1", "")
      expect{ diary_entry.reading_time(0) }.to raise_error "WPM must be above zero."
    end

    it "returns zero if content is empty" do
      diary_entry = DiaryEntry.new("title 1", "")
      expect(diary_entry.reading_time(2)).to eq 0
    end 
  
    it "returns one if content has one word" do
      diary_entry = DiaryEntry.new("title 1", "content")
      expect(diary_entry.reading_time(2)).to eq 1
    end 

    it "returns a reading time for the content" do
      diary_entry = DiaryEntry.new("title 1", "content one two three")
      expect(diary_entry.reading_time(2)).to eq 2
    end
  end
  
  describe "#reading_chunk" do
    context "with the content readable in the given time" do
      it "returns the full content" do 
        diary_entry = DiaryEntry.new("title 1", "content one two three")
        expect(diary_entry.reading_chunk(5,1)).to eq "content one two three"
      end 

      it "returns a readble chunk" do
        diary_entry = DiaryEntry.new("title 1", "content one two three")
        expect(diary_entry.reading_chunk(3,1)).to eq "content one two"
      end

      it "returns the next chunk next time we are asked" do
        diary_entry = DiaryEntry.new("title 1", "content one two three")
        diary_entry.reading_chunk(2,1)
        next_chunk = diary_entry.reading_chunk(2,1)
        expect(next_chunk).to eq "two three"
      end

      it "restart after reading the whole contents" do
        diary_entry = DiaryEntry.new("title 1", "content one two three four")
        diary_entry.reading_chunk(3,1)
        diary_entry.reading_chunk(2,1)
        next_chunk = diary_entry.reading_chunk(2,1)
        expect(next_chunk).to eq "content one"
      end
    end

    context "with zero wpm" do
      it "fails" do
        diary_entry = DiaryEntry.new("title 1", "content one")
        expect{ diary_entry.reading_chunk(0,1) }.to raise_error ("WPM must be above zero.")
      end
    end
  end  
end
