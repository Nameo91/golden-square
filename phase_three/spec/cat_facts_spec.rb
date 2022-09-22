require_relative '../lib/cat_facts.rb'

RSpec.describe CatFacts do
  it "returns the fact about cat" do
    fake_facts = double :requester
    allow(fake_facts).to receive(:get).with(URI("https://catfact.ninja/fact")).and_return('{"fact":"In Ancient Egypt, when a person\'s house cat passed away, the owner would shave their eyebrows to reflect their grief.","length":117}')
    cat_facts = CatFacts.new(fake_facts)
    expect(cat_facts.provide).to eq "Cat fact: In Ancient Egypt, when a person\'s house cat passed away, the owner would shave their eyebrows to reflect their grief." 
  end
end