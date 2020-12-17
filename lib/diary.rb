class SecretDiary
  attr_accessor :locked, :entries, :lockunlock

  def initialize
    @locked = true
    @entries = []
    @lockunlock = LockUnlock.new
  end

  def add_entry(entry)
    raise 'DIARY IS LOCKED' if @locked == true
    @entries << entry
  end

  def get_entries
    raise 'DIARY IS LOCKED' if @locked == true
    @entries
  end
end
