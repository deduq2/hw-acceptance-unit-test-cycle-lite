class Movie < ActiveRecord::Base
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end
  
  def self.similar id
    director_name = Movie.find(id).director
    Movie.where(director: director_name)
  end
end
