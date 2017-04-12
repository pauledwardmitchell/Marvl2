require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'User Creation' do

    context 'User is invalid without first and last name' do
      it 'is invalid' do
        expect(FactoryGirl.build(:user, :without_names)).to be_invalid
      end
    end

    context 'User is invalid without email' do
      it 'is invalid' do
        expect(FactoryGirl.build(:user, :without_email)).to be_invalid
      end
    end

  end

end
