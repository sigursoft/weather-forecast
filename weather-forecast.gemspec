# frozen_string_literal: true

Gem::Specification.new do |gem|
  gem.name    = 'weather-forecast'
  gem.version = 1.0
  gem.license = 'MIT'
  gem.date    = Date.today.to_s

  gem.summary = 'Weather Forecast'
  gem.description = 'Weather Forecast Command Line Tool'

  gem.authors  = ['Anton Kozik']
  gem.email    = 'anton.kozik@gmail.com'
  gem.homepage = 'http://github.com/sigursoft/weather-forecast'

  gem.add_dependency 'google-cloud-translate', '~> 1.1'
  gem.add_dependency 'require_all', '~> 1.5'

  # ensure the gem is built out of versioned files
  gem.files = Dir['{lib}/**/*', 'README*',
                  'LICENSE*', 'weather-forecast'] & `git ls-files -z`.split("\0")
end
