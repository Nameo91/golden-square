def reading_time(text)
  time = text.split.length
  return (time / 200.to_f).ceil
end