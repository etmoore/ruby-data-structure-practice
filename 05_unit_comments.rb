require 'pp'
require_relative 'curriculum'

# Require the Ruby file
#
# Print out the unit names with the comment counts
#
# Expected output
#
#   Orientation - 9
#   Rails Basics - 15
#   CRUD - 12

CURRICULUM[:units].each do |unit|
  unit_name = unit[:name]
  comments_count = 0
  unit[:lessons].each do |lesson|
    lesson[:occurrences].each do |date, data|
      comments_count += data[:comments].count
    end
  end
  puts "#{unit_name} - #{comments_count}"
end
