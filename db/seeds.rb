# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts "Cleaning database..."
Product.destroy_all

puts "Creating products..."
products = [
  { name: "Trousers", category: "clothing", material: "denim", description: "A pair of blue jeans best suited for tall people. Made from durable denim for everyday wear.", price: 50, size: "medium", available_quantity: 5 },
  { name: "Leather Jacket", category: "clothing", material: "leather", description: "A stylish black leather jacket with a slim fit. Perfect for casual outings or chilly evenings.", price: 120, size: "large", available_quantity: 8 },
  { name: "Cotton T-Shirt", category: "clothing", material: "cotton", description: "A breathable cotton t-shirt available in various colors. Soft and comfortable for all-day wear.", price: 15, size: "small", available_quantity: 6 },
  { name: "Wool Sweater", category: "clothing", material: "wool", description: "A warm wool sweater ideal for winter. Features a classic cable-knit pattern.", price: 60, size: "large", available_quantity: 3 },
  { name: "Silk Scarf", category: "accessory", material: "silk", description: "An elegant silk scarf with vibrant patterns. Adds a touch of luxury to any outfit.", price: 35, size: "one size", available_quantity: 4 },
  { name: "Dining Table", category: "furniture", material: "wood", description: "A solid wood dining table that seats six people. Perfect for family meals and gatherings.", price: 400, size: "72x36x30", available_quantity: 2 },
  { name: "Office Chair", category: "furniture", material: "mesh", description: "An ergonomic office chair with lumbar support. Designed for comfort during long work hours.", price: 150, size: "24x24x36", available_quantity: 7 },
  { name: "Canvas Backpack", category: "accessory", material: "canvas", description: "A durable canvas backpack with multiple compartments. Ideal for students or travelers.", price: 40, size: "one size", available_quantity: 9 },
  { name: "Sneakers", category: "clothing", material: "synthetic", description: "Lightweight sneakers designed for comfort and performance. Great for jogging or casual wear.", price: 70, size: "medium", available_quantity: 6 },
  { name: "Coffee Table", category: "furniture", material: "glass", description: "A sleek coffee table with a tempered glass top. Adds modern charm to your living room.", price: 200, size: "48x24x18", available_quantity: 3 },
  { name: "Denim Jacket", category: "clothing", material: "denim", description: "A classic blue denim jacket with a comfortable fit. Versatile and durable for everyday use.", price: 80, size: "large", available_quantity: 4 },
  { name: "Woolen Beanie", category: "accessory", material: "wool", description: "A cozy woolen beanie to keep you warm in winter. Available in various colors.", price: 20, size: "one size", available_quantity: 5 },
  { name: "Bookshelf", category: "furniture", material: "wood", description: "A tall wooden bookshelf with five shelves. Perfect for organizing books and decor items.", price: 250, size: "30x12x72", available_quantity: 2 },
  { name: "Leather Belt", category: "accessory", material: "leather", description: "A premium leather belt with an adjustable buckle. Durable and stylish for formal or casual wear.", price: 30, size: "one size", available_quantity: 8 },
  { name: "Sports Cap", category: "accessory", material: "cotton", description: "A lightweight cotton sports cap with an adjustable strap. Ideal for outdoor activities.", price: 15, size: "one size", available_quantity: 10 },
  { name: "Bedside Table", category: "furniture", material: "wood", description: "A compact wooden bedside table with a drawer. Practical and elegant for bedrooms.", price: 90, size: "18x18x24", available_quantity: 6 },
  { name: "Winter Coat", category: "clothing", material: "wool", description: "A long woolen winter coat with a tailored fit. Keeps you warm and stylish in cold weather.", price: 180, size: "large", available_quantity: 2 },
  { name: "Pendant Necklace", category: "accessory", material: "silver", description: "A delicate silver pendant necklace with a minimalist design. Perfect for everyday wear.", price: 45, size: "one size", available_quantity: 7 },
  { name: "Linen Shirt", category: "clothing", material: "linen", description: "A lightweight linen shirt ideal for warm weather. Features a relaxed fit for casual outings.", price: 40, size: "medium", available_quantity: 9 },
  { name: "Recliner Sofa", category: "furniture", material: "leather", description: "A luxurious leather recliner sofa for ultimate comfort. Includes a built-in footrest.", price: 800, size: "84x36x40", available_quantity: 1 },
  { name: "Running Shoes", category: "clothing", material: "mesh", description: "Breathable mesh running shoes designed for support and performance. Suitable for all terrains.", price: 90, size: "small", available_quantity: 8 },
  { name: "Wrist Watch", category: "accessory", material: "stainless steel", description: "A classic stainless steel wrist watch with a sleek design. Water-resistant and reliable.", price: 120, size: "one size", available_quantity: 5 },
  { name: "Fleece Jacket", category: "clothing", material: "fleece", description: "A lightweight fleece jacket with a zip-up front. Keeps you warm during outdoor activities.", price: 60, size: "medium", available_quantity: 4 },
  { name: "Dining Chair Set", category: "furniture", material: "wood", description: "A set of four wooden dining chairs with cushioned seats. Comfortable and elegant.", price: 300, size: "18x18x36", available_quantity: 3 },
  { name: "Leather Gloves", category: "accessory", material: "leather", description: "Soft leather gloves lined with fleece for warmth. A great choice for winter.", price: 50, size: "one size", available_quantity: 9 },
  { name: "Silk Tie", category: "accessory", material: "silk", description: "A formal silk tie available in various patterns. Adds sophistication to business attire.", price: 25, size: "one size", available_quantity: 10 },
  { name: "King-Size Bed", category: "furniture", material: "wood", description: "A sturdy king-size bed frame with a modern design. Ensures a comfortable night's sleep.", price: 600, size: "80x76x14", available_quantity: 2 },
  { name: "Cardigan Sweater", category: "clothing", material: "cotton", description: "A soft cotton cardigan sweater with button closures. Perfect for layering during cool days.", price: 55, size: "small", available_quantity: 6 },
]

products.each do |product|
  new_product = Product.create!(product)
  # new_product.set_photo
end

puts "Created #{Product.count} products with images!"
