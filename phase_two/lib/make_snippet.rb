def make_snippet(str)
  if str.split.length <= 5
  return str
  else 
    return str.split[0..4].join(' ') + '...'
  end
end