# If you do not have OpenSSL installed, change
# the following line to use 'http://'
source "https://rubygems.org"

gem "rake"

# For faster file watcher updates on Windows:
gem "wdm", "~> 0.1.0", platforms: %i[mswin mingw]

# Windows does not come with time zone data
gem "tzinfo-data", platforms: %i[mswin mingw jruby]

# Include the tech docs gem
gem "govuk_tech_docs", git: "https://github.com/alphagov/tech-docs-gem.git", branch: "http-prefix-support"

# For data attributes
gem "activemodel"

group :test do
  gem "factory_bot"
  gem "rspec"
end

group :development do
  gem "rubocop-govuk"
end
