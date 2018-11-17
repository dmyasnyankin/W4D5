# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe "validates that a user has a username and password" do
    it { should validate_presence_of :username }
    it { should validate_presence_of :password_digest }
    it { should validate_length_of(:password).is_at_least(6) }
    
    describe 'session_token' do
      it 'assigns a session_token to the user' do
        expect(FactoryBot.build(:user).session_token).not_to be_nil
      end
    end
    
    describe 'password encryption' do
      it 'does not save the password to the DB' do
        FactoryBot.create(:user, username: 'ali')
        user = User.find_by(username: 'ali')
        expect(user.password).not_to be('password')
      end
      
      it 'encrypts the password with BCrypt' do
        FactoryBot.build(:user)
      end
    end
  end
end
