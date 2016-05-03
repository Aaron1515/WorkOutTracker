def rand_workout
  ["Squats", "Jump Squats", "Push-Ups","Mtn Climbers","Frog Jumps","Sit-Ups"].sample
end

def rand_weight
  ('100'..'250').to_a.push('BW').sample
end


# eddy = User.create(name: "Eddy", email: "eddy@eddy.com", password: "password", admin: true)
# aaron = User.create(name: "Aaron", email: "aaron@aaron.com", password: "password", admin: false)
# sanderfer = User.create(name: "Sanderfer", email: "san@san.com", password: "password", admin: false)

30.times do
  random_user = User.create(name: Faker::Name.name, email: Faker::Internet.email, password: "password", admin: false)
    10.times do
      random_user.workouts.create(name: rand_workout, reps: rand(7..10), sets: rand(2..3), weight: rand_workout, phase: rand(1..4), day: rand(1..4), rest: rand(0..3))
      aaron.workouts.create(name: rand_workout, reps: rand(7..10), sets: rand(2..3), weight: rand_workout, phase: rand(1..4), day: rand(1..4), rest: rand(0..3))
      sanderfer.workouts.create(name: rand_workout, reps: rand(7..10), sets: rand(2..3), weight: rand_workout, phase: rand(1..4), day: rand(1..4), rest: rand(0..3))
    end
end