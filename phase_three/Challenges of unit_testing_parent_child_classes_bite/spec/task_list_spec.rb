require "task_list"

RSpec.describe TaskList do
  it "initially has an empty list" do
    task_list = TaskList.new
    expect(task_list.all).to eq []
  end

  it "is initially not all complete" do
    task_list = TaskList.new
    expect(task_list.all_complete?).to eq false
  end

  # Unit test `#all` and `#all_complete?` behaviour
  describe "#all" do
    it "returns all objects" do
      task_list = TaskList.new
      task = double(:fake_task)
      task2 = double(:fake_task)
      task_list.add(task)
      task_list.add(task2)
      expect(task_list.all).to eq [task, task2]
    end
  end

  describe "#all_complete" do
    it "returns true when all tasks are complete" do
      task_list = TaskList.new
      task = double(:fake_task, complete?: true)
      task2 = double(:fake_task, complete?: true)
      task_list.add(task)
      task_list.add(task2)
      expect(task_list.all_complete?).to eq true
    end

    it "returns false when some tasks are incomplete" do
      task_list = TaskList.new
      task = double(:fake_task, complete?: false)
      task2 = double(:fake_task, complete?: true)
      task_list.add(task)
      task_list.add(task2)
      expect(task_list.all_complete?).to eq false
    end
  end
end
