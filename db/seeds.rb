puts "Destroy Tags"
ActsAsTaggableOn::Tag.destroy_all
puts "Destroy Articles"
Article.destroy_all
puts "Destroy Cards"
Card.destroy_all
puts "Destroy Users"
User.destroy_all
puts "Destroy Species"
Specie.destroy_all
puts "Destroy Animals"
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

PARAGRAPH = "
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Debitis voluptate, magni eveniet,
laborum omnis numquam rerum nisi consequuntur, sint officia iusto aperiam
tempore natus odio impedit ducimus ullam sed architecto nesciunt deserunt! Deserunt
temporibus commodi cum sequi suscipit ex, dolorum cumque blanditiis,
doloremque iure quam placeat! Eaque ea alias ipsum blanditiis dicta repudiandae, dolores
accusantium inventore aliquam officia odio voluptate animi soluta obcaecati quibusdam sit
nihil enim veritatis officiis modi, possimus ut nulla. Cum voluptate vitae adipisci optio
aperiam inventore ducimus dolor excepturi, pariatur tenetur laboriosam, hic nobis laudantium!
Enim beatae obcaecati hic numquam quisquam. Necessitatibus sapiente harum doloremque, soluta.
"

puts "Creating Animals"
ANIMALS.each do |animal|
  Animal.create(name: animal)
  puts "-> #{animal}"
end

# ===================================
# ===================================

def get_images(animal)
  Dir[File.join(File.dirname(__FILE__), "../app/assets/images/thumbnails/#{animal}/*")]
end

puts "Creating Users"
writer = User.new(email: 'writer@petch.com', password: 'mdpmdp', permission: 'writer', first_name: 'User', last_name: 'Writer', signature: 'Hello i am writer', profession: 'Dev')
writer.avatar.attach(io: File.open(get_images('avatars').sample), filename: 'file.jpg')
writer.save!

admin = User.new(email: 'admin@petch.com', password: 'mdpmdp', permission: 'admin', first_name: 'User', last_name: 'Admin', signature: 'Hello i am admin', profession: 'Dev')
admin.avatar.attach(io: File.open(get_images('avatars').sample), filename: 'file.jpg')
admin.save!

puts "Creating 30 Articles & Cards..."
30.times do |i|
  puts "Creating Article - #{i+1}"
  animal = Animal.all.sample
  article = Article.new(
    title: "Conseil (#{animal.name})",
    subtitle: "This is the article subtitle about #{animal.name}",
    body: Array.new(5, PARAGRAPH).join('<br><br>'),
    animal: animal,
    theme: Article::THEMES.sample,
    status: Article::STATUS.sample,
    tag_list: TAGS.sample(rand(2..5)),
    user: User.all.sample
  )
  article.thumbnail.attach(io: File.open(get_images(animal.name).sample), filename: 'file.jpg')
  article.save!
end

15.times do |i|
  puts "Creating Article - #{i+1}"
  animal = Animal.all.sample
  card = Card.new(
    animal: animal,
    specie: Specie.create(name: SPECIES[animal.name.to_sym].sample, animal: animal),
    body: Array.new(5, PARAGRAPH).join('<br><br>'),
    life_expectancy: rand(20..30),
    min_height: rand(20..30),
    max_height: rand(30..40),
    min_weight: rand(10..15),
    max_weight: rand(15..20),
    origin: COUNTRIES.sample,
    status: Card::STATUS.sample,
    specificities: Animal::SPECS[animal.name.to_sym].map { |k, v| [k, v.sample] }.to_h,
    ratings: Animal::RATINGS[animal.name.to_sym].map { |item| [item, rand(1..5)] }.to_h,
    user: User.all.sample
  )
  card.thumbnail.attach(io: File.open(get_images(animal.name).sample), filename: 'file.jpg')
  card.save!
end

puts "All Done !"

