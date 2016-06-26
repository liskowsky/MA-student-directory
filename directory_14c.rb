$months = ['January', 'February', 'March',
          'April', 'May', 'June', 'July',
          'August', 'September', 'October',
          'November', 'December']
$line_length = 40
@students = []

##MENU

def interactive_manu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "What you want to do."
  puts "1. Add students"
  puts "2. Show all students"
  puts "3. Show students of specific cohort"
  puts "4. Save the list to students.csv"
  puts "5. Load the list from students.csv"
  puts "9. Exit"
end

def process(selection)
  case selection
  when "1" then students = input_students
  when "2" then print_all
  when "3" then print_by_cohort(@students)
  when "4" then save_students
  when "5" then load_students
  when "9" then exit
  else
    puts "Wrong input. Try again."
  end
end

##ADDING STUDENTS

def input_students
  loop do
    cohort = ""
    name    = get_detail("student name")
    until $months.include?(cohort)
      cohort  = get_detail("cohort (using full month)","July")
    end
    hobbies = get_detail("hobbies")
    country = get_detail("country of birth")
    height  = get_detail("height")

    add_student(@students, name, cohort, hobbies, country, height)
    puts "Now we have #{@students.count} #{@students.count == 1? "student" : "students"}"

    puts "Hit ENTER, or type 'X' to finish"
    break if gets.chomp.capitalize == "X"
  end
    @students
end

def add_student(array, name, cohort, hobbies, country, height)
  array << {name: name, cohort: cohort.to_sym, hobbies: hobbies, country: country, height: height}
end

##GETTING STUDENT DETAILS

def get_detail(detail_name, value = "N/A")
  puts "Please enter #{detail_name}: "
  input = STDIN.gets.chomp.capitalize
  if !input.empty?
    return value = input
  else
    return value
  end
end

##PRINTING STUDENTS

def print_all
  print_header
  print_students(@students)
  print_footer(@students)
end

def print_header
  puts 'The students of my cohort at Makers Academy'
  puts '-------------------------------------------'
end

def print_students(students)
  if !@students.empty?
    @students.each do |student|
      student.each do |key, value|
          puts key.to_s.rjust($line_length/2) + ":" + value.to_s.ljust($line_length/2)
      end
      puts
    end
  else
    puts "NOTHIG TO PRINT"
  end
  puts
end

def print_footer(names)
    if names.length < 1
      puts "There are no students at present"
    else
      puts "Overall, we have #{names.count} #{names.count == 1? "student" : "students"}"
    end
end

##PRINTING STUDENTS BY COHORT

def print_by_cohort(students)
    cohort_month = []
    puts "See by specific cohort month? - Enter Full Month Please"
    month = STDIN.gets.chomp.capitalize
      @students.map do |student|
        if student[:cohort] == month
          cohort_month << student
      end
    end
    print_students(cohort_month)
end

##SAVING STUDENTS

def save_students
  file = File.open("students.csv","w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort], student[:hobbies], student[:country], student[:height]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

##LOADING STUDENTS

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort, hobbies, country, height = line.chomp.split(",")
    add_student(@students, name, cohort, hobbies, country, height)
  end
  file.close
end

def try_load_students
  filename = ARGV.first
  return if filename.nil?
  if File.exist?(filename)
    load_students
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

##EXECUTE

try_load_students
interactive_manu
