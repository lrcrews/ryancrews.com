class UnasociatePostFromShirt < ActiveRecord::Migration
  def change
  	remove_column :shirts, :post_id, :integer
  end
end
