class Book < ApplicationRecord
  belongs_to :bookcase
  belongs_to :user


end
