require_relative '../lib/task_formatter.rb'

RSpec.describe TaskFormatter do
  it "formats a task when it is not complete" do
    task = double(:faketask, complete?: false, title: "fake title")
    task_formatter = TaskFormatter.new(task)
    task.complete?
    expect(task_formatter.format).to eq "- [ ] #{task.title}"
  end

  it "formats a task when it is complete" do
    task = double(:faketask, complete?: true, title: "fake title")
    task_formatter = TaskFormatter.new(task)
    task.complete?
    expect(task_formatter.format).to eq "- [x] #{task.title}"
  end
end 