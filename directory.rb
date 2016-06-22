student_count = 11

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students(students)
  line_length = 40
  students.each do |student|
    puts "#{student[:name].to_s.center(line_length)}"
    student.each do |key, value|
      if key != :name
        puts key.to_s.rjust(line_length/2) + ":" + value.to_s.ljust(line_length/2)
      end
    end
    puts
  end
end

def print_footer(students)
  print "Overall, we have #{students.count} great students."
end

def input_students
  puts "Please enter the names, and details of new students"
  puts "To finish, just press ENTER twice"
  students = []
  name = gets.chomp

  while !name.empty? do
    students << {name: name, cohort: :november, hobby: :hiking, country_of_birth: :UK, height: 180, weight: 80}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
  students
end

students = input_students
print_header
print_students(students)
print_footer(students)
