Gem::Specification.new do |spec|
  spec.name        = 'minitest-github_action_reporter'
  spec.version     = '0.0.1'
  spec.authors     = 'Ulysse Buonomo'
  spec.homepage    = 'https://github.com/BuonOmo/minitest-reporters-github_action_reporter'
  spec.license     = 'MIT'
  spec.summary     = 'Enhance Github Action output'
  spec.email       = 'buonomo.ulysse@gmail.com'

  spec.files = Dir["lib/**/*"] + [
    'README.md',
    'LICENSE',
  ]

  spec.add_dependency 'minitest', '~> 5.15'
  spec.add_development_dependency 'rake'
end
