


class Answer

	#accessor allows read and write of this class
	attr_accessor :answer, :is_default 
#initializes itself when called upon and 
# asks for the variable answer to be passed into it
# also looks for true or false in 
	def initialize(answer, is_default)
		@answer = answer 
		@is_default = is_default 	
	end
# creates a function that will look in the main script
# 
	def give_answer
		puts @answer.sample
	end
end