require 'pp'
require 'json'
# require_relative 'curriculum'

# Require json and parse the json file
#
# Print out the lesson names with the total number of comments
#
# Expected output
#
#   Orientation
#     Name Games - 3
#     Mind Maps - 4
#     Sequence Diagrams - 2
#   Rails Basics
#     Controllers - 5
#     Models - 0
#     Views - 8
#     Migrations - 2
#   CRUD
#     Create - 3
#     Read - 1
#     Update - 6
#     Delete - 2


file = File.read('curriculum.json')
curriculum = JSON.parse(file, symbolize_names: true)

curriculum[:units].each do |unit|
  puts unit[:name]
  unit[:lessons].each do |lesson|
    lesson_name = lesson[:name]
    comment_count = 0
    lesson[:occurrences].each do |date, occurrence|
      comment_count += occurrence[:comments].length
    end
    puts "  #{lesson_name} - #{comment_count}"
  end
end
