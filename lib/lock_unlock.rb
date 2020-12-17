class LockUnlock
  def lock(diary)
    diary.locked = true
  end

  def unlock(diary)
    diary.locked = false
  end
end
