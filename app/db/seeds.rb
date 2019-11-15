
User.create({ name: 'Admin', username: 'admin', password: 'admin', is_admin: true})
User.create({ name: 'User', username: 'user', password_digest: 'user', is_admin: false})

#5.times do 
#    name = Faker::Name.unique.name
#    login =  Faker::Internet.username
#    password = Faker::Internet.password
#    User.create({ name: name, username: login, password: password, is_admin: false})
#end

