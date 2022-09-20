require_relative '../lib/select_diary.rb'

RSpec.describe SelectEntry do
  it "constructs" do
    select_entry = SelectEntry.new(2, "diary")
    expect(select_entry.wpm).to eq 2
    expect(select_entry.diary).to eq "diary"
  end

  it "fails if wpm is zero" do
    select_entry = SelectEntry.new(0,"diary")
    expect{ select_entry.wpm }.to raise_error "WPM must be above zero."
  end
end 