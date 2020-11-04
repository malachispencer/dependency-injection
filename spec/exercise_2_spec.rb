=begin
Makers. 04/11/20. Here I had to create a test for the Diary class, which is dependent on the Entry class, but I had to not
use the actual Entry class in the test.
1) First I created a double for an Entry instance. Like an Entry instance, it has a title and a body as its properties.
2) I then created a double for the Entry class itself. The double possesses a new property, which can also be considered a
   new method, and we set this to return the entry double we created on the previous line.
3) I also could have made a very basic entry_class double with no property/method. Then inside the it block I could have used
   allow(entry_class).to receive(:new) { entry }.
4) We set our Diary class to take in the Entry class or an Entry double, so we pass in our entry_class double to the Diary
   instance we will use for our test.
5) In our it block, we call the add method on the Diary instance. Which will call the new method on the entry_class double,
   which will return our entry double and push it into the @entries array.
6) We then call the index instance method, which prints all the entry titles, and since we only added 1 title, it should
   return the title inside our entry double.
=end

require 'exercise_2'

describe Diary do
  describe '#index' do
    let(:entry) { double('entry', title: 'hard day', body: 'making progress now') }
    let(:entry_class) { double('entry_class', new: entry) }
    let(:diary) { Diary.new(entry_class) }

    it 'prints all the added entry titles' do
      diary.add
      expect(diary.index).to eq('hard day')
    end
  end
end