require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'should be invalid without a name' do
      expect(build(:user, name: nil)).to_not be_valid
    end

    it 'should be invalid without an email' do
      expect(build(:user, email: nil)).to_not be_valid
    end

    it 'should be invalid without a password' do
      expect(build(:user, password: nil)).to_not be_valid
    end

    it 'should be invalid if email is not unique' do
      user = create(:user)
      expect(build(:user, email: user.email)).to_not be_valid
    end
  end
end
