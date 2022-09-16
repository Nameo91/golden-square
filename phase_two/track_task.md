# Track Task Class Design Recipe

## 1. Describe the Problem

_Put or write the user story here. Add any clarifying notes you might have._

> As a user
> So that I can keep track of my tasks
> I want a program that I can add todo tasks to and see a list of them.

> As a user
> So that I can focus on tasks to complete
> I want to mark tasks as complete and have them disappear from the list.


## 2. Design the Class Interface

_Include the initializer and public methods with all parameters and return values._

```ruby

class TodoList
  def initializer 
    # ...
  end

  def add(task) # task is a string adding it to a list
  #return nothing   
  end

  def list
   #returns the list of task as a string 
   #except the complieted one 
  end

  def complete(task) #task is a string to mark completed task
    #returns nothing 
    #it fails if the task doesn't dexist
end

```

## 3. Create Examples as Tests

_Make a list of examples of how the class will behave in different situations._

```ruby

# 1
todo = TodoList.new
todo.list # => []

# 2
todo = TodoList.new
todo.add("Buy a pint of milk")
todo.list # => ["Buy a pint of milk"]

# 3
todo = TodoList.new
todo.add("Buy a pint of milk")
todo.add("Buy a bag of bread")
todo.list # => ["Buy a pint of milk", "Buy a bag of bread]

# 4
todo = TodoList.new
todo.add("Buy a pint of milk")
todo.add("Buy a bag of bread")
todo.complete("Buy a bag of bread")
todo.list # => ["Bay a pint of milk"]

# 5
todo = TodoList.new
todo.add("Buy a pint of milk")
todo.complete("Buy a bag of sugar")
todo.list # => fails "No such task"

```

_Encode each example as a test. You can add to the above list as you go._

## 4. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._