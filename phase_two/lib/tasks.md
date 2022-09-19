# Tasks Multi-Class Planned Design Recipe

## 1. Describe the Problem

_Put or write the user story here. Add any clarifying notes you might have._

> As a user
> So that I can keep track of my tasks
> I want a program that I can add todo tasks to and see a list of them.

> As a user
> So that I can focus on tasks to complete
> I want to mark tasks as complete and have them disappear from the list.

## 2. Design the Class System

_Consider diagramming out the classes and their relationships. Take care to
focus on the details you see as important, not everything. The diagram below
uses asciiflow.com but you could also use excalidraw.com, draw.io, or miro.com_

```
┌──────────────────────┐
│                      │
│  TodoList            │
│ ----------           │
│  - add               │
│  - completed         │
│  - incompleted       │
│  - mark all completed│
└───────────┬──────────┘
            │ TodoList has zero or
            │ more TodoTasks
            ▼
┌──────────────────────┐
│                      │
│  TodoTask            │
│ ----------           │
│  - mark_complete     │
│  - task              │
│  - completed?        │
│                      │
└──────────────────────┘
```

_Also design the interface of each class in more detail._

```ruby
class TodoList
  def initialize
  end

  def add(todo) # todo is an instance of Todo
    # Returns nothing
  end

  def incomplete
    # Returns all non-done todos
  end

  def complete
    # Returns all complete todos
  end

  def give_up!
    # Marks all todos as complete
  end
end

class Todo
  def initialize(task) # task is a string
    # ...
  end

  def task
    # Returns the task as a string
  end

  def mark_done!
    # Marks the todo as done
    # Returns nothing
  end

  def done?
    # Returns true if the task is done
    # Otherwise, false
  end
end
```

## 3. Create Examples as Integration Tests

_Create examples of the classes being used together in different situations and
combinations that reflect the ways in which the system will be used._

```ruby

# 1. initially add tasks to the incomplete list
  task_list = TodoList.new
  task_1 = Todo.new("Buy milk")
  task_2 = Todo.new("Buy bread")
  task_list.add(task_1)
  task_list.add(task_2)
  task_list.incomplete # => [task_1, task_2]

# 2. mark the completed tasks and list the incomplete tasks
  task_list = TodoList.new
  task_1 = Todo.new("Buy milk")
  task_2 = Todo.new("Buy bread")
  task_list.add(task_1)
  task_list.add(task_2)
  task_2.mark_done!
  task_list.incomplete # => [task_1]

# 3. mark the completed tasks and list the complete tasks
  task_list = TodoList.new
  task_1 = Todo.new("Buy milk")
  task_2 = Todo.new("Buy bread")
  task_list.add(task_1)
  task_list.add(task_2)
  task_2.mark_done!
  task_list.complete # => [task_2]

# 4. mark all tasks completed and list the incomplete tasks
  task_list = TodoList.new
  task_1 = Todo.new("Buy milk")
  task_2 = Todo.new("Buy bread")
  task_list.add(task_1)
  task_list.add(task_2)
  task_list.give_up!
  task_list.incomplete # => []

# 5. mark all tasks completed and list all
  task_list = TodoList.new
  task_1 = Todo.new("Buy milk")
  task_2 = Todo.new("Buy bread")
  task_list.add(task_1)
  task_list.add(task_2)
  task_list.give_up!
  task_list.complete # => [task_1, task_2]

```

## 4. Create Examples as Unit Tests

_Create examples, where appropriate, of the behaviour of each relevant class at
a more granular level of detail._

```ruby

# TaskList

# 1
  task_list = TodoList.new
  task_list.incomplete # => []
# 2
  task_list = TodoList.new
  task_list.complete # => []  

# Task
# 1. construct
  task = Todo.new("Buy milk")
  task.task.to eq "Buy milk"
# 2. initially mark the task incompleted
  task = Todo.new("Buy milk")
  task.done? # => false  

# 3. mark the task done when it is completedß
  task = Todo.new("Buy milk")
  task.mark_done!
  task.done? # => true

```

_Encode each example as a test. You can add to the above list as you go._

## 5. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green,
refactor to implement the behaviour._