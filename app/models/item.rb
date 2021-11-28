class Item < ApplicationRecord
  #attr_accessor :price, :name, :real, :weight, :description

  validates :price, numericality: {greater_than: 0, allow_nil: true}
  validates :name, :description, presence: true

  validates :name, presence: true

  acts_as_votable
  #belongs_to :user

end
