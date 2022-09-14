# {{PROBLEM}} Method Design Recipe

## 1. Describe the Problem

_Put or write the user story here. Add any clarifying notes you might have._

> As a user
> So that I can keep track of my tasks
> I want to check if a text includes the string #TODO.

## 2. Design the Method Signature

_Include the name of the method, its parameters, return value, and side effects._

```ruby
# `task_tracker` tracks task by checking #TODO in the given text

track = task_tracker(text)
# *text is a string
```

## 3. Create Examples as Tests

_Make a list of examples of what the method will take and return._

```ruby
# 1
task_tracker("")
# => fail "Nothing to be checked!"

# 2
task_tracker("#TODO finish exercise one")
# => true

# 3
task_tracker("No task is here!")
# => false
```

_Encode each example as a test. You can add to the above list as you go._

## 4. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._