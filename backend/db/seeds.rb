user = User.create(username: 'testuser', email: 'test@example.com', password: 'password')

if user.persisted?
  # Create some tasks for the user
  3.times do |i|
    user.tasks.create(title: "Task #{i + 1}", description: "Description for task #{i + 1}", status: "Pending")
  end
else
  puts "User creation failed: #{user.errors.full_messages.join(', ')}"
end
