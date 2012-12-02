roles = %w{user admin super-admin}.map do |role|
  Role.create name: role
end

roles.each_with_index do |role, i|
  10.times { |j| role.users.create full_name: "user_#{i}#{j}", email: "e#{i}#{j}@example.com", password: 'secret' }
end
