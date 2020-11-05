=begin
Makers. 05/11/20. Here I wrote the tests for the SayHello and EmailClient classes, testing them in isolation.
1) For SayHello, we first create a double for an EmailClient instance, which we can pass in to the run method to act as a
   fake EmailClient instance.
2) In the actual method, the email_client instance has a message method called on it, so we create a method stub for that
   message method.
3) The message method, when passed no parameters, returns an instance of the Message class, so we create a simple double
   that represents an instance of the Message class and make our message method stub return that double.
4) The message instance then has a send method called on it, so we need a stub for the send method, we allow the message
   instance to receive the send method and return a fake message of an email being sent.
5) In our expectation we check that our tests produces the expected result.
6) The EmailClient class is dependent on the Message class and the message method of the EmailClient class simply returns
   what is passed into it. So we create a message_instance double and simply check whether the message method returns that
   double.
7) From the looks of our tests, we mimic classes and class instances using doubles whereas we mimic methods using stubs.
=end

require 'exercise_3'

describe SayHello do
  describe '#run' do
    let(:email_client) { double :email_client }
    let(:message_instance) { double :message_instance }

    it 'sends HELLO! to friend@example.com' do
      allow(email_client).to receive(:message) { message_instance }
      allow(message_instance).to receive(:send) { "sent HELLO! to friend@example.com\n" }
      expect(subject.run(email_client)).to eq("sent HELLO! to friend@example.com\n")
    end
  end
end

describe EmailClient do
  describe '#message' do
    let(:message_instance) { double :message_instance }

    it 'returns whatever is passed into it' do
      expect(subject.message(message_instance)).to eq(message_instance)
    end
  end
end