=begin
Makers. 04/11/20. Refactored 13/11/20.
=end

require 'exercise_2'

describe Diary do
  describe '#index' do
    let(:entry) { double('entry', title: 'hard day', body: 'making progress now') }
    let(:entry_class) { double('entry_class', new: entry) }
    let(:diary) { Diary.new(entry_class) }

    it 'prints all the added entry titles' do
      diary.add('', '')
      expect(diary.index).to eq('hard day')
    end
  end
end