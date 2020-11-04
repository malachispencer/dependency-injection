=begin
Makers. 04/11/20. Here I implement the tests to test the classes in isolation from each other using doubles.
1) For the Note class, I created a simple double called formatter.
2) I then created a Note instance and placed the formatter double in as the optional formatter parameter.
3) Inside the test for the display method, inside the it block, I use a method stub to allow the formatter double to receive
   the format method and return the formatted string with the actual title and body of the Note instance we created for the
   test.
4) When the display method is called on our Note instance, it uses our formatter double, calls format on it and our format
   mimics what the actual format method would do, returning the formatted note.
=end

require 'exercise_1'

describe Note do
  let(:formatter) { double :formatter }
  let(:note) { Note.new('hard day', 'extracting classes was tough', formatter) }

  describe '#display' do
    it 'prints a formatted note' do
      allow(formatter).to receive(:format) { "Title: #{note.title}\n#{note.body}" }
      expect(note.display).to eq("Title: hard day\nextracting classes was tough")
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