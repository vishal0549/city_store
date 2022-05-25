# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

ProductUnit.create([
                     { name: 'Gram', nice_name: 'gm' },
                     { name: 'Kilogram', nice_name: 'kg' },
                     { name: 'Milligram', nice_name: 'mg' },
                     { name: 'Milliliter', nice_name: 'ml' },
                     { name: 'Liter', nice_name: 'l' },
                     { name: 'Unit', nice_name: 'unit' },
                     { name: 'Piece', nice_name: 'pcs' }
                   ])