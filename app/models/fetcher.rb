class Fetcher < ActiveRecord::Base
  validates :username, presence: true

  def to_param
    slug
  end
end
