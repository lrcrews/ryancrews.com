class Link < ActiveRecord::Base


	# link type constants
	LINK_TYPE_GEEKY = "geeky" # links to wikipedia/youtube/gifs/etc to help englighten readers to the geeky references in the post
	LINK_TYPE_GITHUB = "github" # links to code on github
	LINK_TYPE_REFERENCE = "reference" # links to sites related to the post's point
	LINK_TYPE_STACKOVERFLOW = "stackoverflow" # links to answers on StackExchange

	LINK_TYPES = [ LINK_TYPE_GEEKY, LINK_TYPE_GITHUB, LINK_TYPE_REFERENCE, LINK_TYPE_STACKOVERFLOW ]


	belongs_to :post


	validates :link_type, inclusion: LINK_TYPES


	scope :geeky_links, -> { where(link_type: LINK_TYPE_GEEKY) }
	scope :github_links, -> { where(link_type: LINK_TYPE_GITHUB) }
	scope :reference_links, -> { where(link_type: LINK_TYPE_REFERENCE) }
	scope :stackoverflow_links, -> { where(link_type: LINK_TYPE_STACKOVERFLOW) }


	def geeky?
		link_type == LINK_TYPE_GEEKY
	end


	def github?
		link_type == LINK_TYPE_GITHUB
	end


	def reference?
		link_type == LINK_TYPE_REFERENCE
	end


	def stackoverflow?
		link_type == LINK_TYPE_STACKOVERFLOW
	end


end
