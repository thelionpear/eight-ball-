class Answer
	attr_accessor :answers

	 def initialize
		   @answer_bank = [
				 'Yes',
				 'No',
				 'Maybe',
			 		'Absolutely not',
					'With compelte certainty',
					'Not a chance in hell',
					'Who are you kidding?',
					'Shoot for the stars!',
					'It\'s bound to happen',
					'Prepare to be surprised',
					'Quite certainly!'
					]
       @answers = Array.new(@answer_bank)
			 menu
	 end
end
#
# class Answer
# 	attr_accessor :answer
#
# 	def initialize
# 		@answer = answer
# 	end
#
# 	def give_answer
# 		puts @answer.sample
# 	end
# end

class Answer
	attr_accessor :ans

	def inititalize(ans)
		@ans = ans
	end
end

