class Fetcher < ActiveRecord::Base
  validates :username, presence: true
end
