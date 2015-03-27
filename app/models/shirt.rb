class Shirt < ActiveRecord::Base

	belongs_to :post

  validates :image_link , presence: true
  validates :link, presence: true
	validates :name, presence: true
	
end
