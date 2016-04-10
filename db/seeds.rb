eddy = User.create(name: "Eddy", email: "eddy@eddy.com", password: "password")
# eddy = User.find(1)




eddy.workouts.create(name: "Bench Press", reps: 10, sets: 5,completed: true, weight: 325)
eddy.workouts.create(name: "Dips", reps: 12, sets: 5,completed: false, weight: 200)
eddy.workouts.create(name: "Shoulder Press", reps: 10, sets: 5,completed: true, weight: 150)