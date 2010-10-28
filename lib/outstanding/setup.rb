module Outstanding
  require 'pathname'

  def self.root
    Pathname.new(File.expand_path('../../../', __FILE__))
  end
end

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

  include Octopi
end

# Ensure everything exists.
require 'fileutils'
Outstanding.root.join('config').mkpath
FileUtils::touch Outstanding.root.join('config', 'repositories.yml').to_s