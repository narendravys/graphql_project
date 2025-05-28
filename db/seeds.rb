require 'faker'

# Clear existing data
Book.destroy_all
Author.destroy_all

# Create 10 authors
authors = 10.times.map do
  Author.create!(
    name: Faker::Book.author
  )
end

# Create 30 books assigned randomly to authors
30.times do
  Book.create!(
    title: Faker::Book.title,
    description: Faker::Lorem.paragraph(sentence_count: 2),
    author: authors.sample
  )
end

puts "Seeded #{Author.count} authors and #{Book.count} books."
