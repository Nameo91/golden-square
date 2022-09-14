# Grammar Checker Method Design Recipe

## 1. Describe the Problem

_Put or write the user story here. Add any clarifying notes you might have._

> As a user
> So that I can improve my grammar
> I want to verify that a text starts with a capital letter   and ends with a suitable sentence-ending punctuation mark.

## 2. Design the Method Signature

_Include the name of the method, its parameters, return value, and side effects._

```ruby

# grammar_checker checks if the given text starts with a capital letter and ends with punctuatino mark.

checker = grammar_checker(text)

# text is a string with words in it
```

## 3. Create Examples as Tests

_Make a list of examples of what the method will take and return._

```ruby
# 1
grammar_checker("")
# => fail "This is not a sentence."

# 2
grammar_checker("Hello, Makers.")
# => Correct!

# 3 
grammar_checker("Hello, Makers")
# => WRONG! Check your grammar.

# 4
grammar_checker("hello, Makers.")
# => WRONG! Check your grammar.

# 5
grammar_checker("Hello, Makers")
# => WRONG! Check your grammar.
```

_Encode each example as a test. You can add to the above list as you go._

## 4. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._