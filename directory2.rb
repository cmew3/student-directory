$months = ['january', 'february', 'march', 'april', 'may', 'june', 'july', 'august', 'september', 'october', 'november', 'december']
@student_list = []

def add_students
	puts "Please enter the student name."
	name = STDIN.gets.chomp
	while !name.empty?
		puts "Which cohort is #{name} in?"
		cohort = input_valid_cohort
		puts "What is #{name}'s hobby?"
		hobby = STDIN.gets.chomp
		puts "What is #{name}'s country of birth?"
		country = STDIN.gets.chomp
		@student_list << {:name => name, :cohort =>  cohort,:hobby => hobby, :country => country}
		puts "There is now #{@student_list.length} student#{s_if_plural(@student_list)} in our directory. Add another student or Enter twice to exit"
		name = STDIN.gets.chomp
	end
	@student_list
end

def input_valid_cohort
	cohort = STDIN.gets.chomp.downcase
	while !$months.include?(cohort)
		puts 'That doesn\'t look like a month, please enter a month'
		cohort = STDIN.gets.chomp.downcase
	end
	cohort.to_sym
end

def s_if_plural array
	if array.length <2
		return ""
	else
		return "s"
end
	
end

def print_header
	puts ""
	puts "The students at Maker's Academy are:"
	puts "============================================"
	puts ""
end

def print_students
	$months.each do |month|
		student_list_by_month = @student_list.select {|student| student[:cohort]==month.to_sym}
		if student_list_by_month.length > 0
			puts "#{month.capitalize} cohort"
			puts "-"*(month.length + 7)
			student_list_by_month.each_with_index do |student,index|
				puts "#{index+1}. #{student[:name]} comes from #{student[:country]} and enjoys #{student[:hobby]}"
			end
			puts ""
		end
	end
end

def print_footer
	if @student_list.length <= 1
		puts "There is #{@student_list.length} lovely student in our directory!"
	else
		puts "There are #{@student_list.length} lovely students in our directory!"
	end
end

def print_menu
	puts ""
	puts 'Please choose from the following options:'
	puts ""
	puts '1. Input the students'
	puts '2. Show the students'
	puts '3. Save the students to file students.csv'
	puts '4. Load students from file'
	puts '9. Exit programme'
end

def show_students
	if @student_list.length >0
		print_header
		print_students
		print_footer
	else
		puts 'No students to show, try adding some students!'
	end
end

def process(choice)
	case choice
		when '1'
			@student_list = add_students
		when '2'
			show_students
		when '3'
			save_students
		when '4'
			load_students
		when '9'
			puts "Goodbye"
			exit
		else
			puts "I don't know what you meant, please type a number to choose from our menu."
	end 
end

def interactive_menu
	puts 'Welcome to our directory.'
	loop do
		print_menu
		process(STDIN.gets.chomp)
	end 
end 

def save_students
	#open the file for writing
	file = File.open("students.csv","w")
	@student_list.each do |student|
		student_data = [student[:name], student[:cohort], student[:hobby], student[:country]]
		csv_line = student_data.join(",")
		file.puts csv_line
	end
	file.close
end

def valid_file
	ARGV.first == nil ? filename = "students.csv" : filename = ARGV.first
	puts filename
	puts File.exists?(filename)
	if File.exists?(filename)
		return filename
	else
		puts "Sorry #{filename} name not recognised. Exiting program"
		exit
	end
end

def load_students
	filename = valid_file
	file = File.open(filename, "r")
	file.readlines.each do |line|
		name, cohort, hobby, country = line.chomp.split(',')
		@student_list << {:name => name, :cohort => cohort.to_sym, :hobby => hobby, :country => country}
	end
end

interactive_menu
