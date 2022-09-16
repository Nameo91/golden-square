require_relative '../lib/track_task.rb'

RSpec.describe TodoList do
  context "given no tasks" do
    it "returns an empty list" do
      todo = TodoList.new
      expect(todo.list).to eq []
    end
  end
  
  context "given a task" do
    it "has the task in the list" do
      todo = TodoList.new
      todo.add("Buy a pint of milk")
      expect(todo.list).to eq ["Buy a pint of milk"]
    end
  end
  
  context "given two tasks" do
    it "has the tasks in the list" do
      todo = TodoList.new
      todo.add("Buy a pint of milk")
      todo.add("Buy a bag of bread")
      expect(todo.list).to eq ["Buy a pint of milk", "Buy a bag of bread"]  
    end
  end  
  
  context "when we complete the task" do
    it "has the incomplete task in the list" do
      todo = TodoList.new
      todo.add("Buy a pint of milk")
      todo.add("Buy a bag of bread")
      todo.complete("Buy a bag of bread")
      expect(todo.list).to eq ["Buy a pint of milk"]
    end
  end
  
  context "when we complete the task doesn't exist" do
    it "fails" do
      todo = TodoList.new
      todo.add("Buy a pint of milk")
      expect{ todo.complete("Buy a bag of sugar") }.to raise_error "No such task!"
    end
  end
end 