require 'faker'

# 3.times do 
#   title = Faker::Lorem.sentence
#   body = Faker::Lorem.paragraph(50, true, 100)
#   Article.create(title: title, body: body)
# end

articles = Article.all

articles.each do |article|
  5.times do
    name = Faker::Name.name
    body = Faker::Lorem.paragraph
    comment = Comment.new(author_name: name, body: body)
    comment.article_id = article.id
    comment.save!
  end
end

