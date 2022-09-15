require_relative '../lib/grammar_stats.rb'

RSpec.describe GrammarStats do
  describe "check method" do
    context "given an empty array" do
      it "fails" do
        text = GrammarStats.new 
        expect{ text.check("") }.to raise_error "Text NOT GIVEN"
      end
    end

    context "given a text starts with capital and ends with punctuation" do
      it "returns true" do
        text = GrammarStats.new
        result = text.check("Hello, Makers.")
        expect(result).to eq true
      end
    end

    context "given a text starts with capital" do
      it "returns false" do
        text = GrammarStats.new
        result = text.check("Hello, Makers")
        expect(result).to eq false
      end  
    end

    context "given a text ends with punctuation" do
      it "returns false" do
        text = GrammarStats.new
        result = text.check("hello, Makers!")
        expect(result).to eq false
      end  
    end
    
    context "given a text without capital and puncuation" do
      it "returns false" do
        text = GrammarStats.new
        result = text.check("hello, Makers")
        expect(result).to eq false
      end  
    end
  end

  describe "percentage_good method" do
    it "returns the percentage of texts checked" do
      text = GrammarStats.new
      text.check("Hello, Makers!")
      text.check("Hello, Makers")
      result = text.percentage_good
      expect(result).to eq 50
    end
  end
end