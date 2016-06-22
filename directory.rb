student_count = 11

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students(students)
  students.each do |student|
      puts " #{student[:name]}
      cohort: #{student[:cohort]}
      hobby: #{student[:hobby]}
      country_of_birth: #{student[:country_of_birth]}
      height: #{student[:height]}
      weight: #{student[:weight]}"
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
