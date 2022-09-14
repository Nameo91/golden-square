require './lib/task_tracker.rb'

RSpec.describe "task_tracker method" do
  it "fails" do
    expect { task_tracker("") }.to raise_error "Nothing to be checked!"
  end

  it "returns true" do 
    task = task_tracker("#TODO finish exercise one")
    expect(task).to eq true
  end
  
  it "returns false" do
    task = task_tracker("No task is here!")
    expect(task).to eq false
  end
end