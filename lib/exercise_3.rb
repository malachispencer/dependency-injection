=begin
Makers. 05/11/20. Here I had to refactor the SayHello and EmailClient classes to make them testable in isolation using
doubles and stubs.
1) I took Message.new out of the message method and made it parameter of the message method instead.
2) I took EmailClient.new out of the run method and made it a parameter of the run method.
3) Nothing inside the Message class needed to change, because we are not testing the actual Message class in either of our
   tests or using its send method.
4) Prior to my coaching call with Tatsiana, I had added in initalize methods for EmailClient and SayHello, but not only was
   this unnecessary, she said when refactoring for exercises we generally don't need to add in methods.
5) Dependency injections can be done directly into methods, and this is preferable if only one method in the class needs
   that dependency. If more than one class needs a dependency, it can be injected in the initialize method of that class.
=end

class EmailClient
  def message(message = Message.new)
    message
  end
end

class Message
  def send(to, body)
    # Imagine I'm sending an email
  end
end

class SayHello
  def run(email = EmailClient.new)
    email.message.send("friend@example.com", "HELLO!")
  end
end