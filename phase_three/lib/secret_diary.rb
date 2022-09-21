class SecretDiary
  def initialize(diary)
    @diary = diary
    @diary_lock = true
  end

  def read
    fail "Go away!" if @diary_lock 
    return @diary.read
  end

  def lock
    @diary_lock = true
  end

  def unlock
    @diary_lock = false
  end
end