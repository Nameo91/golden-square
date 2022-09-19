class Todo
  def initialize(task) 
    @task = task 
    @task_complete = false
  end

  def task
    return @task 
  end

  def mark_done!
    @task_complete = true
  end

  def done?
    return @task_complete
  end
end