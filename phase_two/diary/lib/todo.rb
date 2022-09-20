class TodoList
  def initialize
    @todos = []
  end
  
  def add(task) 
    @todos << task
  end

  def complete(task)
    fail "Add task first" unless @todos.include?(task)
    @todos.delete(task)
  end

  def all
    return @todos
  end
end
