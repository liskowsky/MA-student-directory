$line_length = 40
$cohort_symbols = [:november, :february, :may, :august]

def print_header
  puts "The students of Villains Academy".center($line_length)
  puts "-------------".center($line_length)
end

def print_students(students)
  students.each do |student|
    puts "#{student[:name].to_s.center($line_length)}"
    student.each do |key, value|
      if key != :name
        puts key.to_s.rjust($line_length/2) + ":" + value.to_s.ljust($line_length/2)
      end
    end
  end
  puts
end

def print_footer(students)
  print "Overall, we have #{students.count} great students."
end

def input_students

  students = []
  index = 0

  puts "Please enter the name of new student"
  puts "To finish, just press ENTER twice"
  name = gets.chomp
  puts "Cohort (full month format): "
  cohort_in = gets.chomp.downcase.to_sym

  while !name.empty? || !cohort_in.empty?
    if !name.empty?
      students.push ({name: name})
    else
      students.push ({name: "NO NAME"})
    end

    match = false
    while match == false
      if $cohort_symbols.include?(cohort_in) #checking if month given by user is a valid cohort month
        students[index] = students[index].merge(cohort: cohort_in)
        match = true
      elsif cohort_in.empty?
        students[index] = students[index].merge(cohort: :november)
        match = true
      else
        puts "There is no such cohort. Try again: "
        cohort_in = gets.chomp.downcase.to_sym
      end
    end

    students[index] = students[index].merge(hobby: :hiking, country_of_birth: :UK, height: 180, weight: 80)
    puts "Now we have #{students.count} students"
    index += 1

    puts "Name: "
    name = gets.chomp
    puts "Cohort: "
    cohort_in = gets.chomp.downcase.to_sym

  end
  students
end


students = input_students
print_header
print_students(students)
print_footer(students)
