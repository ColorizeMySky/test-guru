ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)

require 'logger'
require 'bundler/setup' # Set up gems listed in the Gemfile.
