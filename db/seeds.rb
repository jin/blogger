require 'faker'

3.times do 
  title = Faker::Lorem.sentence
  body = Faker::Lorem.paragraph(50, true, 100)
  Article.create(title: title, body: body)
end
