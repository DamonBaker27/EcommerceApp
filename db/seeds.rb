# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "csv"

Product.destroy_all
AdminUser.destroy_all

product_file = Rails.root.join("db/bestbuy.csv")
csv_data = File.read(product_file)
products = CSV.parse(csv_data, headers: true, encoding: "utf-8")

products.each do |c|
  # puts "#{c['image']}"

  product = Product.create(
    Category:    c["Category"],
    Name:        c["name"],
    Price:       c["price"].to_i,
    Description: c["description"],
    Stock:       rand(1..50)
  )
  query = c["image"]
  downloaded_image = URI.open(query)
  product.image.attach(io: downloaded_image, filename: "d-.jpg")
end

puts "#{Product.count} new products were added"
if Rails.env.development?
  AdminUser.create!(email: "admin@example.com", password: "password",
                    password_confirmation: "password")
end
