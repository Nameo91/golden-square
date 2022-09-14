# Reading Time Design Recipe

## 1. Describe the Problem
  _Put or write the user story here. Add any clarifying notes you might have._
  
> As a user
> So that I can manage my time
> I want to see an estimate of reading time for a text, assuming that I can read 200 words a minute.

## 2. Design the Method Signature
_Include the name of the method, its parameters, return value, and side effects._

```ruby
  time = reading_time(text)
  # * text is a string with a word in it
  # * time is a Integer representing a minute
```
## 3. Create Examples as Tests
_These are examples of the method being called with particular arguments, and what the method should return in each situation._

```ruby
  # 1
  reading_time("")
  # => 0

  # 2
  reading_time("one two three")
  # => 1

  # 3
  reading_time(TWO_HUNDRED_WORDS)
  # => 1

  # 4
  reading_time(THREE_HUNDRED_WORDS)
  # => 2

  # 5
  reading_time(FOUR_HUNDRED_WORDS)
  # => 2


```
_Encode each example as a test. You can add to the above list as you go._

## 4. Implement the Behavior
_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._