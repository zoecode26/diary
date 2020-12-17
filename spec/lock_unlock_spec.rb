require 'lock_unlock'
RSpec.describe LockUnlock do
  describe 'lock' do
    it 'locks the diary' do
      diary = SecretDiary.new
      diary.lockunlock.unlock(diary)
      diary.lockunlock.lock(diary)
      expect(diary.locked).to eq true
    end
  end

  describe 'unlock' do
    it 'unlocks the diary' do
      diary = SecretDiary.new
      diary.lockunlock.unlock(diary)
      expect(diary.locked).to eq false
    end
  end
end
