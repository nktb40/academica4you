require 'csv'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Company.delete_all
#CSV.foreach("seeds/companies.csv", :headers => true) do |row|
#  puts row['CD компании']+row['Краткое название']
#  Company.create!(:name => row['Полное название'], :description => row['Описание '])
#end

School.delete_all
CSV.foreach("seeds/dump_schools.csv", :headers => true) do |row|
  puts row.to_hash
  School.create!(row.to_hash)
end

#Course.delete_all
#CSV.foreach("seeds/dump_courses.csv", :headers => true) do |row|
#  puts row.to_hash
#  Course.create!(row.to_hash)
#end

#Language.delete_all
#CSV.foreach("seeds/dump_languages.csv", :headers => true) do |row|
#  puts row.to_hash
#  Language.create!(row.to_hash)
#end
