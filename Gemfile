source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.3.4"

gem "sinatra", "~> 2.2.0"
gem "puma"
gem "google_drive"
gem "mutex_m"
gem "rss"

group :test do
  gem "rspec"
end

group :test, :development do
  gem "standard"
  gem "pry"
  gem "webmock"
  gem "dotenv"
end
