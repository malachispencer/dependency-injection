=begin
Makers. 05/11/20.
=end

require 'exercise_3'

describe SayHello do
  describe '#run' do
    let(:message) { double :message }
    let(:email_client) { double('email_client', message) }
    let(:say_hello) { SayHello.new(email_client) }

    it 'sends HELLO! to friend@example.com' do
      allow(message).to receive(:send) { "sent HELLO! to friend@example.com\n" }
      expect { say_hello.run }.to output("sent HELLO! to friend@example.com\n").to_stdout
    end
  end
end