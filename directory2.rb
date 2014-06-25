def get_students
	puts "Hello! Let's make a directory of students"
	puts "Please enter the student name. Press enter twice to exit"
	name = gets.chomp
	students =[]
	while !name.empty?
		puts "Which cohort is #{name} in?"
		cohort = gets.chomp.downcase
		cohort = check_cohort cohort
		puts "What is #{name}'s hobby?"
		hobby = gets.chomp
		puts "What is #{name}'s country of birth?"
		country = gets.chomp
		students << {:name => name, :cohort =>  cohort,:hobby => hobby, :country => country}
		puts "There are now #{students.length} students in our directory. Add another student or Enter twice to exit"
		name = gets.chomp
	end
	return students
end

def check_cohort cohort_input
	months = ['january', 'february', 'march', 'april', 'may', 'june', 'july', 'august', 'september', 'october', 'november', 'december']
	while !months.include?(cohort_input)
		puts 'That doesn\'t look like a month, please enter a month'
		cohort_input = gets.chomp
	end
	cohort_input.to_sym
end

def print_students student_list
	student_list.each_with_index do |student,index|
		puts "#{index+1}. #{student[:name]} in the #{student[:cohort].capitalize} cohort comes from #{student[:country]} and enjoys #{student[:hobby]}"
	end

end

def print_header
	puts "The students at Maker's Academy are:"
end

def print_footer student_list
	puts "There are #{student_list.length} lovely students in our cohort!"	
end


student_list = get_students
print_header
puts ""
print_students student_list
puts ""
print_footer student_list
