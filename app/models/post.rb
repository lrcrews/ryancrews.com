class Post < ActiveRecord::Base


	# Constants to denote the type of "special" Posts
	POST_TYPE_ABOUT = "about"
	POST_TYPE_DISCLOSURE = "disclosure"


	belongs_to :category

	has_many :links


	default_scope { order('created_at desc') }

	scope :most_recent, -> (count) { order('created_at desc').limit(count) unless count.nil? }
	scope :of_type, -> (type) { where(post_type: type).first unless type.nil? }


	def as_json(options={})
		hash = {
			created_at: self.created_at,
			html_content: self.html_content,
			id: self.id,
			slug: self.slug,
			teaser_text: self.teaser_text,
			title: self.title.present? ? self.title.titleize : "",
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
    self.title.downcase.gsub(" ", "-") unless self.title.nil?
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
	# going to add the title of the post to that for SEO
	# reasons.  By keeping id first in the string we don't
	# lose any functionality as calling .to_i (as Rails does)
	# on a string that begins with numbers and then has
	# characters will return the number in front, which is
	# the id we need for the controller to find the correct
	# post.
  def to_param
    "#{id}-#{self.slug}"
  end


	# POC time:
	#
	# "Hate to sound sleazy, but tease me, I don't want it if it's that easy"
	# 		~ Tupac Shakur
	#
	# ...but that's not really what I meant by POC.  What follows
	# is a proof of concept of a Post.  You'll see this used
	# in the /posts/meta controller action, and it's purpose is
	# provide a always present post example to act as a style guide
	# and playground.  If you've downloaded this code you can
	# navigate to /posts/meta to see this and alter the css until
	# your heart is content without every needing to provide an
	# actual post.
	def self.meta_post
		post = Post.new
		post.title = "This is a title that will be titlelized, a nice little method rails gives us"
		post.created_at = "24/02/1993".to_date # original release year of HTML

		# NEVER generate HTML in your model.  This fundamentally
		# breaks the MVC paradigm.  What I'm doing here is slightly
		# different, but let's make sure we're on the same page.
		# There are two things about this HTML to keep in mind:
		#
		# 	1. This blog, not dissimilar to those hosted by one
		# 		 of the blogging services (WP for example), assumes
		# 		 the main content of a post is written with certain
		# 		 tags that the style sheets will know how to act on.
		# 		 (so this HTML is in that context)
		# 
		# 	2. This is only being done for illustrative purposes
		# 		 to teach and allow for a playground for others
		# 		 without actually impacting the function of this site.

		post.html_content = "" <<
				"<section>" << 
					"<header>" <<
						"This is a style guide and a playground.  Also, this is what a sub-header looks like" <<
					"</header>" <<
					"<section>" <<
						"This is a paragraph of content.  The value of this particular content is questionable.  " <<
						"In it you'll simply learn that I like Firefly (and really, you should too).  If you're " <<
						"somehow unaware, Firefly was an amazing show that starred Nathan Fillion (also on Castle), " <<
						"Gina Torres (I think her and Nathan both did voices on the Destiny video game), Alan Tudyk " <<
						"(A Knight's Tale is a favorite of mine, also Dodgeball is funny [I'm wearing a Purple Cobras " <<
						"shirt right now], and Tucker and Dale vs. Evil), and Morena Baccarin (who just showed up on " <<
						"Gotham! [also V and Homeland]).  There's others too, but this is plenty of text, so let's " <<
						"look at some indented text, a quote from Captain Mal:" <<
					"</section>" <<
					"<ul>" << 
						"<li>" <<
							"`Next time you want to stab me in the back, have the guts to do it to my face.`" <<
						"</li>" << 
					"</ul>" << 
					"<section>" << 
						"Shiny.  This is another nested section, like the paragraph above, but now let's look " <<
						"at what it looks like to have another section container (and while we're at it let's " <<
						"look at what happens when a footer tag is supplied)." <<
					"</section>" << 
					"<footer></footer>" <<
				"</section>" << 
				"<section>" <<
					"<header>" << 
						"Here we are at sub-header number two" <<
					"</header>" << 
					"<section>" <<
						"We're not required to have a sub-header.  You could go comment out the lines right " <<
						"above this in the post.rb file to see what that might look like.  For now though, let's " <<
						"see what bullet points look like (and why not use some titles of Firefly episodes?):" <<
					"</section>" << 
					"<ul>" << 
						"<li class='bullet'>" <<
							"Serenity" <<
						"</li>" << 
						"<li class='bullet'>" <<
							"The Train Job" <<
						"</li>" << 
						"<li class='bullet'>" <<
							"Bushwhacked" <<
						"</li>" << 
						"<li class='bullet'>" <<
							"Shindig" <<
						"</li>" << 
					"</ul>" << 
					"<section>" <<
						"Foo Bar was the fooiest bar of all.  One day, when no other bar where foo'ing Foo " <<
						"stood as still as a doubt, and listened, listened to the silence.  Why did the others " <<
						"stop foo'ing?  Foo Bar ran to see the others, but alas, the silence now made sense, " <<
						"for they were all now f.u.b.a.r. too."
					"</section>" << 
				"</section>"


		post
	end


end
