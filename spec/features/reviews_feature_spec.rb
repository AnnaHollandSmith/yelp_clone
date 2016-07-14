require 'rails_helper'

feature 'reviewing' do
  before do
    Restaurant.create name: 'KFC'
  end

  scenario 'allows users to leave a review using a form' do
    sign_up
    leave_review
    expect(current_path).to eq '/restaurants'
    expect(page).to have_content('so so')
    end

end
