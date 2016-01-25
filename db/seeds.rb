# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

fin = User.create({email: "miriam@makeba.dance", password: "patapata"})
note1 = Note.create({text: "test1", user_id: fin.id, lat: 37.408166, lng: -122.099880})
note2 = Note.create({text: "test2", user_id: fin.id, lat: 37.308836, lng: -122.000216})
