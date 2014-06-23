require 'csv'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Company.delete_all
CSV.foreach("companies.csv", :headers => true) do |row|
  #puts row['CD компании']+row['Краткое название']
  Company.create!(:name => row['Полное название'], :description => row['Описание '])
end
