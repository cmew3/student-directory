

students_fixed =[
	{:name => "Dave", :cohort=> :june},
	{:name => "Eddie", :cohort =>:june},
	{:name => "Catharina", :cohort =>:june},
	{:name => "Igor", :cohort => :june},
	{:name => "Marco", :cohort => :june},
	{:name => "Lisa", :cohort=> :june},
	{:name => "Michiel", :cohort =>:june},
	{:name => "Jean", :cohort =>:june},
	{:name => "Nicola", :cohort => :june},
	{:name => "Jennie", :cohort => :june},
	{:name => "Iona", :cohort=> :june},
	{:name => "Nikesh", :cohort =>:june},
	{:name => "Chloe", :cohort =>:june},
	{:name => "Toan", :cohort => :june},
	{:name => "Jamie", :cohort => :june},
	{:name => "Peter", :cohort=> :june},
	{:name => "Talal", :cohort =>:june},
	{:name => "Charlie", :cohort =>:june},
	{:name => "Charlotte", :cohort => :june},
	{:name => "Thomas", :cohort => :june},
	{:name => "Zoe", :cohort=> :june},
	{:name => "Hannah", :cohort =>:june},
	{:name => "Joe", :cohort =>:june},
	{:name => "Alex", :cohort => :june},
	{:name => "Jeremy", :cohort => :june}
]

def input_students
	puts "Please enter the student name"
	puts "To finish, just hit return twice"
	students = []
	name = gets.chomp
	while !name.empty? do
		puts "What is #{name}'s favourite hobby?"
		hobby = gets.chomp
		puts "What is #{name}'s country of birth?"
		country = gets.chomp
		students << {:name => name, :cohort => :june, :hobby => hobby, :country => country}
		puts "Please enter the next student's name (or press enter twice to finish)"
		name = gets.chomp
	end
	students
end

def print_header
	puts "The students of my cohort at Makers Academy"
	puts '-------------------'
end

def print(students)
	students.each_with_index do |student, number|
		puts student
		puts "#{number+1}. #{student[:name]} (#{student[:cohort].capitalize} cohort). Hobby: #{student[:hobby]}. Country: #{student[:country]} " 
	end
end

def print_footer(names)
	puts "Overall, we have #{names.length} great students"
end

students = input_students
print_header
print(students)
print_footer(students)





