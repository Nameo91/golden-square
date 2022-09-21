require_relative '../lib/secret_diary.rb'

RSpec.describe SecretDiary do
  context "initially" do
    it "fails to read" do
      diary = double(:fake_diary)
      secret_diary = SecretDiary.new(diary)
      expect{ secret_diary.read }.to raise_error "Go away!"
    end
  end

  context "when it is unlocked" do
    it "returns the contents" do
      diary = double(:fake_diary, read: "fake_contents")
      secret_diary = SecretDiary.new(diary)
      secret_diary.unlock
      expect(secret_diary.read).to eq "fake_contents"
    end
  end

  context "when it is locked" do
    it "returns the contents" do
      diary = double(:fake_diary, read: "fake_contents")
      secret_diary = SecretDiary.new(diary)
      secret_diary.lock
      expect{ secret_diary.read }.to raise_error "Go away!"
    end
  end
end
