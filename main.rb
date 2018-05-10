# create menu
# take user input
# output random answer
# user add to answer array
# ability to resert array
# abiltiy print all answer
# exit

#require_relative 'answers'

class Main

	attr_accessor :answers
	answer_bank = ['yes', 'no', 'maybe']
	
	def initialize
		@answers = Array.new(answer_bank)
	end
	

def menu
	puts "Welcome to the magic eight ball"
	puts "What would you like to know?"

	user_selection
end

def add_answer
	puts "What answer would you like to add?"

	answer_input = gets.strip

	@answers << answer_input

	puts "you just added #{@answers.last}"

	menu
end

def user_selection
	question = gets.strip.downcase

	case question
	when "add answer"
		add_answer
	when "reset answers"
		reset_answer
	when "see all answers"
		print_answers
	when "quit"
		exit
	else
		answer = Answer.new
		puts "#{@answer_bank.sample}"
	end
	menu
end
end

Main.new