=begin
Makers. 05/11/20.
=end

require 'exercise_3'

describe SayHello do
  describe '#run' do
    let(:say_hello) { SayHello.new }
    let(:email_client) { double :email_client }
    let(:message_instance) { double :message_instance }

    it 'sends HELLO! to friend@example.com' do
      allow(email_client).to receive(:message) { message_instance }
      allow(message_instance).to receive(:send) { "sent HELLO! to friend@example.com\n" }
      expect(say_hello.run(email_client)).to eq("sent HELLO! to friend@example.com\n")
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