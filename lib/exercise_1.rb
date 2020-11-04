=begin
Makers. 04/11/20. Here I had to refactor the Note class to make it testable without having to actually use its dependency
class - NoteFormatter - in the tests. The indication that I had done this successfully would be if I could test the output
of display while the format method is deleted (or commented out).
1) In order to refactor, I added a 3rd parameter to the initialize method of Note, formatter = NoteFormatter.new.
2) Inside the intiailize, I then replaced @formatter = NoteFormatter.new with @formatter = formatter.
3) What this now means is that while Note will ordinarily take in NoteFormatter instance by default, we can test the
   functionality of Note with a double that mimics its behaviour.
=end

class Note
  def initialize(title, body, formatter = NoteFormatter.new)
    @title = title
    @body = body
    @formatter = formatter
  end

  def display
    @formatter.format(self)
  end

  attr_reader :title, :body
end

class NoteFormatter
  def format(note)
    "Title: #{note.title}\n#{note.body}"
  end
end
