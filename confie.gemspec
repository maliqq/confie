Gem::Specification.new do |s|
  s.name        = 'confie'
  s.version     = '0.0.1'
  s.summary     = "confie"
  s.homepage    = 'https://github.com/maliqq/confie'
  s.description = "Minimalistic settings for your Rails application"
  s.authors     = ["Malik Baktiyarov"]
  s.email       = 'malik@baktiyarov.com'
  s.files       = Dir["lib/**/*.rb"] + ['README.md']

  s.add_dependency 'hashie'
end
