$months = ['january', 'february', 'march', 'april', 'may', 'june', 'july', 'august', 'september', 'october', 'november', 'december']
@student_list = []

def get_students
	puts "Hello! Let's make a directory of students"
	puts "Please enter the student name."
	name = gets.strip
	while !name.empty?
		puts "Which cohort is #{name} in?"
		cohort = gets.strip.downcase
		cohort = check_cohort cohort
		puts "What is #{name}'s hobby?"
		hobby = gets.strip
		puts "What is #{name}'s country of birth?"
		country = gets.strip
		@student_list << {:name => name, :cohort =>  cohort,:hobby => hobby, :country => country}
		if @student_list.length <= 1
			puts "There is now #{@student_list.length} student in our directory. Add another student or Enter twice to exit"
		else
			puts "There are now #{@student_list.length} students in our directory. Add another student or Enter twice to exit"
		end
		name = gets.strip
	end
	@student_list
end

def check_cohort cohort_input
	while !$months.include?(cohort_input)
		puts 'That doesn\'t look like a month, please enter a month'
		cohort_input = gets.strip
	end
	cohort_input.to_sym
end

def print_students
	# student_list.sort_by! {|student| student[:cohort]}
	$months.each do |month|
		@student_list.each_with_index do |student,index|
			puts "#{student[:name]} in the #{student[:cohort].capitalize} cohort comes from #{student[:country]} and enjoys #{student[:hobby]}" if student[:cohort]==month.to_sym
		end
	 end
end

def print_header
	puts "The students at Maker's Academy are:"
end

def print_footer
	if @student_list.length <= 1
		puts "There is #{@student_list.length} lovely student in our cohort!"
	else
		puts "There are #{@student_list.length} lovely students in our cohort!"
	end
end

def print_menu
	puts ""
	puts 'Please choose from the following options:'
	puts '1. Input the students'
	puts '2. Show the students'
	puts '9. Exit programme'
end

def show_students
	if @student_list.length >0
		print_header
		puts ""
		print_students
		puts ""
		print_footer
	else
		puts 'No students to show, try adding some students!'
	end
end

def process(choice)
	case choice
		when '1'
			#input students
			@student_list = get_students
		when '2'
			#show students
			show_students
		when '9'
			puts "Goodbye"
			exit
		else
			puts "I don't know what you meant, please type a number to choose from our menu."
	end #end case
end

def interactive_menu
	puts 'Welcome to our directory.'
	loop do
		print_menu
		process(gets.chomp)
	end # end loop
end #end menu def

interactive_menu
