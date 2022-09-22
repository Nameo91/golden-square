class TaskFormatter
  def initialize(task) 
    @task = task
  end

  def format
    @task.complete? == false ? "- [ ] #{@task.title}" : "- [x] #{@task.title}" 
  end
end 