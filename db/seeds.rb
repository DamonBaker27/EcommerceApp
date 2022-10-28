# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "csv"

Product.delete_all

product_file = Rails.root.join("db/bestbuy.csv")
csv_data = File.read(product_file)
products = CSV.parse(csv_data, headers: true, encoding: "utf-8")

products.each do |c|
  puts "#{c['Category']}"
  # puts "#{c.inspect}"

  product = Product.create(
    Category:    c["Category"],
    Name:        c["name"],
    Price:       c["price"].to_i,
    Description: c["description"],
    image:       c["image"],
    Stock:       rand(1..50)
  )

  # puts "#{product.Category}"
end

puts "#{Product.count} new products were added"
