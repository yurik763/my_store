class Item < ApplicationRecord
  #attr_accessor :price, :name, :real, :weight, :description

  validates :price, numericality: {greater_than: 0, allow_nil: true}
  validates :name, :description, presence: true

  validates :name, presence: true

  has_many :positions
  has_many :carts, through: :positions

  acts_as_votable
  

end
