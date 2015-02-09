class Category < ActiveRecord::Base


	belongs_to :intro_post, class_name: "Post", foreign_key: :intro_post_id

	has_many :posts


	scope :named, -> (name) { where(name: name).limit(1).first unless name.nil? }


	def as_json(options={})
		hash = {
			created_at: self.created_at,
			id: self.id,
			name: self.name.present? ? self.name.downcase : "",
			number_of_posts: self.posts.count,
			slug: self.slug,
			updated_at: self.updated_at
		}

		include_all = options[:include_all] == "yes"

		if include_all || options[:include_intro_post] == "yes"
			intro_post = self.intro_post.as_json(exclude_category: "yes") || {}
			hash.merge!( intro_post: intro_post.merge!(category: self.as_json) )
		end

		if include_all || options[:include_posts] == "yes"
			posts = self.posts.order("id DESC").as_json(exclude_category: "yes")
			hash.merge!( posts: posts.each{ |post_json| post_json.merge!(category: self.as_json) } )
		end

		hash
	end


	# A more SEO optimized URL slug, also check out
	# to_param method
	def slug
    self.name.downcase.gsub(" ", "-") unless self.name.nil?
  end


  # When Rails calls to_param let's make sure it's
  # a SEO optimized string
  def to_param
    "#{id}-#{self.slug}"
  end


	# This is the content for the /categories/meta route,
	# meant to show the styling of the category page,
	# allowing for anyone who downloads this to play around
	# with the css/html/js without needing to create
	# content first.
	def self.meta_category
		category = Category.new
		category.name = "meta"
		category.created_at = "20/12/2002".to_date # original air date of Firefly
		category
	end


end
