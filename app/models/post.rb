class Post < ActiveRecord::Base


	# Constants to denote the type of "special" Posts
	POST_TYPE_ABOUT = "about"
	POST_TYPE_DISCLOSURE = "disclosure"


	belongs_to :category

	has_one :shirt


	default_scope { order('created_at desc') }

	scope :most_recent, -> (count) { order('created_at desc').limit(count) unless count.nil? }
	scope :of_type, -> (type) { where(post_type: type).first unless type.nil? }


	def as_json(options={})
		hash = {
			created_at: self.created_at,
			html_content: self.html_content,
			id: self.id,
			name: self.name.present? ? self.name.titleize : "",
			slug: self.slug,
			teaser_text: self.teaser_text,
			updated_at: self.updated_at
		}

		#include_all = options[:include_all] == "yes"

		if options[:exclude_category] != "yes"
			hash.merge!(category: self.category.as_json)
		end

		hash
	end


	# A more SEO optimized URL slug, also check out
	# to_param method
	def slug
    self.name.downcase.gsub(" ", "-") unless self.name.nil?
  end


	# per our style guide we know that html_content
	# should start with a section tag and inside that
	# section tag there should be another section tag.
	# this is our intro paragraph, and we're going
	# to assume it's there.
	#
	# (what?  it's my blog!  ...don't judge me.)
	def teaser_text
		# assumption: html_content always starts with '<section>'
		# therefore I will find the content of the next '<section>'
		# by starting our search at position 8
		intro_starting_index = self.html_content.index('<section>', 8)
		# but of course we don't want to include '<section>' in our
		# teaser text, so lets add 9 to this (length of '<section>')
		intro_starting_index += 9
		# ... and the index of the closing tag is
		intro_ending_index = self.html_content.index('</section>', intro_starting_index)
		# so here's our teaser, which will be '...' via css in cases
		# where it's longer than the space available
		teaser = self.html_content[intro_starting_index...intro_ending_index]
		teaser = teaser[0..240] if teaser.length > 240
		"#{teaser}..."
	end


	# Rails normally calls .to_s on the model's id, we're
	# going to add the name of the post to that for SEO
	# reasons.  By keeping id first in the string we don't
	# lose any functionality as calling .to_i (as Rails does)
	# on a string that begins with numbers and then has
	# characters will return the number in front, which is
	# the id we need for the controller to find the correct
	# post.
  def to_param
    "#{id}-#{self.slug}"
  end


end
