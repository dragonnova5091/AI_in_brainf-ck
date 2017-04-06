require_relative "../compilier/compilier1.rb"

#  !!!
#this one doesn't work
#  !!!



$bfchars = "+++---.,><[]".split("")

class Chromosome

	attr_accessor :chromosome
	
	def initialize(length)
		@chromosome = ""
		length.times do 
			@chromosome += $bfchars[rand(0..$bfchars.length-1)]
		end
		
	end
	
	def prints
		puts @chromosome
	end
	
	def new_chromosome
		num = @chromosome.split("").length
		@chromosome = ""
		num.times do
			@chromosome += $bfchars[rand(0..$bfchars.length-1)]
			
		end
	end
	
end


testCromosome = Chromosome.new(50)
test = false
tests = 1

while test 
begin 
	Brainfuck.evaluate(testCromosome.chromosome)
	test = false
rescue
	testCromosome = Chromosome.new(50)
	test = true
	tests += 1
end
end
#puts testCromosome.chromosome

