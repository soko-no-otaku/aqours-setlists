namespace :yaml_formatter do
  desc 'Formats events.yml by rewriting it'
  task :events do
    YAML.dump(YAML.load_file('db/events.yml'), File.open('db/events.yml', 'w'))
  end

  desc 'Formats songs.yml by rewriting it'
  task :songs do
    YAML.dump(YAML.load_file('db/songs.yml'), File.open('db/songs.yml', 'w'))
  end

  desc 'Formats venues.yml by rewriting it'
  task :venues do
    YAML.dump(YAML.load_file('db/venues.yml'), File.open('db/venues.yml', 'w'))
  end
end
