require 'rails_helper'

RSpec.describe Bookcase, type: :model do
  describe 'validations' do
    context 'when adding a new bookcase' do
      it 'should be invalid without a limit' do
        expect(build(:bookcase, limit: nil)).to_not be_valid
      end

      it 'should be invalid if limit is not a number' do
        expect(build(:bookcase, limit: 'a')).to_not be_valid
      end

      it 'should be invalid if limit is not greater than 0' do
        expect(build(:bookcase, limit: 0)).to_not be_valid
      end
    end

    context 'when updating a bookcase' do
      it 'should be invalid if try to update the bookcase limit and limit is less than the number of books' do
        bookcase = create(:bookcase, limit: 1)
        create(:book, bookcase: bookcase)
        bookcase.limit = 0
        expect(bookcase).to_not be_valid
      end
    end
  end
end
