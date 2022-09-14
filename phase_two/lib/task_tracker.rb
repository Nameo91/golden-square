def task_tracker(text)
  fail "Nothing to be checked!" if text.empty?
  text.include? "#TODO"
end