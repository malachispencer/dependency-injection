=begin
Makers. 05/11/20. Here I had to refactor the Greeter class in order to make it testable in isolation from its dependency,
the Kernel module.
1) First I took the hard coded Kernal module out of the greet method, where it had been name = Kernel.gets.chomp.
2) Then I created an initialize method, where I pass the kernel into the class by default, but there is also the scope to
   allow @kernel to be a different module or class, or a double.
3) Note, the puts method will add a newline to the end of the string, while print does not.
=end

class Greeter
  def initialize(kernel = Kernel)
    @kernel = kernel
  end

  def greet
    puts "What is your name?"
    name = @kernel.gets.chomp
    puts "Hello, #{name}"
  end
end