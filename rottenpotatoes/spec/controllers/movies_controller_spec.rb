require 'rails_helper'

describe MoviesController do
    describe 'Similar Movies by Director' do
        before :each do
            @fake_results = [double('movie1'), double('movie2')]
        end
        it 'calls the model method that returns similar movies by director' do
            expect(Movie).to receive(:similar).with('test movie').
                and_return(@fake_results)
            get :director, {:id => 'test movie'}
        end
        it 'selects the Similar Movies template for rendering'
        it 'makes the returned similar movies available to that template'
    end
end