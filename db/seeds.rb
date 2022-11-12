# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "csv"

Product.destroy_all
Category.destroy_all
AdminUser.destroy_all

product_file = Rails.root.join("db/bestbuy.csv")
csv_data = File.read(product_file)
products = CSV.parse(csv_data, headers: true, encoding: "utf-8")

category_file = Rails.root.join("db/categories.csv")
category_csv_data = File.read(category_file)
categories = CSV.parse(category_csv_data, headers: true, encoding: "utf-8")

province_file = Rails.root.join("db/taxes.csv")
province_csv_data = File.read(province_file)
provinces = CSV.parse(province_csv_data, headers: true, encoding: "utf-8")

categories.each do |p|
  category = Category.create(
    name:        p["name"],
    description: p["description"]
  )
end
products.each do |c|
  puts "#{c['image']}"
  puts "#{c['Category']}"
  category = Category.find_or_create_by(name: c["Category"])

  product = category.products.find_or_create_by(
    Name:        c["name"],
    Price:       c["price"].to_f,
    Description: c["description"],
    Stock:       rand(1..50)
  )
  query = c["image"]
  downloaded_image = URI.open(query)
  product.image.attach(io: downloaded_image, filename: "d-.jpg")
end

puts "#{Product.count} new products were added"
puts "#{Category.count} new categories were added"

if Rails.env.development?
  AdminUser.create!(email: "admin@example.com", password: "password",
                    password_confirmation: "password")
end
