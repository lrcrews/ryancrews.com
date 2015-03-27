class CreateShirts < ActiveRecord::Migration
  def change
    create_table :shirts do |t|
    	t.string :name, null: false
    	t.string :link, null: false
    	t.string :image_link, null: false
			t.timestamps null: false
    end
    
    add_belongs_to :shirts, :post
  end
end
