class Bookcase < ApplicationRecord
  has_many :books,  dependent: :destroy
  belongs_to :user

  before_update :check_rating_limit

  validates :limit, presence: true, numericality: { only_integer: true, greater_than: 0 }

  private

  def check_rating_limit
    if limit < books.count
      errors.add(:limit, "não pode ser menor que o número de livros na estante (#{books.count})")
      throw(:abort)
    end
  end
end
