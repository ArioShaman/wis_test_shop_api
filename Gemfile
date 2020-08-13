source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

gem 'rails', '~> 6.0.3', '>= 6.0.3.2'
gem 'jbuilder', '~> 2.7'
# gem 'redis', '~> 4.0'

gem 'bootsnap', '>= 1.4.2', require: false


gem 'pg'
gem 'carrierwave'
gem 'awesome_print'
gem 'rack-cors'
gem 'active_model_serializers'

group :development, :test do
    gem 'faker', :git => 'https://github.com/faker-ruby/faker.git', :branch => 'master'
    gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
    gem 'robocop'
end

group :development do
    gem 'annotate'
    gem 'listen', '~> 3.2'
    gem 'spring'
    gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
