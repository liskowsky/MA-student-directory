$months = ['January', 'February', 'March',
          'April', 'May', 'June', 'July',
          'August', 'September', 'October',
          'November', 'December']
$line_length = 40

def input_students
  students = []
  name = 'Alan'
  default = 'July'
  until name.empty?
    puts 'Please enter the name of the student'
    name = gets.chomp.capitalize
    break if name.empty?
    puts 'Please enter your cohort (using full month)'
    cohort = gets.chomp.capitalize
    puts 'Please enter your hobbies'
    hobbies = gets.chomp.capitalize
    puts 'Please enter your country of birth'
    country = gets.chomp.capitalize
    puts 'Please enter your height'
    height = gets.chomp
    if cohort.empty? or !$months.include?(cohort)
      cohort = default
    end
    puts 'To finish, just hit return twice'
    students << {name: name, cohort: cohort, hobbies: hobbies, country: country, height: height}
    puts "Now we have #{students.count} #{students.count == 1? "student" : "students"}"
  end
    students
end
def print_header
  puts 'The students of my cohort at Makers Academy'
  puts '-------------------------------------------'
end

def print_students(students)
  students.each do |student|
    student.each do |key, value|
        puts key.to_s.rjust($line_length/2) + ":" + value.to_s.ljust($line_length/2)
    end
    puts
  end
end

def print_by_cohort(students)
    cohort_month = []
    puts "See by specific cohort month? - Enter Full Month Please"
    month = gets.chomp.capitalize
      students.map do |student|
        if student[:cohort] == month
          cohort_month << student[:name]
      end
    end
    puts "Cohort #{month}"
    puts "Students are: #{cohort_month}"
  end

def print_footer(names)
    if names.length < 1
      puts "There are no students at present"
    else
      puts "Overall, we have #{names.count} #{names.count == 1? "student" : "students"}"
    end
end

students = input_students
print_header
print_students(students)
print_footer(students)
print_by_cohort(students)
