require 'greet.rb'

RSpec.describe "greet method" do
  it "greet a given user" do
    result = greet("Narae")
    expect(result).to eq "Hello, Narae!"
  end
end