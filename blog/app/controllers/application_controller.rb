class ApplicationController < ActionController::Base
  
  before_filter :create_site_js_gon_variables

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def create_site_js_gon_variables
  	gon.footer_categories = Category.all.as_json
  	gon.site_stuff_link = category_path( Category.named("site stuff") )
  end

end
