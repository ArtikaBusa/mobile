# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: 'password')
Brand.create!([{ name: 'Apple' }, { name: 'Samsung' }, { name: 'Oppo' },
               { name: 'Vivo' }, { name: 'Mi' }])
Color.create!([{ name: 'Gold' }, { name: 'Silver' }, { name: 'Black' },
               { name: 'Blue' }, { name: 'Red Rose' }])
Category.create!([{ name: 'Touch Screen' }, { name: 'Smart Phone' }])
Processor.create!([{ name: 'iOS' }, { name: 'Android' }])
Storage.create!([{ name: '16 GB' }, { name: '32 GB' }, { name: '64 GB' }])
Display.create!([{ name: '4 inche' }, { name: '4.5 inche' }, { name: '5 inche' },
                 { name: '5.5 inche' }])
