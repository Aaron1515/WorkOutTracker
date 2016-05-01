eddy = User.create(name: "Eddy", email: "eddy@eddy.com", password: "password", admin: true)
aaron = User.create(name: "Aaron", email: "aaron@aaron.com", password: "password", admin: false)
sanderfer = User.create(name: "Sanderfer", email: "san@san.com", password: "password", admin: false)

aaron.workouts.create(name: "Squats", reps: 10, sets: 3, weight: "BW", phase: 1, day:1, rest:'0', completed: false)
aaron.workouts.create(name: "Jump Squats", reps: 10, sets: 3, weight: "BW", phase: 1, day:1, rest:'0', completed: false)
aaron.workouts.create(name: "Push-Ups", reps: 10, sets: 3, weight: "BW", phase: 1, day:1, rest:'0', completed: false)
aaron.workouts.create(name: "Mtn Climbers", reps: 10, sets: 3, weight: "BW", phase: 1, day:1, rest:'0', completed: false)
aaron.workouts.create(name: "Frog Jumps", reps: 10, sets: 3, weight: "BW", phase: 1, day:1, rest:'0', completed: false)
aaron.workouts.create(name: "Sit-Ups", reps: 10, sets: 3, weight: "BW", phase: 1, day:1, rest:'0', completed: false)


sanderfer.workouts.create(name: "Squats", reps: 10, sets: 3, weight: "BW", phase: 1, day:1, rest:'0', completed: false)
sanderfer.workouts.create(name: "Jump Squats", reps: 10, sets: 3, weight: "BW", phase: 1, day:1, rest:'0', completed: false)
sanderfer.workouts.create(name: "Push-Ups", reps: 10, sets: 3, weight: "BW", phase: 1, day:1, rest:'0', completed: false)
sanderfer.workouts.create(name: "Mtn Climbers", reps: 10, sets: 3, weight: "BW", phase: 1, day:1, rest:'0', completed: false)
sanderfer.workouts.create(name: "From Jumps", reps: 10, sets: 3, weight: "BW", phase: 1, day:1, rest:'0', completed: false)
sanderfer.workouts.create(name: "Sit-Ups", reps: 10, sets: 3, weight: "BW", phase: 1, day:1, rest:'0', completed: false)


30.times do
random_user = User.create(name: "Aaron", email: "aaron@aaron.com" + rand(99).to_s, password: "password", admin: false)
end