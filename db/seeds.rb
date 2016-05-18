# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Machine.create! ([
  { :name => "Granulator 1" }, { :name => "Granulator 2"}, { :name => "Granulator 3"}, { :name => "Color 1"},
  { :name => "Color 3"}, { :name => "Wet 1"}, { :name => "Wet 2"}, { :name => "Wet 3"}, { :name => "Extruder"}
  ])

Location.create! ([
  { :name => "S1" }, { :name => "S2" }, { :name => "S3" }, { :name => "S4" }, { :name => "S5" },
  { :name => "H1" }, { :name => "H2" }, { :name => "H3" }, { :name => "H4" }, { :name => "H5" },
  { :name => "R1" }, { :name => "R2" }, { :name => "R3" }, { :name => "R4" }, { :name => "R5" },
  { :name => "X1" }, { :name => "X2" }, { :name => "X3" }, { :name => "X4" }, { :name => "X5" }
  ])

Material.create! ([
  { :name => "PP" }, { :name => "PE" }, { :name => "HIPS" }, { :name => "Fines" }, { :name => "Trash" }
  ])
