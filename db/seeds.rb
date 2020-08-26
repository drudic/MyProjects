10.times do
  Client.create({
    name: Faker::Name.name,
    created_at: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :default) #=> "Tue, 16 Oct 2018 10:48:27 AM -05:00"
  })
end

10.times do
  Project.create({
    name: Faker::Commerce.product_name,
    created_at: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :default), #=> "Tue, 16 Oct 2018 10:48:27 AM -05:00"
    client_id: Faker::Number.between(from: 1, to: 10)
  })
end