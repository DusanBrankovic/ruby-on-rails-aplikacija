admin_type = UserType.create({ key: "admin_user", name: "Admin korisnik" })
registered_type = UserType.create({ key: "registered_user", name: "Registrovani korisnik" })

User.create!(user_type_id: admin_type.id,
             first_name:  "Dusan",
             last_name: "Brankovic",
             email_address: "d@a.rs",
             password:  "123")
             
User.create!(user_type_id: registered_type.id,
             first_name:  "Dusan",
             last_name: "Brankovic",
             email_address: "d@r.rs",
             password:  "123")
             
             
100.times do |n|
  user = User.create([
    {
      user_type_id: registered_type.id,
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      email_address: Faker::Internet.unique.email,
      password: Faker::Number.number(digits: 10).to_s
    }
  ])
end

WorkoutType.create(name: "Trening snage")
WorkoutType.create(name: "Kontinuirani trening")
WorkoutType.create(name: "Intervalni trening")
WorkoutType.create(name: "Fartlek")
WorkoutType.create(name: "Polimetrija")
WorkoutType.create(name: "Tajpering (Tapering)")

EquipmentType.create(name: "Tegovi")
EquipmentType.create(name: "Sprave")
EquipmentType.create(name: "Rekviziti")
EquipmentType.create(name: "Lopte")
EquipmentType.create(name: "Ostalo")

Equipment.create(name: "LAT masina")
Equipment.create(name: "Chest press")
Equipment.create(name: "Klupa")
Equipment.create(name: "Lopta za pilates")
Equipment.create(name: "Traka za trcanje")

