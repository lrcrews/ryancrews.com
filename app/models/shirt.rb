class Shirt < ActiveRecord::Base

	belongs_to :post

  validates :image_link , presence: true
  validates :link, presence: true
	validates :name, presence: true


	def as_json(options={})
		hash = {
			created_at: self.created_at,
			id: self.id,
			image_link: self.slug,
			link: self.teaser_text,
			name: self.title.present? ? self.title.titleize : "",
			updated_at: self.updated_at
		}

		include_all = options[:include_all] == "yes"

		if include_all || options[:include_post] == "yes"
			hash.merge!(post: self.post.as_json)
		end

		hash
	end
	
end
