require 'pp'
require_relative 'curriculum'

# Require json and parse the json file
#
# Print out the number of comments next to the occurrence
#
# Expected output
#
#   Orientation
#     Name Games
#       g4 on 2013-05-08 - 0
#       g5 on 2013-06-08 - 0
#       g6 on 2013-07-08 - 0
#       g7 on 2013-08-08 - 3
#     Mind Maps
#       g4 on 2013-09-08 - 1
#       g5 on 2013-10-08 - 2
#       g6 on 2013-11-08 - 0
#       g7 on 2013-12-08 - 1
#     Sequence Diagrams
#       g4 on 2014-01-08 - 1
#       g5 on 2014-02-08 - 1
#       g6 on 2014-03-08 - 0
#       g7 on 2014-04-08 - 0
#   Rails Basics
#     Controllers
#       g4 on 2013-05-08 - 0
#       g5 on 2013-06-08 - 0
#       etc...

CURRICULUM[:units].each do |unit|
  puts unit[:name]
  unit[:lessons].each do |lesson|
    puts "  " + lesson[:name]
    lesson[:occurrences].each do |date, description|
      cohort_name = description[:cohort][:name]
      comment_count = description[:comments].count
      puts "    #{cohort_name} on #{date} - #{comment_count}"
    end
  end
end
