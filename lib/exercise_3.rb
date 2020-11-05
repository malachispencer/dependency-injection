=begin
Makers. 05/11/20.
=end

class EmailClient
  attr_reader :message
  
  def initialize(message = Message.new)
    @message = message
  end
end

class Message
  def send(to, body)
    puts "sent #{body} to #{to}"
  end
end

class SayHello
  def initialize(email = EmailClient.new)
    @email = email
  end

  def run
    @email.message.send("friend@example.com", "HELLO!")
  end
end