require 'rails_helper'

RSpec.describe MoviesController, :type => :controller do
    describe "#find_similar_movies" do
        before do
            @movie_1 = Movie.new(:title => "Test 1", :director => "Marval")
            @movie_1.save
            @movie_2 = Movie.new(:title => "Test 2", :director => "Marval")
            @movie_2.save
            @movie_3 = Movie.new(:title => "Test 3", :director => "DC")
            @movie_3.save
            @movie_4 = Movie.new(:title => "Test 4", :director => "")
            @movie_4.save
        end
        
        describe "When the movie has a director" do
            it "should return movies with the same director" do
               get :find_similar_movies, {:id => 1}
               
               expect(response).to render_template(:find_similar_movies)
               expect(assigns(:movies)).to eq([@movie_1,@movie_2])
           end
       end
        
        describe "When the movie does not have a director" do
            it "should redirect to home page" do
                get :find_similar_movies, {:id => 4}
                expect(response).to redirect_to(movies_path)
                #expect(response).to include("'#{@movie_4.title}' has no director info")
            end
        end
            
    end
end

RSpec.describe 'Movie', :type => :model do
    describe "Find Similar Movies" do
        before do
            @movie_1 = Movie.new(:title => "Test 1", :director => "Marval")
            @movie_1.save
            @movie_2 = Movie.new(:title => "Test 2", :director => "Marval")
            @movie_2.save
            @movie_3 = Movie.new(:title => "Test 3", :director => "DC")
            @movie_3.save
            @movie_4 = Movie.new(:title => "Test 4")
            @movie_4.save
        end
        it "should find movies by the same director" do
            @movies = @movie_1.find_similar_movies
            expect(@movies).to eq([@movie_1,@movie_2])
        end
        
        it "should not return anything if the movie has no director" do
            @movies = @movie_4.find_similar_movies
            expect(@movies).to eql(nil)
        end
    end
end