
source 'https://rubygems.org'

branch = ENV.fetch('SOLIDUS_BRANCH', 'master')

gem 'solidus', github: 'solidusio/solidus', branch: branch
gem 'solidus_auth_devise', '~> 1.0'

if branch == "master" || branch >= "v2.0"
  gem "rails-controller-testing", group: :test
else
  gem "rails", "~> 4.2"
  gem "rails_test_params_backport", group: :test
end

gem 'deface'

gemspec

group :development, :test do
  gem 'rubocop'
end
