class Customer < ApplicationRecord
  has_many :orders

  def full_name
    'M. Max Lenoir'
  end
end
