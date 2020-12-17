require 'diary'

RSpec.describe SecretDiary do

  context 'is locked' do
    it 'cannot be written to' do
      expect{subject.add_entry("test")}.to raise_error("DIARY IS LOCKED")
    end

    it 'cannot be read' do
      expect{subject.get_entries}.to raise_error("DIARY IS LOCKED")
    end
  end

  context 'is unlocked' do
    it 'can be written to' do
      subject.lockunlock.unlock(subject)
      subject.add_entry("test")
      expect(subject.entries).to include("test")
    end

    it 'can be read' do
      subject.lockunlock.unlock(subject)
      subject.add_entry("test")
      expect(subject.get_entries).to include("test")
    end

    it 'can store multiple entries' do
      subject.lockunlock.unlock(subject)
      subject.add_entry("test")
      subject.add_entry("test2")
      expect(subject.entries).to include("test", "test2")
    end

    it 'can read multiple entries' do
      subject.lockunlock.unlock(subject)
      subject.add_entry("test")
      subject.add_entry("test2")
      expect(subject.get_entries).to include("test", "test2")
    end
  end
end
