require 'yaml'
toc = YAML.load_file("config/gittoc.yml")

namespace :git do
  task :toc do
    toc['sections'].each do |s|
      puts s['title']
      puts s['summary']
      system("#{git_command(s)}")
      puts ''
    end
  end

  task :publish do
    File.open("git_toc.md", 'w') do |f|
      f.write "# git:toc \n\n"
      toc['sections'].each do |s|
          f.write "## #{s['title']} \n\n"
          f.write "#{s['summary']} \n\n"
          commits = `#{git_command(s)}`
          commits.split("\n").each do |c|
            sha = c[0..6]
            f.write "[#{c[8..-1]}](https://github.com/woodall/HashPageMe/commit/#{sha})\n\n"
          end
        end
    end
    puts 'Table of Contents have been wrote'
  end
end

def git_command(section)
  "git log --grep '#{section['tags'][0]}' --no-merges --oneline --reverse"
end
