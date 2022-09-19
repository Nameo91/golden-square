require_relative '../lib/diary.rb'
require_relative '../lib/diary_entry_2.rb'

RSpec.describe "itegration" do
  context "when we add some entries" do
    it "lists the entries added" do
      diary = Diary.new
      diary_entry1 = DiaryEntry.new("title 1", "content one")
      diary_entry2 = DiaryEntry.new("title 2", "content two")
      diary.add(diary_entry1)
      diary.add(diary_entry2)
      expect(diary.all).to eq [diary_entry1, diary_entry2]
    end
  end

  describe "#count_words" do
    it "counts the number of words in all diary entries" do
      diary = Diary.new
      diary_entry1 = DiaryEntry.new("title 1", "content one")
      diary_entry2 = DiaryEntry.new("title 2", "content two")
      diary.add(diary_entry1)
      diary.add(diary_entry2)
      expect(diary.count_words).to eq 4
    end
  end

  describe "#reading_time" do
    it "fails if wpm is zero" do
      diary = Diary.new
      diary_entry1 = DiaryEntry.new("title 1", "content one")
      diary.add(diary_entry1)
      expect{ diary.reading_time(0) }.to raise_error "WPM must be above zero."
    end

    it "calculates the reading time for all diary entries if it fits exactly" do
      diary = Diary.new
      diary_entry1 = DiaryEntry.new("title 1", "content one")
      diary_entry2 = DiaryEntry.new("title 2", "content two")
      diary.add(diary_entry1)
      diary.add(diary_entry2)
      expect(diary.reading_time(2)).to eq 2
    end

    it "calculates the reading time for all diary entries if it fits exactly" do
      diary = Diary.new
      diary_entry1 = DiaryEntry.new("title 1", "content one")
      diary_entry2 = DiaryEntry.new("title 2", "content one two")
      diary.add(diary_entry1)
      diary.add(diary_entry2)
      expect(diary.reading_time(2)).to eq 3
    end
  end
  
  describe "#find best entry for reading time" do
    context "given zero wpm" do
      it "fails" do
        diary = Diary.new
        diary_entry1 = DiaryEntry.new("title 1", "content one")
        diary.add(diary_entry1)
        expect{ diary.find_best_entry_for_reading_time(0, 1) }.to raise_error ("WPM must be above zero.")
      end
    end 

    context "given one entry and it is readable in the time" do
      it "returns that entry" do
        diary = Diary.new
        diary_entry1 = DiaryEntry.new("title 1", "content one")
        diary.add(diary_entry1)
        result = diary.find_best_entry_for_reading_time(2, 1)
        expect(result).to eq diary_entry1
      end
    end

    context "given one entry and it is unreadable in the time" do
      it "returns nil" do
        diary = Diary.new
        diary_entry1 = DiaryEntry.new("title 1", "content one") 
        diary.add(diary_entry1)
        result = diary.find_best_entry_for_reading_time(1, 1)
        expect(result).to eq nil
      end
    end
    
    context "given mutiple entries" do
      it "returns the longest entry that the user can read in given time" do
        diary = Diary.new
        best_entry = DiaryEntry.new("title 2", "content one")
        diary.add(DiaryEntry.new("title 1", "content"))
        diary.add(best_entry)
        diary.add(DiaryEntry.new("title 3", "content one two"))
        diary.add(DiaryEntry.new("title 4", "content one two three") )
        result = diary.find_best_entry_for_reading_time(2, 1)
        expect(result).to eq best_entry
      end
    end  
  end
end 