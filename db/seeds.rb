10.times do |index|
  User.create(email: "test_mail#{index}@gmail.com", password: '12345', admin: false)
end
