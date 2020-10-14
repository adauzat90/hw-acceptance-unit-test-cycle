class Movie < ActiveRecord::Base
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end
  
  def find_similar_movies
    
    if not self[:director] == nil ||  self[:director] == ""
      return Movie.where(:director => self[:director])
    end
  end
end
