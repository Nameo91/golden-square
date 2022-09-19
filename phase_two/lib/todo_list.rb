class TodoList
  def initialize
    @tasks = []
  end

  def add(todo) 
    return @tasks << todo
  end

  def incomplete
    return @tasks.reject(&:done?)
  end

  def complete
    return @tasks.select(&:done?)
  end

  def give_up!
    @tasks.map(&:mark_done!) 
  end 
end
