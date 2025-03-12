class AddUserReferenceToBookcases < ActiveRecord::Migration[8.0]
  def change
    add_reference :bookcases, :user, null: false, foreign_key: true
  end
end
