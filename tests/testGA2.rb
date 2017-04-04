
#this program searches for a set of 10 numbers and tries to get them to total to 100 using a GA



TARGET_VALUE = 116
POPULATION_SIZE = 80
MUTATION_RATE = 0.02
#CROSSOVER_RATE = 0.8

class Chromosome
	attr_reader :best_fitness, :mostfit
	def initialize
		@best_fitness = [0,1]
		@population = []
		POPULATION_SIZE.times do  
			temp = []
			rand(8..12).times do
				temp << rand(1..10)
			end
			@population << temp
		end
		#puts @population.length 
	end
	
	def fitness 
		@corresponding_fitness = []
		for chromosome in @population
			tempfitness= 0 
			chromosome.each do |gene|
				tempfitness += gene
			end
			@corresponding_fitness << tempfitness
			#puts tempfitness
		end
	end
	
	def next_parents
		tempnum = 4
		@best_fitness = @corresponding_fitness.sort.uniq
		#print @best_fitness
		@mostfit = []
		a = 0 		
		@corresponding_fitness.each do |tempfitness|
			if tempfitness == @best_fitness[@best_fitness.length - 1] && tempnum <=4 && tempnum > 0
				@mostfit << @population[a]
				tempnum -= 1 
			elsif tempfitness == @best_fitness[@best_fitness.length - 2] && tempnum <=4 && tempnum > 0
				@mostfit << @population[a]
				tempnum -= 1 
			elsif tempfitness == @best_fitness[@best_fitness.length - 3] && tempnum <=4 && tempnum > 0
				@mostfit << @population[a]
				tempnum -= 1 
			elsif tempfitness == @best_fitness[@best_fitness.length - 4] && tempnum <=4 && tempnum > 0
				@mostfit << @population[a]
				tempnum -= 1 
			end
			a += 1
		end
		
		#print @mostfit
	end
	
	def make_new_population
		@new_population = []  
		
		#crossover(@mostfit[0], @mostfit[1])
		
		20.times do 
			crossover(@mostfit[0], @mostfit[1])
		end
		20.times do 
			crossover(@mostfit[2], @mostfit[3])
		end
		20.times do 
			crossover(@mostfit[1], @mostfit[2])
		end
		20.times do 
			crossover(@mostfit[0], @mostfit[3])
		end
		@new_population = @population
		#puts @population.length 
	end
	
	def crossover(parent1, parent2)
		if parent1.length > parent2.length
			templength = parent1.length
		else 
			templength = parent2.length
		end
		if rand < MUTATION_RATE
			parent1 = mutate(parent1)
		end
		if rand < MUTATION_RATE
			parent2 = mutate(parent2)
		end
		split = rand(0..templength - 1)
		o1_firsthalf = []
		o2_firsthalf = []
		o1_secondhalf = []
		o2_secondhalf = []
		
		num = 0 
		parent1.each do |gene|
			if num < split 
				o1_firsthalf << gene 
			elsif num >= split 
				o2_secondhalf << gene
			end
			num += 1 
		end
		
		num = 0 
		parent2.each do |gene|
			if num < split 
				o2_firsthalf << gene
			elsif num >= split 
				o1_secondhalf << gene
			end
			num += 1 
		end
		
		offspring1 = []
		offspring2 = []
		
		o1_firsthalf.each do |gene|
			offspring1 << gene
		end
		o1_secondhalf.each do |gene|
			offspring1 << gene 
		end
		
		o2_firsthalf.each do |gene|
			offspring2 << gene 
		end
		o2_secondhalf.each do |gene|
			offspring2 << gene 
		end
		
		#print "\n"
		
		@new_population.push(offspring1.shuffle)
		@new_population << offspring2.shuffle
	end
	
	def mutate(chromosome)
		typeofmutation = rand(1..4)
		case typeofmutation
			when 1 #change number
				num = rand(0..chromosome.length - 1)
				chromosome[num] = rand(1..10)
			when 2 #switch 
				num1 = rand(0..chromosome.length - 1)
				num2 = rand(0..chromosome.length - 1)
				gene1 = chromosome[num1]
				gene2 = chromosome[num2]
				chromosome[num1] = gene2
				chromosome[num2] = gene1
			when 3 #duplicate 
				num = rand(0..chromosome.length - 1)
				num2 = rand(-1..1)
				chromosome[num2] = chromosome[num]
			when 4 #increase
				num = rand(0..chromosome.length - 1)
				if chromosome[num] < 10
					chromosome[num] += 1
				end
			when 5 #decrease 
				num = rand(0..chromosome.length - 1)
				if chromosome[num] > 1
					chromosome[num] -= 1
				end
		end
		
		return chromosome
	end
end

testchromosome = Chromosome.new
while testchromosome.best_fitness[(testchromosome.best_fitness.length)-1] < TARGET_VALUE
testchromosome.fitness
testchromosome.next_parents 
testchromosome.make_new_population
end
print "\n"
print testchromosome.mostfit
print "\n"
print testchromosome.best_fitness
#puts rand
#sleep 5







