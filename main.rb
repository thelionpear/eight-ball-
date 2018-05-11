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
#duplicate found is made false to start with 
	duplicate_found = false
# goes through the @answer_bank array and turns each thing in it into the variable "item"
# then checks if that is equal to the thing the user submitted
# it sets duplicate found to true then it triggers that function
# if it remains false, it keeps going through the function
	@answer_bank.each{ |item|
		if answer_input == item.answer 
			duplicate_found = true 
		end
	}
# if the answer the user gives triggers the duplicate found function, it 
# puts the statement and takes them back to the beginning of the add answer function 
# we had to put the return command inside a separate function because it can't be with 
# the lambda (the pipe thingy) above 
	if duplicate_found
		puts "You cannot add an answer that already exists."
		add_answer
		return
	end
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

def print_answers 
	@answer_bank.each{ |item|
		puts item.answer
	}
	menu 
end 

menu 