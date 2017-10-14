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
        describe 'after valid model call' do
            before :each do
                allow(Movie).to receive(:similar).and_return(@fake_results)
                get :director, {:id => 'fake movie'}
            end
            it 'selects the Similar Movies template for rendering' do
            expect(response).to render_template('director')
            end
            it 'makes the returned similar movies available to that template' do
            expect(assigns(:movies)).to eq(@fake_results)
            end
        end
    end
    describe 'handles no director Similar Movie request' do
        before :each do
            @fake_movie1 = double('Movie')
            allow(@fake_movie1).to receive(:title).and_return('Movie1')
            allow(@fake_movie1).to receive(:director).and_return('')
            @fake_movie2 = double('Movie')
            allow(@fake_movie2).to receive(:director).and_return(false)
            allow(@fake_movie2).to receive(:title).and_return('Movie2')
            allow(Movie).to receive('find').and_return(@fake_movie1)
        end
        describe 'after model returns false to similar' do
            before :each do
                allow(Movie).to receive(:similar).and_return(false)
                get :director, {:id => 'test movie'}
            end
            it 'selects the home page for rendering' do
                expect(response).to redirect_to movies_path
            end
            it 'sends a flash response with correct message' do
                expect(flash[:notice]).to be_present
                if flash[:notice]
                    expect(flash[:notice]).to eq("'Movie1' has no director info")
                end
            end
        end
    end
end