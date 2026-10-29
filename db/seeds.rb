p "Category destroy all"

Category.destroy_all


p "Category create"
categories = [
  { name: "Łazienki", slug: "lazienki" },
  { name: "Kuchnie", slug: "kuchnie" },
  { name: "Mieszkania", slug: "mieszkania" }
]

categories.each do |attributes|
  category = Category.find_or_initialize_by(slug: attributes[:slug])
  category.update!(attributes)
end

puts "Kategorie zostały utworzone!"