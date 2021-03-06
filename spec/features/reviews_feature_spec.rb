require 'rails_helper'

describe 'Reviews feature:'  do

	before(:each) do
		_sign_up_test_user
		_create_sample_restaurant_object(_create_user_object('me@test.com', 'password'))
	end

	context 'adding a new review' do

		it 'can be added by a user' do
			_review_sample_restaurant(5, 'Wonderful')
			expect(page).to have_content('Thank you for your review')
			expect(page).to have_content('Wonderful')
			expect(page).to have_content('★★★★★')
		end

	end

	context 'displaying reviews' do

		it 'shows N/A if no reviews' do
			visit restaurants_path
			expect(page).to have_content('N/A')
		end

		it 'average score' do
			_review_sample_restaurant(5, 'Wonderful')
			_sign_out
			_sign_up_user('me2@test.com', 'password')
			_review_sample_restaurant(1, 'poor')
			expect(page).to have_content('★★★☆☆')
		end

	end

end