eddy = User.create(name: "Eddy", email: "eddy@eddy.com", password: "password", admin: true)
aaron = User.create(name: "Aaron", email: "aaron@aaron.com", password: "password", admin: false)
sanderfer = User.create(name: "Sanderfer", email: "san@san.com", password: "password", admin: false)

aaron.workouts.create(name: "Bench Press", reps: 10, sets: 5,completed: true, weight: 325)
aaron.workouts.create(name: "Dips", reps: 12, sets: 5,completed: false, weight: 200)
aaron.workouts.create(name: "Shoulder Press", reps: 10, sets: 5,completed: true, weight: 150)

sanderfer.workouts.create(name: "Bench Press", reps: 15, sets: 5,completed: true, weight: 300)
sanderfer.workouts.create(name: "Squats", reps: 8, sets: 5,completed: false, weight: 290)
sanderfer.workouts.create(name: "Deadlifts", reps: 12, sets: 5,completed: true, weight: 200)