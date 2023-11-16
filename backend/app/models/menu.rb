  # == Schema Information
#
# Table name: menus
#
#  name             :string
#  price             :float

class Menu < ApplicationRecord
  # Validations
  validates :name, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 20 }
  validates :price, presence: true, comparison: { greater_than_or_equal_to: 0 }

  # Scopes
  scope :search_by_name, ->(query) {
    where('LOWER(name) LIKE ?', "%#{query.downcase}%")
  }
  scope :ordered_by, ->(field = :name, order_by = :asc) {
    field ||= :name
    order_by ||= :asc
    valid_order_values = [:asc, :desc]
    order_direction = valid_order_values.include?(order_by.to_sym) ? order_by.to_sym : :asc

    if column_names.include?(field.to_s)
      order("#{field} #{order_direction}")
    else
      raise ArgumentError, "Invalid field for ordering: #{field}"
    end
  }
end
