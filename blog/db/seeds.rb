# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# create the known Categories (site stuff first, then alpha)
Category.create(name: "site stuff")

Category.create(name: "feature request")
Category.create(name: "not a rant")
Category.create(name: "the expiration date")
Category.create(name: "this is cool")
Category.create(name: "tutorialish")
