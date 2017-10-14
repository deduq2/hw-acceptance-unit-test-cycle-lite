class Movie < ActiveRecord::Base
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end
  
  def self.similar id
    movie = Movie.find(id)
    director_name = movie.director
    if !director_name or director_name == ''
      false
    else
      Movie.where(director: director_name)
    end
  end
end
