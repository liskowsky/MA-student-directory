student_count = 11

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students(students)
  students.each.with_index(1) do |student, index|
    full_name = student[:name].to_s
    if full_name[0] == "A"
      puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

def print_footer(students)
  print "Overall, we have #{students.count} great students."
end

def input_students
  puts "Please enter the names of new students"
  puts "To finish, just press ENTER twice"
  students = [] #new empty array of students
  name = gets.chomp

  while !name.empty? do #while we got an input do the following:
    students << {name: name, cohort: :november} #adds a new hash with an input name
    puts "Now we have #{students.count} students" #informs how many students we currently have
    name = gets.chomp
  end
  students #returns array of students
end

students = input_students
print_header
print_students(students)
print_footer(students)
