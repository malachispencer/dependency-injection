require 'exercise_1'

describe Note do
  let(:formatter) { double :formatter }
  let(:note) { Note.new('hard day', 'extracting classes was tough', formatter) }

  describe '#display' do
    it 'prints a formatted note' do
      allow(formatter).to receive(:format) { "Title: #{note.title}\n#{note.body}" }
      expect(note.display).to eq("Title: #{note.title}\n#{note.body}")
    end
  end
end

describe NoteFormatter do
  let(:note) { double('note', title: 'hard day', body: 'extracting classes was tough') }
  
  describe '#format' do
    it 'prints a formatted note' do
      expect(subject.format(note)).to eq("Title: #{note.title}\n#{note.body}")
    end
  end
end