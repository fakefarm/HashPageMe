require 'yaml'
toc = YAML.load_file("config/gittoc.yml")

namespace :git do
  task :toc do
    toc['sections'].each do |s|
      puts s['title']
      puts s['summary']
      system("git log --grep '#{s['tags'][0]}' --no-merges --oneline --reverse")
      puts ''
    end
  end
end
