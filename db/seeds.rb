# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Article.destroy_all

def get_images
  Dir[File.join(File.dirname(__FILE__), "../app/assets/images/thumbnails/*")]
end

20.times do
  article = Article.new(
    title: Faker::Creature::Animal.name,
    subtitle: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraphs(number: 50).join("\n\n"),
    animal:  Article::ANIMALS.sample,
    theme: Article::THEMES.sample,
    status: Article::STATUS.sample,
    user: User.first
  )
  article.thumbnail.attach(io: File.open(get_images.sample), filename: 'file.jpg')
  article.save!
end

