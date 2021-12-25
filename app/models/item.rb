class Item < ApplicationRecord
  #attr_accessor :price, :name, :real, :weight, :description

  mount_uploader :image, ImageUploader

  validates :price, numericality: {greater_than: 0, allow_nil: true}
  validates :name, :description, presence: true
  #validates_presence_of :image

  validates :name, presence: true

  has_many :positions
  has_many :carts, through: :positions

  has_many :comments, as: :commentable

  acts_as_votable
  

end
