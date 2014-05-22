require 'faker'

3.times do 
  title = Faker::Lorem.sentence
  body = Faker::Lorem.paragraph(1, true, 3)
  Article.create(title: title, body: body)
end
