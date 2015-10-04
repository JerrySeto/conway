source "https://rubygems.org"

raise 'Ruby should be >2.0' unless RUBY_VERSION.to_f > 2.0
gem 'sinatra'
group :test do
  gem 'rspec'
end

group :test, :development do
  gem 'pry-byebug'
end
