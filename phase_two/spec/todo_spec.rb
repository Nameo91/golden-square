require_relative '../lib/todo.rb'

RSpec.describe Todo do
  it "constructs" do
    task = Todo.new("Buy milk")
    expect(task.task).to eq "Buy milk"
  end
  
  context "when we add a task" do
    it "initially incompleted" do
      task = Todo.new("Buy milk")
      expect(task.done?).to eq false
    end
  
    it "is marked done when the task is completed" do
      task = Todo.new("Buy milk")
      task.mark_done!
      expect(task.done?).to eq true
    end
  end
end 