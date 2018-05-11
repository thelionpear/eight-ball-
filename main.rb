# create menu
# take user input
# output random answer
# user add to answer array
# ability to resert array
# abiltiy print all answer
# exit

require 'pry'
require_relative 'answers'

def menu
	puts "\n"
	puts "*" * 63
	puts "\t\tWelcome to the Magic Eight Ball"
	puts "\tAsk a yes or no question and cross your fingers!"
	puts "*" * 63
	user_selection
end

def add_answer
	puts "\tWhat answer would you like to add?"
	 answer_input = gets
	 if answer_input == "quit" || answer_input == "QUIT"
		 puts "Returning to main menu, not adding anything"
		 menu
	 else
	  @answers << answer_input
	end
	puts "You just added #{@answers.last}"
	puts "Returning to main menu"
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
			puts "\t#{@answers.sample}"
		end
	menu
end

def print_answers
	puts "\n"
	puts "\tHow do your overall chances look?"
	puts @answers
	menu
end

def reset_answer
	puts "\tAre you sure you want to reset all answers? [Y/N]"
	choice = gets.strip
	if choice == "Y" || "y"
		puts "Back to square one..."
		Answer.new
	else
		puts "Your chances have remained the same, live another day!"
	menu
	end
end

Answer.new
