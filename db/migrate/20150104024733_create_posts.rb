class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :html_content

      t.timestamps null: false
    end

    # Foreign keys
    add_belongs_to :posts, :category
  end
end
