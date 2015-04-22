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

  task :publish => [:toc] do
    File.open("git_toc.md", 'w') do |f|
      f.write "# git:toc \n\n"
      toc['sections'].each do |s|
          f.write "## #{s['title']} \n\n"
          f.write "#{s['summary']} \n\n"
          commits = `#{extract_commits_for_tags(s)}`
          commits.split("\n").each do |c|
            sha = c[0..6]
            f.write "[#{c[8..-1]}](https://github.com/#{github_repo_name}/commit/#{sha})\n\n"
          end
        end
    end
    puts 'Table of Contents have been wrote'
  end
end


def extract_commits_for_tags(section)
  "git log --grep '#{section['tags'][0]}' --no-merges --oneline --reverse"
  # NOTES
  # separate data structure and api commands
  # section['tags'][0] needs to be specific, but we need it more flexible.
  # - only need to be string don't couple to a specific data stucture
  # - currently is not reusable
  # - the goal is to use this same method in different environments and with different inputs

  # Keep things modular and separate
  # - API what does the work
  # - Data Type (How data is ultimately needed - string, integer, etc.)
  # - Data Structure (There will be data in a specific way that is not necessarily what is needed.)

end

# RAKE TASK SUMMARY
# we should be able to run code in various ways including rake tasks, irb, console, or cron job.
# rakes job - manage dependencies and provide command line variables
# if we have a rake task, it should call our code quickly.



# HOMEWORK
# abstract rake guts to Ruby classes
# abstract gittoc to gem


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
# Meeting with Tom about Android and realize that there are;
# - Always end points
# - Always a need to coerce data


## Git
# what are log formatting options?
# - show first 200 words of a commit
# - the date
# How do I exclude commits from output?
# How do I get more than single tag?

## Ruby / Rake
# What's the best way to create options? .yml file?

## Gem
# What does it take to make this a gem?


