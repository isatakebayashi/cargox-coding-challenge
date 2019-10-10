require_relative 'app/mars_explore'

if ARGV.count != 1
  puts 'Usage: ruby mars_explore_cli.rb <world_description_file>'
  exit(1)
end

file_name = ARGV[0]
file = File.open(file_name)
MarsExplore.explore(file)
