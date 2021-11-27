class Item < ApplicationRecord
  #attr_accessor :price, :name, :real, :weight, :description

  acts_as_votable
  belongs_to :user

  validates :price, numericality: {greater_than: 0, allow_nil: true}
  validates :name, :description, presence: true

  validates :name, presence: true

end
