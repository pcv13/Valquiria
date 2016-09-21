# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


games = Game.create([
    {name: "LLamada de cthulhu",image:"http://www.elroldesiempreonline.com/imagenes/juegos/galerias/la-llamada-de-cthulhu3.jpg"},
    {name: "Savage Worlds",image:"http://www.elroldesiempreonline.com/imagenes/juegos/savage-worlds.jpg"},
    {name: "GURPS",image:"http://www.sjgames.com/wallpaper/img/GURPS4E800.jpg.gif"},
    {name: "The World of Darkness (Vampire)",image:"http://www.juegosderoles.com/wp-content/uploads/2013/09/vampiro2.jpg"},
    {name: "The World of Darkness (Mage)",image:"http://www.juegosderoles.com/wp-content/uploads/2013/09/vampiro2.jpg"},
    {name: "The World of Darkness (Warewolf)",image:"http://www.juegosderoles.com/wp-content/uploads/2013/09/vampiro2.jpg"},
    {name: "Traveller",image:"http://2.bp.blogspot.com/-r_E-KPIOJJI/VAjiNc1rcVI/AAAAAAAAAJ8/za_ZygNatjU/s1600/Marca%2BEspiral.PNG"},
   {name: "Fiasco",image:"https://rolentuidioma.files.wordpress.com/2014/11/fiasco-back-cover2.png"}])

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
