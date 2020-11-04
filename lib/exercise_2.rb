=begin
Makers. 04/11/20. Here I had to amend the Diary class in order to make it testable in isolation - using a double - from its
dependency class Entry. Here is how I did it.
1) I deleted Entry.new(title, body) from the add method.
2) I placed a parameter in the initialize method, entry_class, which is by default the Entry class. But we can optionally
   make it a double. This is what ultimately allows us to then use a double to test Diary in an isolated manner.
3) Inside initialize, I set the @entry_class instance variable equal to the entry_class parameter.
4) In add, we create a new instance of the Entry class, or this can be stubbed in our test.
=end

class Diary
  def initialize(entry_class = Entry)
    @entries = []
    @entry_class = entry_class
  end

  def add
    @entries << @entry_class.new
  end

  def index
    titles = @entries.map { |entry| entry.title }
    titles.join("\n")
  end
end

class Entry
  def initialize(title, body)
    @title = title
    @body = body
  end

  attr_reader :title, :body
end