module Outstanding
  require 'pathname'

  def self.root
    Pathname.new(File.expand_path('../../', __FILE__))
  end
end

require Outstanding.root.join('lib', 'outstanding', 'setup').to_s

require 'yaml'
include Octopi

config = ::YAML::load(::Outstanding.root.join('config', 'repositories.yml').read)
config['repositories'].each do |repository|
=begin
  repo = ::Repository.find(:user => repository['user'],
                           :repo => repository['repo'])

  puts "--"
  puts "repository: #{repo.url}"
  puts "forks: #{repo.forks}"
  puts "watchers: #{repo.watchers}"
  puts ""
  `open "#{repo.url}/forkqueue"` if repo.forks > 1
=end
  `open "https://github.com/#{repository['user']}/#{repository['repo']}/forkqueue"`
end
