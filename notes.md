# Jon Daniel 6/17/15

- live code the rake task.
- Rake task should pull tweets from DB first.
- if no db tweets (because rake task hasn't run) keep thing with a 'please tell dave to run rake task.'
- show page should show tweets from db, not from twitter for MVP.

## TODO
- Fetch data from twitter
- print to screen as json so we know what we want to store in our DB
- print out the other tweets to assemble

## DB DESIGN
QUESTIONS TO ASK

## what tables do we have in this app? 
HOLD OFF FROM DOING A SETTING or any EXTRA TABLES until absolutely necessary
_don't worry about fields_
- users (chief table) id, user, handle, has_many: tweets, polished_tweets
- polished_tweets text, tags, images, tweet_id, belongs to user, has_one raw_tweet
- raw_tweets - primary_id, json blob, raw_tweet_id, belongs to user, has_one: polished

## HOMEWORK
### 1. how are we going to save and retrieve tweets?
    opitmal data types for different values
    build basic tests around models - validation
    start doing a mysql migration and build models for them

### What do we need to store?
- does this have a #b?
- user_id
- tags
- text
- image info

## Last week deals went down. What caused it and how do we prepare for this?
- introduce specific issues for a couple hours a month.
- see how the application breaks and provide best way to solve them. In the spirit of building fault tolerant software.

# Jon Daniel 6/2/15

LEt's write a rake task to explore.
rake tasks help explore an idea rather than build an app


## features
print param we pass in.

    namespace :twitter do
      task :index_tweets, [:handle] => [:environment] do # => :environment specifies dependencies.
        puts "hello #{:handle}!"
        # rake twitter:index_tweets(handle)
      end
    end

    [ 14:31 06/03 ] ~/Dropbox/300_code/learn/hashPage
    [ master * ] $ be rake twitter:get(:wwwoodall)
    bash: syntax error near unexpected token `('

    [ 14:35 06/03 ] ~/Dropbox/300_code/learn/hashPage
    [ master * ] $ be rake twitter:get[wwwoodall]
    wwwoodall

    [ 14:36 06/03 ] ~/Dropbox/300_code/learn/hashPage
    [ master * ] $ be rake twitter:get wwwoodall

    rake aborted!
    Don't know how to build task 'wwwoodall'

    (See full trace by running task with --trace)


# Tom Copeland 6/1/15

1. Business idea.

2. Product person defines what happens when a user does X.
### high level user stories
- as a user when i sign in using twitter, i expect my hash page to start working
— break that down further
    - as a user (system stories)

### System stories
- in order to make a hashpage work i have to fetch the tweets
- and then process them

## Rules
- need to store how many times we fetch tweets
- need to set rules of when / how we fetch tweets
- figure out how we store tweets (whole blob, or upfront parsing, or raw data with bg job)


## decisions to make in terms of generating hashpage that the user sees

(Already have the tweets…)

### step 1 options…

### Questions
how to control the fetching of tweets
- gets data into system

how to generate the website based on content of tweets
- determines how fast you want the site to be.

#### option 1 - easy but slower?  (do on fly)
#### option 2 - fast but more complicated (storage questions)

### steps 2 - 4 are the same.
#### 2. parse tweets
#### 3. extract
#### 4. generate page




## HOMEWORK - DB MODEL
- timestamps, id, blob, textarea 65k - tweets


# Jon Daniel 5/13

## When multiple tests fail

Q - what’s going on?
- is it configurations? (how the tests setup)
- is it environment? (diff version of mysql, osx, etc.)
- are these tests just broken? (Check CI)

Don’t make changes until the build passes. May need to comment out some tests.

Focus on the deepest test possible first (not a view or controller, but more of a service, or model, or any library)

