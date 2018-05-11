require 'pry'
require_relative 'answers'
require 'pry'

### MAIN MENU ###

def menu
	puts "\n"
	puts "*" * 63
	puts "\t\tWelcome to the Magic Eight Ball"
	puts "\tAsk a yes or no question and cross your fingers!"
	puts "*" * 63
	user_selection
end

### USER SELECTION ###

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

### ADD ANSWER ###

def add_answer
	puts "\tWhat answer would you like to add?"
	 answer_input = gets
	 if answer_input == "nevermind"
		 puts "Returning to main menu, not adding anything"
		 menu
	 else
	  @answers << answer_input
	end
	puts "You just added #{@answers.last}"
	puts "Returning to main menu"
	menu
end

### PRINT ANSWERS ###

def print_answers
	puts "\n"
	puts "\tHow do your overall chances look?"
	puts @answers
	menu
end

### RESET ANSWERS ###

def reset_answer
	puts "\tAre you sure you want to reset all answers? [Y/N]"
	choice = gets.strip
	if choice == "Y" || choice == "y"
		puts "Back to square one..."
		Answer.new
	else
		puts "Your chances have remained the same, live another day!"
	menu
	end
	binding.pry
end

Answer.new

class PlayMagic
	attr_accessor :ans

#binding.pry
	@answer_bank = [Answer.comment('yes'), Answer.comment('no'), Answer.comment('maybe')]
	
	def initialize

		@player_answers = []
		menu
	end
	

	def menu
		puts "Welcome to the magic eight ball"
		puts "What would you like to know?"

		user_selection
	end

	def add_answer
		puts "What answer would you like to add?"

		input_answer = Answer.new(gets.strip)	
		@player_answers << input_answer 

		@answer_bank.concat(@player_answers)

		puts "you just added #{@answer_bank.last}"

		menu
	end

	def reset_answer

	end

	def print_answers
		@answer_bank.each { |item| puts item}
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
				puts "goodbye"
				exit
			else
				puts "#{@answer_bank.sample.ans}"
		end
		menu
	end
end


PlayMagic.new

