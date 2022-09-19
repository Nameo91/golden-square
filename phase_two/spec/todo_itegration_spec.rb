require_relative '../lib/todo_list.rb'
require_relative '../lib/todo.rb'

RSpec.describe 'itegration' do
  context "when we add some tasks" do
    it "lists the all incomplete tasks" do
      task_list = TodoList.new
      task_1 = Todo.new("Buy milk")
      task_2 = Todo.new("Buy bread")
      task_list.add(task_1)
      task_list.add(task_2)
      expect(task_list.incomplete).to eq [task_1, task_2]
    end
  end

  context "when we mark the completed task" do
    it "lists only the incomplete tasks" do
      task_list = TodoList.new
      task_1 = Todo.new("Buy milk")
      task_2 = Todo.new("Buy bread")
      task_list.add(task_1)
      task_list.add(task_2)
      task_2.mark_done!
      expect(task_list.incomplete).to eq [task_1]
    end
    
    it "lists only the completed tasks" do
      task_list = TodoList.new
      task_1 = Todo.new("Buy milk")
      task_2 = Todo.new("Buy bread")
      task_list.add(task_1)
      task_list.add(task_2)
      task_2.mark_done!
      expect(task_list.complete).to eq [task_2]
    end
  end
  
  context "when we mark all tasks completed" do
    it "returns am empty array of incomplete tasks" do
      task_list = TodoList.new
      task_1 = Todo.new("Buy milk")
      task_2 = Todo.new("Buy bread")
      task_list.add(task_1)
      task_list.add(task_2)
      task_list.give_up!
      expect(task_list.incomplete).to eq []
    end

    it "returns am empty array of incomplete tasks" do
      task_list = TodoList.new
      task_1 = Todo.new("Buy milk")
      task_2 = Todo.new("Buy bread")
      task_list.add(task_1)
      task_list.add(task_2)
      task_list.give_up!
      expect(task_list.complete).to eq [task_1, task_2]
    end
  end
end