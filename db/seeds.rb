@editor = User.create(email: "editor@test.com",
                      password: "password",
                      password_confirmation: "password",
                      role: "editor")

@author = User.create(email: "author@test.com",
                      password: "password",
                      password_confirmation: "password",
                      role: "author")
