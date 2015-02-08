class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :name
      t.string :url
      t.string :short_description
      t.string :link_type

      t.timestamps null: false
    end

    add_reference :links, :post, index: true
  end
end
