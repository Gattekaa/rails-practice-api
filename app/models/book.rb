class Book < ApplicationRecord
  belongs_to :bookcase

  validates :title, presence: true
  validate :check_bookcase_limit

  def check_bookcase_limit
    if bookcase.limit == bookcase.books.count
      errors.add(:bookcase, "não pode ter mais livros do que o limite (#{bookcase.limit})")
    end
  end
end
