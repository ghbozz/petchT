# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Article.destroy_all
Tag.destroy_all
Fiche.destroy_all

Tag::NAMES.each do |name|
  Tag.create(name: name)
end


def get_images
  Dir[File.join(File.dirname(__FILE__), "../app/assets/images/thumbnails/*")]
end

counter = 0

20.times do
  counter += 1
  article = Article.new(
    title: Faker::Creature::Animal.name,
    subtitle: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraphs(number: 50).join(''),
    animal:  Article::ANIMALS.sample,
    theme: Article::THEMES.sample,
    status: Article::STATUS.sample,
    user: User.first
  )
  article.thumbnail.attach(io: File.open(get_images.sample), filename: 'file.jpg')
  article.save!

  fiche = Fiche.new(
    title: Faker::Creature::Animal.name,
    description: Faker::Lorem.paragraphs(number: 50).join(''),
    animal:  Fiche::ANIMALS.sample,
    status: Fiche::STATUS.sample,
    user: User.first,
    race: Faker::Creature::Animal.name,
    origin: Faker::Address.country
  )
  fiche.thumbnail.attach(io: File.open(get_images.sample), filename: 'file.jpg')
  fiche.save!
  
  p "----- #{counter}(s) done -----"
  p "--------------------"

end

Article.all.each do |article|
  rand(2..5).times do
    ArticleTag.create(article: article, tag: Tag.all.sample)
  end
end

