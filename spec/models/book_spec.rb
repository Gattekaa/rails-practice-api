require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'validations' do
    context 'when adding a new book' do
      it 'should be invalid without a title' do
        expect(build(:book, title: nil)).to_not be_valid
      end

      it 'should be invalid if try to add a new book and limit is reached' do
        bookcase = create(:bookcase, limit: 1)
        create(:book, bookcase: bookcase)
        expect(build(:book, bookcase: bookcase)).to_not be_valid
      end
    end
  end
end
