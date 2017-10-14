require 'rails_helper'

describe Movie do
    before :each do
        @movie = Movie.new
        Movie.create title: '1', director: ' '
        Movie.create title: '2'
        Movie.create title: '3', director: 'spiel'
        Movie.create title: '3', director: 'spiel'
        Movie.create title: '3', director: 'deuce'
        # @fake_movie1 = double('Movie')
        # allow(@fake_movie1).to receive(:title).and_return('Movie1')
        # allow(@fake_movie1).to receive(:director).and_return('')
        # @fake_movie2 = double('Movie')
        # allow(@fake_movie2).to receive(:director).and_return(false)
        # allow(@fake_movie2).to receive(:title).and_return('Movie2')
        # @fake_movie3 = double('Movie')
        # allow(@fake_movie3).to receive(:title).and_return('Movie3')
        # allow(@fake_movie3).to receive(:director).and_return('spiel')
        # @fake_movie4 = double('Movie')
        # allow(@fake_movie4).to receive(:director).and_return(false)
        # allow(@fake_movie4).to receive(:title).and_return('spiel')
    end
    it 'returns the movies with the same directors'
    it 'returns false when a movie does not have a director'
end