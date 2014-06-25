def get_students
	puts "Hello! Let's make a directory of students"
	puts "Please enter the student name. Press enter twice to exit"
	name = gets.strip
	students =[]
	while !name.empty?
		puts "Which cohort is #{name} in?"
		cohort = gets.strip.downcase
		cohort = check_cohort cohort
		puts "What is #{name}'s hobby?"
		hobby = gets.strip
		puts "What is #{name}'s country of birth?"
		country = gets.strip
		students << {:name => name, :cohort =>  cohort,:hobby => hobby, :country => country}
		if students.length <= 1
			puts "There is now #{students.length} student in our directory. Add another student or Enter twice to exit"
		else
			puts "There are now #{students.length} students in our directory. Add another student or Enter twice to exit"
		end
		name = gets.strip
	end
	return students
end

def check_cohort cohort_input
	months = ['january', 'february', 'march', 'april', 'may', 'june', 'july', 'august', 'september', 'october', 'november', 'december']
	while !months.include?(cohort_input)
		puts 'That doesn\'t look like a month, please enter a month'
		cohort_input = gets.strip
	end
	cohort_input.to_sym
end

def print_students student_list
	# student_list.sort_by! {|student| student[:cohort]}

	months = ['january', 'february', 'march', 'april', 'may', 'june', 'july', 'august', 'september', 'october', 'november', 'december']
	months.each do |month|
		student_list.each_with_index do |student,index|
			puts "#{student[:name]} in the #{student[:cohort].capitalize} cohort comes from #{student[:country]} and enjoys #{student[:hobby]}" if student[:cohort]==month.to_sym
		end
	 end
end

def print_header
	puts "The students at Maker's Academy are:"
end

def print_footer student_list
	if student_list.length <= 1
		puts "There is #{student_list.length} lovely student in our cohort!"	
	else
		puts "There are #{student_list.length} lovely students in our cohort!"	
	end
end

student_list = get_students
print_header
puts ""
print_students student_list
puts ""
print_footer student_list
