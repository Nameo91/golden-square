require_relative '../lib/todo.rb'

RSpec.describe TodoList do
  it "initially" do
    todos = TodoList.new
    expect(todos.all).to eq []
  end

  it "adds new tasks" do
    todos = TodoList.new
    todos.add("Buy milk")
    todos.add("Buy bread")
    expect(todos.all).to eq ["Buy milk", "Buy bread"]
  end

  it "marks and removes the completed task" do
    todos = TodoList.new
    todos.add("Buy milk")
    todos.add("Buy bread")
    todos.add("Go to gym")
    todos.complete("Buy bread")
    expect(todos.all).to eq ["Buy milk", "Go to gym"]
  end
  
  it "fails when the complete task doesn't exist in the list" do  
    todos = TodoList.new
    todos.add("Buy milk")
    expect{ todos.complete("Go to gym") }.to raise_error "Add task first"
  end
end 