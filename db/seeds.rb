# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Article.destroy_all
Tag.destroy_all
Card.destroy_all

Tag::NAMES.each do |name|
  Tag.create(name: name)
end


def get_images
  Dir[File.join(File.dirname(__FILE__), "../app/assets/images/thumbnails/*")]
end

counter = 0

puts "------------------"

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

  card = Card.new(
    animal: Card::ANIMALS.sample,
    specificities: {
      fci: ["groupe_1", "groupe_2", "groupe_3", "groupe_4", "groupe_5"].sample,
      type_de_poil: ["ras", "courts", "longs", "bouclés"].sample,
      mode_de_vie: ["patachon", "frimeur", "aventurier", "gigolo"].sample
    },
    origin: Faker::Address.country,
    title: Faker::Creature::Animal.name,
    body: Faker::Lorem.paragraphs(number: 50).join(''),
    life_expectancy: %w(0..50).sample,
    fur: ["blonde", "brune", "caramel", "rousse", "blanche", "noire"].sample,
    min_height: %w(0..50).sample,
    max_height: %w(50..100).sample,
    min_weight: %w(0..50).sample,
    max_weight: %w(50..100).sample,
    status: Card::STATUS.sample,
  )
  card.thumbnail.attach(io: File.open(get_images.sample), filename: 'file.jpg')
  card.save!

  puts "----- #{counter} done -----"
  counter > 9 ? puts "------------------" : puts "-------------------"

end

Article.all.each do |article|
  rand(2..5).times do
    ArticleTag.create(article: article, tag: Tag.all.sample)
  end
end

