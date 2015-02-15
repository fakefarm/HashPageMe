module ApplicationHelper
  def app_path
    if ENV['RAILS_ENV'] == 'development'
      'http://localhost:4567'
    else
      'http://wwwoodall.com'
    end
  end
end
