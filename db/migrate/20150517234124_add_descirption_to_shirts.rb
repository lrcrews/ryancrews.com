class AddDescirptionToShirts < ActiveRecord::Migration
  def change
  	add_column :shirts, :description, :string
  end
end
