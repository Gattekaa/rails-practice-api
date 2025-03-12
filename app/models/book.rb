class Book < ApplicationRecord
  belongs_to :bookcase
  belongs_to :user

  validate :is_bookcase_full?

  def is_bookcase_full?
    if bookcase.books.count >= bookcase.limit
      errors.add(:bookcase, "Bookcase is full")
    end
  end
end
