require_relative '../lib/todo_list.rb'

RSpec.describe TodoList do
  context "initially" do
    it "has an empty incompleted list" do
      task_list = TodoList.new
      expect(task_list.incomplete).to eq []
    end

    it "has an empty completed list" do
      task_list = TodoList.new
      expect(task_list.complete).to eq []
    end
  end
end 