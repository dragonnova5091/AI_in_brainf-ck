require_relative "../compilier/ascii_to_text/ascii_to_text.rb"




print "target text :>"
TARGETTEXT = gets.chomp
POPULATIONSIZE = 5
MUTATIONRATE = 0.02 


class Genetic_Algorithm
	def initialize
		@ascii_converter = Asciiconverter.new
		@population = [] 
		temparray = [] 
		POPULATIONSIZE.times do  
			40.times do 
				temparray << rand(32..126)
			end
			@population << temparray
		end
		
		#tests 
		@population.each do |chromosome|
			chromosome.each do |gene|
				print @ascii_converter.convert(gene)
			end
			print "\n"
		end
	end
	
	def fitness
		
	end
	
	def crossover
		
	end
end

algorithm = Genetic_Algorithm.new()