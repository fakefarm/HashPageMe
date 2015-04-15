require 'yaml'
toc = YAML.load_file("gittoc.yml")

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
            f.write "[#{c[8..-1]}](https://github.com/#{github_repo_name}/commit/#{sha})\n\n"
          end
        end
    end
    puts 'Table of Contents have been wrote'
  end
end

def git_command(section)
  "git log --grep '#{section['tags'][0]}' --no-merges --oneline --reverse"
end

def github_repo_name
  `git remote -v`.
  split("\n").
  map { |row| row.split("\t")[1]}.
  map{ |g| /github.com\:([a-zA-Z]*\/[a-zA-Z]*)\.git/.match(g) }.
  compact.
  map{|g| g[1]}.
  uniq[0]
end

# NOTES

## Git
# what are log formatting options?
# - show first 200 words of a commit
# - the date
# How do I exclude commits from output?
# How do I get more than single tag?
# How do I prevent duplicate entries?

## Ruby / Rake
# What's the best way to create options? .yml file?

## Gem
# What does it take to make this a gem?
