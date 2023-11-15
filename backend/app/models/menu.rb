  # == Schema Information
#
# Table name: menus
#
#  name             :string
#  price             :float

class Menu < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 20 }
  validates :price, presence: true, comparison: { greater_than_or_equal_to: 0 }
end
