# create menu
# take user input
# output random answer
# user add to answer array
# ability to resert array
# abiltiy print all answer
# exit

require_relative 'answers'

# initializes an array that has preset answers 
# it passes those answers into the answers class

@answer_bank = [
	Answer.new('yes', true),
	Answer.new('no', true),
	Answer.new('maybe', true)
]


def menu
	puts "Welcome to the magic eight ball"
	puts "What would you like to know?"
	puts "If you don't want to continue playing, type Quit"

	user_selection
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
			puts @answer_bank.sample.answer 
			menu 
	end
end 

def add_answer
	puts "What answer would you like to add?"

	answer_input = gets.strip
# creating a local variable called answer that takes user input
# and also adds on false to discriminate it from the default answers
	answer = Answer.new(answer_input, false)
# shovels the new variable "answer" onto the end of the answer_bank array
	@answer_bank << answer

	puts "You just added #{@answer_bank.last.answer}"

	menu 
end

def reset_answer 
	puts "Would you like to go back to the default answers? Y or N?"
	response = gets.chomp 
	case
		when response == "Y" || response == "y" 
# selects only items that have "true" for "is_default" to keep in array
			@answer_bank = @answer_bank.select {|item|
				item.is_default == true
			}
			menu 
		when response == "N" || response == "n"
			puts "Okay, keeping your customized answers."
			menu 
		else 
			puts "Not a valid response."
			reset_answer 
	end 
end 

menu 