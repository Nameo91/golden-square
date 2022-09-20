# Diary Multi-Class Planned Design Recipe

## 1. Describe the Problem

_Put or write the user story here. Add any clarifying notes you might have._
> As a user
> So that I can record my experiences
> I want to keep a regular diary

> As a user
> So that I can reflect on my experiences
> I want to read my past diary entries

> As a user
> So that I can reflect on my experiences in my busy day
> I want to select diary entries to read based on how much time I have and my reading speed

> As a user
> So that I can keep track of my tasks
> I want to keep a todo list along with my diary

> As a user
> So that I can keep track of my contacts
> I want to see a list of all of the mobile phone numbers in all my diary entries

## 2. Design the Class System

_Consider diagramming out the classes and their relationships. Take care to
focus on the details you see as important, not everything. The diagram below
uses asciiflow.com but you could also use excalidraw.com, draw.io, or miro.com_

```
┌───────────────────────┐   ┌─────────────────┐
│ SelectEntry           │   │Phonebook        │
│ ------------          │   │----------       │
│ - with wpm, diary     │   │- with diary     │
│ - find_best_readalbe_ │   │- extract_phone_ │
│   entry               │   │  number         │
│                       │   │- number_list    │
└──────────────────┬────┘   └──┬──────────────┘
                   │           │
                   │           │
                ┌──▼───────────▼──┐       ┌────────────────┐
                │                 │       │                │
                │ Diary           │       │ DiaryEntry     │
                │----------       ├──────►│ -----------    │
                │- add            │       │ - title        │
                │- list           │       │ - contents     │
                │                 │       │ - count_words  │
                └─────────────────┘       └────────────────┘

                ┌─────────────────┐
                │                 │
                │TodoList         │
                │----------       │
                │- task           │
                │- add            │
                │- complete       │
                │- all            │
                └─────────────────┘

```

_Also design the interface of each class in more detail._

```ruby
class Diary
  def initializer
    #...
  end

  def add(entry) #entry is an intance of DiaryEntry
    # add an entry to the list
  end

  def list
    # returns the list of the diary entries added
  end
end

class DiaryEntry
  def initializer(title, contents) # title and contents are a string
    #...
  end
  
  def title
    # returns title
  end
  
  def contents
    # returns contents
  end

  def count_words
    # counts the number of words in the contents and returns an Integer
  end
end

class SelectEntry
  def initializer(wpm,diary) # wpm is an Integer, representing the number of words can be read in a minute
    # ...                         # diary is an instance of DiaryEntry
  end

  def wpm
    # returns wpm
  end
  
  def diary
    # returns diary
  end

  def find_best_readable_entry(minute)  # minute is an Integer, representing the given time to read
    # returns the best readable entry within the given time
  end
end

class TodoList
  def initializer
    # ...
  end
  
  def add(task) # task is a string
    # add a task to the list
  end

  def complete(task) # task is a string
    # mark the completed task and remove from the list
  end

  def all
    # returns the list of incomplete tasks 
  end
end

class Phonebook
  def initializer(diary) #diary is an instance of DiaryEntry
    # ...
  end

  def diary
    # returns diary
  end

  def extract_phone_number
    # extract the phone number from the contents of DiaryEntry as a string
  end

  def number_list
    # returns the list of phone numbers found in diary
  end
end

```

## 3. Create Examples as Integration Tests

_Create examples of the classes being used together in different situations and
combinations that reflect the ways in which the system will be used._

```ruby
# 1. Get all diary entries
diary = Diary.new
diary_1 = DiaryEntry.new("title 1", "content one")
diary_2 = DiaryEntry.new("title 2", "content two")
diary_3 = DiaryEntry.new("title 3", "content three")
diary.add(diary_1)
diary.add(diary_2)
diary.add(diary_3)
diary.list # => [diary_1, diary_2, diary_3]

# 2. Select entries to read based on how much time I have and my reading speed
# all words can be read in the given time
diary = Diary.new
select_entry = SelectEntry.new(2,diary)
diary_1 = DiaryEntry.new("title 1", "content one")
diary_2 = DiaryEntry.new("title 2", "content one two")
diary_3 = DiaryEntry.new("title 3", "content one two three")
diary.add(diary_1)
diary.add(diary_2)
diary.add(diary_3)
select_entry.find_best_readable_entry(1) # => diary_1

# with the closest one
diary = Diary.new
select_entry = SelectEntry.new(4,diary)
diary_1 = DiaryEntry.new("title 1", "content one")
diary_2 = DiaryEntry.new("title 2", "content one two")
diary_3 = DiaryEntry.new("title 3", "content one two three four")
diary.add(diary_1)
diary.add(diary_2)
diary.add(diary_3)
select_entry.find_best_readable_entry(1) # => diary_2

# nothing can be read in the given time
diary = Diary.new
select_entry = SelectEntry.new(1,diary)
diary_1 = DiaryEntry.new("title 1", "content one")
diary_2 = DiaryEntry.new("title 2", "content one two")
diary_3 = DiaryEntry.new("title 3", "content one two three four")
diary.add(diary_1)
diary.add(diary_2)
diary.add(diary_3)
select_entry.find_best_readable_entry(1) # => nil

#fails if given zero minutes
diary = Diary.new
select_entry = SelectEntry.new(0,diary)
diary_1 = DiaryEntry.new("title 1", "content one")
diary_2 = DiaryEntry.new("title 2", "content one two")
diary_3 = DiaryEntry.new("title 3", "content one two three four")
diary.add(diary_1)
diary.add(diary_2)
diary.add(diary_3)
select_entry.find_best_readable_entry(0) # => "Time must be given more than zero."

# 3. Get all tasks in todo list except the completed tasks
todo = TodoList.new
todo.add("Buy milk")
todo.add("Buy bread")
todo.add("Go to gym")
todo.complete("Buy bread")
todo.all # => ["Buy milk", "Go to gym"]

#fails when the complete task doesn't exist in the list
todos = TodoList
todos.add("Buy milk")
todos.complete("Go to gym") # => "Add task first"

# 4. Get all phone numbers found in DiaryEntry
# gather all numbers
diary = Diary.new
phonebook = Phonebook.new(diary)
diary_1 = DiaryEntry.new("title 1", "phone number is 0700000000")
diary_2 = DiaryEntry.new("title 2", "Jay changed number: 0700000001")
diary_3 = DiaryEntry.new("title 3", "I got Kate's number. 0700000002")
diary.add(diary_1)
diary.add(diary_2)
diary.add(diary_3)
phonebook.extract_phone_number
phonebook.number_list # => ["070000000", "0700000001", "0700000002"]

# no dupliate
diary = Diary.new
phonebook = Phonebook.new(diary)
diary_1 = DiaryEntry.new("title 1", "phone number is 0700000000")
diary_2 = DiaryEntry.new("title 2", "Jay changed number: 0700000001")
diary_3 = DiaryEntry.new("title 3", "I got Kate's number. 0700000000")
diary.add(diary_1)
diary.add(diary_2)
diary.add(diary_3)
phonebook.extract_phone_number
phonebook.number_list # => ["070000000", "0700000001"]

# too few digits
diary = Diary.new
phonebook = Phonebook.new(diary)
diary_1 = DiaryEntry.new("title 1", "phone number is 070000")
diary.add(diary_1)
phonebook.extract_phone_number
phonebook.number_list # => nil

# no numbers found
diary = Diary.new
phonebook = Phonebook.new(diary)
diary_1 = DiaryEntry.new("title 1", "phone number is")
diary.add(diary_1)
phonebook.extract_phone_number
phonebook.number_list # => nil

```

## 4. Create Examples as Unit Tests

_Create examples, where appropriate, of the behaviour of each relevant class at
a more granular level of detail._

```ruby
# 1. Diary
# initially 
diary = Diary.new
diary.list # => []

# 2. DiaryEntry
# constructs
diary_entry = DiaryEntry.new("my title", "my contents")
diary_entry.title # => "my title"
diary_entry.contents # => "my contents"

#count_words with contents
diary_entry = DiaryEntry.new("my title", "my contents")
diary_entry.count_words # => 2

#count_words with an empty string 
diary_entry = DiaryEntry.new("my title", "")
diary_entry.count_words # => 0

# 3. SelectEntry 
# constructs
select_entry = SelectEntry.new(2,diary)
select_entry.wpm # => 2
select_entry.diary # => diary

#fails if wpm is zero
select_entry = SelectEntry.new(0,diary)
select_entry.wpm # => "WPM must be above zero."


# 4. TodoList
#initially 
todos = TodoList
todos.all # => []

#adds new tasks 
todo = TodoList.new
todo.add("Buy milk")
todo.add("Buy bread")
todos.all # => ["Buy milk", "Buy bread"]

# 5. Phonebook
#construct 
phonebook = Phonebook.new(diary)
phonebook.diary = diary

```

_Encode each example as a test. You can add to the above list as you go._

## 5. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green,
refactor to implement the behaviour._