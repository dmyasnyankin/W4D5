require 'rails_helper'
require 'spec_helper'

feature 'the signup process' do
  scenario 'has a new user page'
  
  feature 'can sign up user' do
     
    scenario 'shows username on the homepage once logged in'
  end
end

feature 'logging in' do
  scenario 'display username on top of the page'
  scenario 'doesn\'t show username on the homepage after logout'
end