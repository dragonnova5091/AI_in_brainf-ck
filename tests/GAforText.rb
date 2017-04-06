require_relative "../compilier/ascii_to_text/ascii_to_text.rb"



text = nil
while text == nil
	print "target text :>"
	text = gets.chomp
end
TARGETTEXT = text
POPULATIONSIZE = 5
MUTATIONRATE = 0.02 

TARGETASCII = []
TARGETTEXT.each_byte do |c|
	TARGETASCII.push(c)
end
#print TARGETASCII


class Genetic_Algorithm
	def initialize
		@ascii_converter = Asciiconverter.new
		@population = [] 
		
		POPULATIONSIZE.times do  
			temparray = [] 
			rand(10..60).times do 
				num = rand(32..126)
				temparray << num 
				
			end
			#puts temparray.length
			@population << temparray
		end
		
	end
	
	def fitness
		#length fitness
		length = TARGETTEXT.split("").length
		#puts length
		@corresponding_fitness_length = [] 
		num = 0 
		@population.each do |member|
			fit = 10/(length - member.length).abs.to_f
			@corresponding_fitness_length[num] = fit
			num +=1 
		end
		#value fitness
		@corresponding_fitness_value = [] 
		num = 0 
		@population.each do |member|
			
			total_fit = 0
			if member.length < TARGETASCII.length
				a = 0 
				member.each do |value|
					fit = 1/(value - TARGETASCII[a]).abs.to_f
					if fit == 1.0/0.0
						fit = 3
					end
					total_fit += fit
					a += 1 
				end
				@corresponding_fitness_value[num] = total_fit
			elsif member.length >= TARGETASCII.length
				a = 0 
				TARGETASCII.each do |value|
					fit = 1/(value - member[a]).abs.to_f
					if fit == 1.0/0.0 
						fit = 3
					end
					total_fit += fit
					a += 1 
				end
				@corresponding_fitness_value[num] = total_fit
			end
			num += 1 
		end
		
		#print @corresponding_fitness_length
		#print "\n"
		#print @corresponding_fitness_value
	end
	
	def make_new_population
		
	end
	
	def crossover(parent1, parent2)
		
		
	end
	
	def mutate(parent)
		type = rand(1..5)
		case type 
			when 1 #shuffle 
				parent = parent.shuffle
			when 2 #increase
				num = rand(0..parent.length-1)
				parent[num] += 1 
			when 3 #decrease
				num = rand(0..parent.length-1)
				parent[num] -= 1 
			when 4 #shorten
				parent = parent[0..parent.length - 2]
			when 5 #lengthen
				parent << rand(32..126)
		end
		return parent
	end
end

algorithm = Genetic_Algorithm.new()
algorithm.fitness



