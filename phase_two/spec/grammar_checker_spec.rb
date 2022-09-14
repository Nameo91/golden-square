require './lib/grammar_checker.rb'

RSpec.describe "grammar_checker method" do
  it "fails" do
    expect { grammar_checker("") }.to raise_error "This is not a sentence."
  end  

  it "messages correct if given text starts with a capital letter and ends withfull stop" do
    check = grammar_checker("Hello, Makers.")
    expect(check).to eq "Correct!"
  end 

  it "messages wrong if given text only starts with a capital letter" do
    check = grammar_checker("Hello, Makers")
    expect(check).to eq "WRONG! Check your grammar."
  end 

  it "messages wrong if given text only ends with full stop" do
    check = grammar_checker("hello, Makers.")
    expect(check).to eq "WRONG! Check your grammar."
  end 
  
  it "messages wrong if given text with no a capital letter and full stop" do
    check = grammar_checker("hello, Makers")
    expect(check).to eq "WRONG! Check your grammar."
  end 
end