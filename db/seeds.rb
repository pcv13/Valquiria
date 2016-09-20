# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


games = Game.create([{name: "LLamada de cthulhu",image:"#"},{name: "Dragones y Mazmorras",image:"#"}])

player = Player.create([{name: "Rocio", email: "Rocio@mail.com",password: "12345678" },
    {name: "Pablo", email: "Pablo@mail.com",password: "12345678" },
    {name: "Carlos", email: "Carlos@mail.com",password: "12345678" }])



puts "seeds created"


p1 = Player.first

p2 = Player.second

p3 = Player.last

m1 = Match.first

m2 = Match.second

p1.matches.push(Match.first)
p2.matches.push(Match.first)
p3.matches.push(Match.first)

p1.matches.push(Match.second)
p2.matches.push(Match.second)
p3.matches.push(Match.second)
