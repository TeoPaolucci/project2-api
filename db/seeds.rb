# makes 4 logins: "and@and.com pass abc123", "dna@dna.com pass abc123", etc.
%w(and dna dan nda).each do |name|
  email = "#{name}@#{name}.com"
  next if User.exists? email: email
  User.create!(email: email, password: 'abc123',
               password_confirmation: 'abc123')
end
