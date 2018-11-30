# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Deleting all Users'

User.delete_all

puts 'Delete users'
User.destroy_all

puts 'Creating 5 Users'

new_users = [
  { first_name: 'Hélène',
    last_name: 'Lioussou',
    address: '16 villa Gaudelet 75011 Paris',
    email: 'helene.lioussou@gmail.com',
    password: 'admin$rocket',
    admin: true },
  { first_name: 'Maud',
    last_name: 'Gilet',
    address: '16 rue du Sentier 75002 Paris',
    email: 'maud.gilet@gmail.com',
    password: 'admin$rocket',
    admin: true },
  { first_name: 'Jérôme',
    last_name: 'Léger',
    address: '42 rue des Vinaigriers 75010 Paris',
    email: 'jejelele12@gmail.com',
    password: 'admin$rocket',
    admin: true },
  { first_name: 'Mathieu',
    last_name: 'Ribot',
    address: '96 rue des Moines 75017 Paris',
    email: 'mribot@hotmail.fr',
    password: 'admin$rocket',
    admin: true }
]

new_users.each do |user|
  User.create!(
    first_name: user[:first_name],
    last_name: user[:last_name],
    address: user[:address],
    email: user[:email],
    password: user[:password],
    admin: user[:admin]
  )
end

puts 'Seeding of Users .... Finished ..............!'

puts 'Deleting all Comics'

Comic.delete_all

puts 'Creating 15 Comics ...............'

new_comics = [
  { title: 'Tintin - On a marché sur la lune',
    author: 'Hergé',
    isbn: '2203006498',
    artwork: 'http://books.google.com/books/content?id=SkPAIAAACAAJ&printsec=frontcover&img=1&zoom=5',
    category: '' },
  { title: 'Tintin - Objectif Lune',
    author: 'Hergé',
    isbn: '220300648X',
    artwork: 'http://books.google.com/books/content?id=fqP9HwAACAAJ&printsec=frontcover&img=1&zoom=5',
    category: '' },
  { title: 'Tintin - Tintin au Tibet',
    author: 'Hergé',
    isbn: '9782203001190',
    artwork: 'http://books.google.com/books/content?id=a64_DwAAQBAJ&printsec=frontcover&img=1&zoom=5',
    category: '' },
  { title: 'Tintin - Vol 747 pour Sidney',
    author: 'Hergé',
    isbn: '2203001216',
    artwork: 'http://books.google.com/books/content?id=ca4_DwAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl',
    category: '' },
  { title: 'Tintin - Le Lotus Bleu',
    author: 'Hergé',
    isbn: '',
    artwork: 'http://books.google.com/books/content?id=J1QrAQAAIAAJ&printsec=frontcover&img=1&zoom=1',
    category: '' },
  { title: 'Les Tuniques Bleues - Tome 62 - Sallie',
    author: 'Cauvin et Lambil',
    isbn: '9791034738571',
    artwork: 'http://books.google.com/books/content?id=Flp0DwAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl',
    category: '' },
  { title: "Boule & Bill - Tome 3 - Les Copains d'Abord",
    author: 'Bastide et Roba',
    isbn: '2800189207',
    artwork: 'http://books.google.com/books/content?id=XFulDgAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl',
    category: '' },
  { title: 'Boule & Bill - Tome 14 - Une vie de chien',
    author: 'Bastide et Roba',
    isbn: '2800189312',
    artwork: 'http://books.google.com/books/content?id=inz9AwAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl',
    category: '' },
  { title: 'Boule & Bill - Tome 10 - Bill, chien modèle',
    author: 'Bastide et Roba',
    isbn: '280018924X',
    artwork: 'http://books.google.com/books/content?id=SEILDgAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl',
    category: '' },
  { title: 'Kid Paddle - Tome 1 - Jeux de vilains',
    author: 'Midam',
    isbn: '280013187X',
    artwork: 'https://i.pinimg.com/originals/54/06/4f/54064f0f4005ff3a5952f2a54e37ff2b.png',
    category: '' },
  { title: 'Blake & Mortimer - Tome 24 - Le Testament de William S.',
    author: 'Sente & Juillard',
    isbn: '2505054606',
    artwork: 'http://books.google.com/books/content?id=ppinDAAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl',
    category: '' },
  { title: 'Thorgal - Tome 34 : Kah-Aniel',
    author: 'Sente &  Rosinski',
    isbn: '2803642468',
    artwork: 'http://books.google.com/books/content?id=YWrPAQAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl',
    category: '' },
  { title: 'Blake & Mortimer - Tome 21 : Le serment des cinq lords',
    author: 'Sente & Juillard',
    isbn: '2505023255',
    artwork: 'http://books.google.com/books/content?id=sdxj31_YPTAC&printsec=frontcover&img=1&zoom=5&edge=curl',
    category: '' },
  { title: 'Le Donjon de Naheulbeuk - Tome 23',
    author: 'Lang & Poinsot',
    isbn: '2353258069',
    artwork: 'https://i.pinimg.com/originals/54/06/4f/54064f0f4005ff3a5952f2a54e37ff2b.png',
    category: '' },
  { title: 'Ces jours qui disparaissent',
    author: 'Le Boucher',
    isbn: '2331031487',
    artwork: 'http://books.google.com/books/content?id=TCYpDwAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl',
    category: '' }
]

new_comics.each do |comic|
  Comic.create(
    title: comic[:title],
    author: comic[:author],
    isbn: comic[:isbn],
    artwork: comic[:artwork],
    category: comic[:category]
  )
end

puts 'Seeding of Comics .... Finished ..............!'

# puts 'Deleting all Albums'

# Album.delete_all

# puts 'Creating 15 Albums ...............'

# new_albums = [
#   { user_id: 1,
#     comic_id: 1,
#     description: 'Description album 1',
#     available: true },
#   { user_id: 2,
#     comic_id: 1,
#     description: 'Description album 2',
#     available: false },
#   { user_id: 5,
#     comic_id: 2,
#     description: 'Description album 3',
#     available: false },
#   { user_id: 4,
#     comic_id: 14,
#     description: 'Description album 4',
#     available: true },
#   { user_id: 4,
#     comic_id: 15,
#     description: 'Description album 5',
#     available: true },
#   { user_id: 3,
#     comic_id: 9,
#     description: 'Description album 6',
#     available: true },
#   { user_id: 3,
#     comic_id: 10,
#     description: 'Description album 7',
#     available: true },
#   { user_id: 2,
#     comic_id: 7,
#     description: 'Description album 8',
#     available: false },
#   { user_id: 2,
#     comic_id: 8,
#     description: 'Description album 9',
#     available: true },
#   { user_id: 1,
#     comic_id: 3,
#     description: 'Description album 10',
#     available: false },
#   { user_id: 1,
#     comic_id: 4,
#     description: 'Description album 11',
#     available: true },
#   { user_id: 2,
#     comic_id: 11,
#     description: 'Description album 12',
#     available: true },
#   { user_id: 2,
#     comic_id: 12,
#     description: 'Description album 13',
#     available: true },
#   { user_id: 5,
#     comic_id: 12,
#     description: 'Description album 14',
#     available: true },
#   { user_id: 5,
#     comic_id: 13,
#     description: 'Description album 15',
#     available: true }
# ]

# new_albums.each do |album|
#   Album.create(
#     user_id: album[:user_id],
#     comic_id: album[:comic_id],
#     description: album[:description],
#     available: album[:available]
#   )
# end

# puts 'Seeding of Albums .... Finished ..............!'

# puts 'Deleting all Rentals'

# Rental.delete_all

# puts 'Creating 5 Rentals ...............'

# new_rentals = [
#   { album_id: 3,
#     lender_id: 5,
#     borrower_id: 1,
#     status: 'Progress' },
#   { album_id: 1,
#     lender_id: 1,
#     borrower_id: 3,
#     status: 'Finished' },
#   { album_id: 2,
#     lender_id: 2,
#     borrower_id: 5,
#     status: 'Progress' },
#   { album_id: 8,
#     lender_id: 2,
#     borrower_id: 4,
#     status: 'Progress' },
#   { album_id: 10,
#     lender_id: 1,
#     borrower_id: 2,
#     status: 'Progress' }
# ]

# new_rentals.each do |rental|
#   Rental.create(
#     album_id: rental[:album_id],
#     borrower_id: rental[:borrower_id],
#     rented: false
#   )
# end

# puts 'Seeding of Rentals .... Finished ..............!'

# puts 'Seeding is ...'
# puts 'OVER ....'
# puts 'Cheers world!'
