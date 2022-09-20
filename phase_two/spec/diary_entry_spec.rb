require './lib/diary_entry.rb'

RSpec.describe DiaryEntry do
  it "constructs" do
    diary_entry = DiaryEntry.new("title", "contents")
    expect(diary_entry.title).to eq "title"
    expect(diary_entry.contents).to eq "contents"
  end
  
  describe "count_words method" do
    it "counts zero for an empty string" do
      diary_entry = DiaryEntry.new("title", "")
      expect(diary_entry.count_words).to eq 0
    end 

    it "counts the number of words in the contents" do
      diary_entry = DiaryEntry.new("title", "contents are here")
      expect(diary_entry.count_words).to eq 3
    end   
  end
  
  describe "reading_time method" do
    context "given a zero wpm" do
      it "fails" do
        diary_entry = DiaryEntry.new("title", "contents" * 180)
        expect{ diary_entry.reading_time(0) }.to raise_error "WPM must be above zero."
      end
    end

    context "given wpm of a reasonalbe number such as 200" do 
      it "returns estimated reading time in minutes" do
        diary_entry = DiaryEntry.new("title", "contents " * 600)
        expect(diary_entry.reading_time(200)).to eq 3
      end
    end
  end

  describe "reading_chunk method" do
    context "with a text readable with in the given minutes" do
      it "returns a full chunck" do
        diary_entry = DiaryEntry.new("title", "one two three")
        text_chunk = diary_entry.reading_chunk(200, 1)
        expect(text_chunk).to eq ("one two three")  
      end

      it "returns a readable chunck" do
        diary_entry = DiaryEntry.new("title", "one two three")
        text_chunk = diary_entry.reading_chunk(2, 1)
        expect(text_chunk).to eq ("one two")  
      end

      it 'returns the next chunck, next time we are asked' do
        diary_entry = DiaryEntry.new("title", "one two three")
        diary_entry.reading_chunk(2, 1)
        text_chunk = diary_entry.reading_chunk(2, 1)
        expect(text_chunk).to eq "three"
      end

      it "restarts after reading the whole countents" do
        diary_entry = DiaryEntry.new("title", "one two three")
        diary_entry.reading_chunk(2, 1)
        diary_entry.reading_chunk(1, 1)
        text_chunk = diary_entry.reading_chunk(2, 1)
        expect(text_chunk).to eq "one two"
      end
    end

    context "with given 0 wmp" do
      it "fails" do
        diary_entry = DiaryEntry.new("title", "one two three")
        expect{ diary_entry.reading_chunk(0,2) }.to raise_error "WPM must be above zero." 
      end
    end
  end
end 