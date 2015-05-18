class Shirt < ActiveRecord::Base

	
	validates :image_link , presence: true
	validates :link, presence: true
	validates :name, presence: true


	def as_json(options={})
		hash = {
			created_at: self.created_at,
			description: self.description,
			id: self.id,
			image_link: self.image_link,
			link: self.link,
			name: self.name,
			updated_at: self.updated_at
		}

		#include_all = options[:include_all] == "yes"

		hash
	end
	
end
