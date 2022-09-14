require './lib/password_checker.rb'

describe PasswordChecker do
  it "is valid if the length is equal to 8" do
    password = PasswordChecker.new
    result = password.check("abcdefgh")
    expect(result).to eq true
  end

  it "is valid if the length is greater than 8" do
    password = PasswordChecker.new
    result = password.check("abcdefghijklm")
    expect(result).to eq true
  end
  
  it "fails if the length is shorter than 8" do
    password = PasswordChecker.new
    expect{ password.check("abc") }.to raise_error "Invalid password, must be 8+ characters."
  end
end 