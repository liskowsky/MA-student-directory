student_count = 11

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students(students)
  #students.each do |student|
      #puts " #{student[:name]} (#{student[:cohort]} cohort)"
  #end
  records = students.length
  index = 0
  while index < records
    puts " #{students[index][:name]} (#{students[index][:cohort]} cohort)"
    index += 1
  end
end

def print_footer(students)
  print "Overall, we have #{students.count} great students."
end

def input_students
  puts "Please enter the names, and details of new students"
  puts "To finish, just press ENTER twice"
  students = [] #new empty array of students
  name = gets.chomp

  while !name.empty? do #while we got an input do the following:
    students << {name: name, cohort: :november, hobby: :hiking, country of birth: :UK, height: :180, weight: :80}
    puts "Now we have #{students.count} students" #informs how many students we currently have
    name = gets.chomp
  end
  students #returns array of students
end

students = input_students
print_header
print_students(students)
print_footer(students)
