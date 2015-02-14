require 'faker'

sample_tags = %w(personal business fun fashion sport news entertainment movie food music)

tags = []

sample_tags.each {|tag| tags << Tag.create(name: tag)}

20.times do
  entry = Entry.create(author: Faker::Name.name, title: Faker::Company.bs, body: Faker::Company.catch_phrase)
  3.times do
    entry.tags << tags.sample(3)
  end
end

