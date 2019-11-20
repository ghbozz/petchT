require 'faker'

ActsAsTaggableOn::Tag.destroy_all
Article.destroy_all
Card.destroy_all
User.destroy_all
Specie.destroy_all
Animal.destroy_all


ANIMALS = [
  'chien',
  'chat',
  'rongeur'
]

SPECIES = {
  chien: [
    'Affenpinscher',
    'Airedale Terrier',
    'Akita Américain',
    'Akita Inu',
    'American Staffordshire Terrier',
    'Ancien chien d\'arrêt danois',
    'Anglo-Français de Petite Vènerie',
    'Ariégeois'
  ],
  chat: [
    'Abyssin',
    'American Bobtail',
    'American Curl',
    'American Shortair',
    'American Wirehair',
    'Angora Turc',
    'Balinais',
    'Bengal',
    'Bleu Russe'
  ],
  rongeur: [
    'Chinchilla',
    'Cochon d’Inde',
    'Furet',
    'Gerbille',
    'Hamster',
    'Lapin',
    'Octodon',
    'Rat',
    'Souris'
  ]
}

ANIMALS.each do |animal|
  Animal.create(name: animal)
  puts "create #{animal}"
end

Animal.all.each do |animal|
  SPECIES[animal.name.to_sym].each do |specie|
    Specie.create(name: specie, animal: animal)
    puts "create #{specie} => #{animal.name}"
  end
end

# Card.create!(specie: Specie.first, title: 'Chien fou', body: 'Hello Chien Fou')

# ===================================
# ===================================

def get_images
  Dir[File.join(File.dirname(__FILE__), "../app/assets/images/thumbnails/*")]
end

writer = User.new(email: 'writer@petch.com', password: 'mdpmdp', permission: 'writer', first_name: 'John', last_name: 'Doe', signature: 'Hello i am writer', profession: 'Dev')
writer.avatar.attach(io: File.open(get_images.sample), filename: 'file.jpg')
writer.save!

admin = User.new(email: 'admin@petch.com', password: 'mdpmdp', permission: 'admin', first_name: 'John', last_name: 'Doe', signature: 'Hello i am admin', profession: 'Dev')
admin.avatar.attach(io: File.open(get_images.sample), filename: 'file.jpg')
admin.save!

counter = 0
puts "------------------"

20.times do
  counter += 1
  article = Article.new(
    title: Faker::Creature::Animal.name,
    subtitle: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraphs(number: 50).join(''),
    animal:  Animal.all.sample,
    theme: Article::THEMES.sample,
    status: Article::STATUS.sample,
    user: User.all.sample
  )
  article.thumbnail.attach(io: File.open(get_images.sample), filename: 'file.jpg')
  article.save!

  card = Card.new(
    specificities: {
      fci: ["groupe_1", "groupe_2", "groupe_3", "groupe_4", "groupe_5"].sample,
      type_de_poil: ["ras", "courts", "longs", "bouclés"].sample,
      mode_de_vie: ["patachon", "frimeur", "aventurier", "gigolo"].sample
    },
    origin: Faker::Address.country,
    body: Faker::Lorem.paragraphs(number: 50).join(''),
    life_expectancy: %w(0..50).sample,
    min_height: %w(0..50).sample,
    max_height: %w(50..100).sample,
    min_weight: %w(0..50).sample,
    max_weight: %w(50..100).sample,
    status: Card::STATUS.sample,
    specie: Specie.all.sample,
    user: User.all.sample
  )
  card.animal = card.specie.animal
  card.thumbnail.attach(io: File.open(get_images.sample), filename: 'file.jpg')
  card.save!

  puts "----- #{counter} done -----"
  # counter > 9 ? puts "------------------" : puts "-------------------"

end

