class Asciiconverter
	def convert(value)
		value = value.to_i
		if value >=32 && value <127
			return value.chr
		else 
			return " "
		end
	end
end
