=begin
Makers. 05/11/20. Here I wrote a test for the Greeter class, which doesn't use the actual Kernel module.
1) We first created a simple kernel double.
2) We then create an instance of Greeter, where we pass in the kernel double, this double will be @kernel in greeter.
3) Inside the it block, we stub the gets method called in the greet method of the class, and set it to return "Malachi\n".
4) We then set an expectation for the greet method to output the greet message with the return value we set for gets, to
   standard output.
4) The chomp method will remove \n from "Malachi\n". But because we use the puts method instead of print, a newline is added
   to the end of the greet message.
=end

require 'exercise_4'

describe Greeter do
  describe '#greet' do
    let(:kernel) { double :kernel }
    let(:greeter) { Greeter.new(kernel) }

    it 'takes the users name and returns a greet message' do
      allow(kernel).to receive(:gets) { "Malachi\n" }
      expect { greeter.greet }.to output("What is your name?\nHello, Malachi\n").to_stdout
    end
  end
end