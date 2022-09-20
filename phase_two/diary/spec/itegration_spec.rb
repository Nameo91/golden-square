require_relative '../lib/diary.rb'
require_relative '../lib/diary_entry.rb'
require_relative '../lib/select_diary.rb'
require_relative '../lib/phonebook.rb'

RSpec.describe "itegration" do
  context "when we add some diary entries" do
    it "lists the entries added" do
      diary = Diary.new
      diary_1 = DiaryEntry.new("title 1", "content one")
      diary_2 = DiaryEntry.new("title 2", "content two")
      diary_3 = DiaryEntry.new("title 3", "content three")
      diary.add(diary_1)
      diary.add(diary_2)
      diary.add(diary_3)
      expect(diary.list).to eq [diary_1, diary_2, diary_3]
    end
  end

  context "with some diary entries" do
    it "finds the entry when all words can be read within the give time" do
      diary = Diary.new
      select_entry = SelectEntry.new(2,diary)
      diary_1 = DiaryEntry.new("title 1", "content one")
      diary_2 = DiaryEntry.new("title 2", "content one two")
      diary_3 = DiaryEntry.new("title 3", "content one two three")
      diary.add(diary_1)
      diary.add(diary_2)
      diary.add(diary_3)
      expect(select_entry.find_best_readable_entry(1)).to eq diary_1
    end
    
    it "finds the most readale entry" do
      diary = Diary.new
      select_entry = SelectEntry.new(4,diary)
      diary_1 = DiaryEntry.new("title 1", "content one")
      diary_2 = DiaryEntry.new("title 2", "content one two")
      diary_3 = DiaryEntry.new("title 3", "content one two three four")
      diary.add(diary_1)
      diary.add(diary_2)
      diary.add(diary_3)
      expect(select_entry.find_best_readable_entry(1)).to eq diary_2
    end

    it "nothing can be read with in the given time" do
      diary = Diary.new
      select_entry = SelectEntry.new(1,diary)
      diary_1 = DiaryEntry.new("title 1", "content one")
      diary_2 = DiaryEntry.new("title 2", "content one two")
      diary_3 = DiaryEntry.new("title 3", "content one two three four")
      diary.add(diary_1)
      diary.add(diary_2)
      diary.add(diary_3)
      expect(select_entry.find_best_readable_entry(1)).to eq nil
    end

    it "fails if the given time is zero" do
      diary = Diary.new
      select_entry = SelectEntry.new(0,diary)
      diary_1 = DiaryEntry.new("title 1", "content one")
      diary_2 = DiaryEntry.new("title 2", "content one two")
      diary_3 = DiaryEntry.new("title 3", "content one two three four")
      diary.add(diary_1)
      diary.add(diary_2)
      diary.add(diary_3)
      expect{ select_entry.find_best_readable_entry(0) }. to raise_error "Time must be given more than zero."
    end
  end
  
  context "with some diary entries" do
    it "gathers all phone numbers in the contents" do
      diary = Diary.new
      diary.add(DiaryEntry.new("title 1", "phone number is 07000000000"))
      diary.add(DiaryEntry.new("title 2", "Jay changed number: 07000000001"))
      diary.add(DiaryEntry.new("title 3", "I got Kate's number. 07000000002"))
      phonebook = Phonebook.new(diary)
      expect(phonebook.extract_phone_number).to eq ["07000000000", "07000000001", "07000000002"]
    end
    
    it "has no dupliate in the list" do
      diary = Diary.new
      phonebook = Phonebook.new(diary)
      diary.add(DiaryEntry.new("title 1", "phone number is 07000000000"))
      diary.add(DiaryEntry.new("title 2", "Jay changed number: 07000000001"))
      diary.add(DiaryEntry.new("title 3", "I got Kate's number. 07000000000"))
      expect(phonebook.extract_phone_number).to eq ["07000000000", "07000000001"]
    end

    it "returns nil when the number has too few digits" do
     diary = Diary.new
     phonebook = Phonebook.new(diary)
     diary.add(DiaryEntry.new("title 1", "phone number is 070000"))
     expect(phonebook.extract_phone_number).to eq []
    end

    it "returns nil when no numbers found" do
    diary = Diary.new
    phonebook = Phonebook.new(diary)
    diary.add(DiaryEntry.new("title 1", "phone number is"))
    expect(phonebook.extract_phone_number).to eq []
    end
  end
end 