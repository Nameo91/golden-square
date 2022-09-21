require_relative '../lib/diary.rb'
require_relative '../lib/secret_diary.rb'

RSpec.describe "integration" do
  context "initially" do
    it "fails to read" do
      diary = Diary.new("my diary")
      secret_diary = SecretDiary.new(diary)
      expect{ secret_diary.read }.to raise_error "Go away!"
    end
  end

  context "when it is unlocked" do
    it "returns the contents" do
      diary = Diary.new("my diary")
      secret_diary = SecretDiary.new(diary)
      secret_diary.unlock
      expect(secret_diary.read).to eq "my diary"
    end
  end

  context "when it is locked" do
    it "returns the contents" do
      diary = Diary.new("my diary")
      secret_diary = SecretDiary.new(diary)
      secret_diary.lock
      expect{ secret_diary.read }.to raise_error "Go away!"
    end
  end
end