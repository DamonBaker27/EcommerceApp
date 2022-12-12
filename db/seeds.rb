# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "csv"

# Orderable.destroy_all
puts "deleted all Orderable"
# OrderItem.destroy_all
puts "deleted all OrderItem"
# UserOrder.destroy_all
puts "deleted all UserOrder"
# Order.destroy_all
puts "deleted all Order"
Product.destroy_all
puts "deleted all Product"
Category.destroy_all
puts "deleted all Category"
# AdminUser.destroy_all
puts "deleted all AdminUser"
# Tax.destroy_all
puts "deleted all Tax"
# User.delete_all
puts "deleted all Users"
# Province.destroy_all
puts "deleted all Province"

puts "deleted all data"
product_file = Rails.root.join("db/bestbuy.csv")
csv_data = File.read(product_file)
products = CSV.parse(csv_data, headers: true, encoding: "utf-8")

category_file = Rails.root.join("db/categories.csv")
category_csv_data = File.read(category_file)
categories = CSV.parse(category_csv_data, headers: true, encoding: "utf-8")

province_file = Rails.root.join("db/taxes.csv")
province_csv_data = File.read(province_file)
provinces = CSV.parse(province_csv_data, headers: true, encoding: "utf-8")

provinces.each do |pr|
  province = Province.create!(
    name: pr["name"],
    code: pr["code"]
  )

  unless province.valid?
    Rails.logger.debug "Invalid Order #{province.name} Status"
    next
  end

  puts province.inspect
  tax_rate = province.create_tax(
    pst:   pr["pst"],
    gst:   pr["gst"],
    hst:   pr["hst"],
    total: pr["total"]
  )
  puts tax_rate.inspect
end

categories.each do |p|
  category = Category.create!(
    name:        p["name"],
    description: p["description"]
  )
end
products.each do |c|
  puts "#{c['image']}"
  puts "#{c['Category']}"
  category = Category.find_or_create_by!(name: c["Category"])
  puts category.name
  product = category.products.find_or_create_by!(
    Name:        c["name"],
    Price:       c["price"].to_f,
    Description: c["description"],
    Stock:       rand(1..50)
  )
  query = c["image"]
  downloaded_image = URI.open(query)
  product.image.attach(io: downloaded_image, filename: "#{product['name']}-.jpg")
end

puts "#{Product.count} new products were added"
puts "#{Category.count} new categories were added"

if Rails.env.development?
  AdminUser.create!(email: "admin@example.com", password: "password",
                    password_confirmation: "password")
end
