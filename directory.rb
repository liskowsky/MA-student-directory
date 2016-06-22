student_count = 11

students = ["Dr. Hannibal Lecter",
            "Darth Vader",
            "Nurse Ratched",
            "Michael Corleone",
            "Alex DeLarge",
            "The Wicked Witch of the West",
            "Terminator",
            "Freddy Krueger",
            "The Joker",
            "Joffrey Baratheon",
            "Norman Bates"]

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students(names)
  names.each do |name|
    puts name
  end
end

def print_footer(names)
  print "Overall, we have #{names.count} great students."
end

print_header
print_students(students)
print_footer(students)
