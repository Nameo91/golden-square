require 'counter.rb'

RSpec.describe Counter do
  it "initially reports a count of zero" do
    counter = Counter.new
    expect(counter.report).to eq "Counted to 0 so far."
  end

  it "reports a count of added values wiht one addition" do
    counter = Counter.new
    counter.add(7)
    expect(counter.report).to eq "Counted to 7 so far."
  end

  it "reports a count of all added values" do
    counter = Counter.new
    counter.add(5)
    counter.add(4)
    counter.add(3)
    counter.add(2)
    counter.add(1)
    expect(counter.report).to eq "Counted to 15 so far."
  end
end