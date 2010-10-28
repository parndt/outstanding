require 'rubygems'

# Set up gems listed in the Gemfile.
if (gemfile = Outstanding.root.join('Gemfile')).file?
  begin
    ENV['BUNDLE_GEMFILE'] = gemfile.to_s
    require 'bundler'
    Bundler.setup
    require 'octopi'
  rescue Bundler::GemNotFound => e
    STDERR.puts e.message
    STDERR.puts "Try running `bundle install`."
    exit!
  end
end

# Ensure everything exists.
require 'fileutils'
Outstanding.root.join('config').mkpath
# Copy the example repositories file to be the file we want, if it doesn't exist.
unless (yml = Outstanding.root.join('config', 'repositories.yml')).file?
  FileUtils::cp "#{yml}.example", yml.to_s
end