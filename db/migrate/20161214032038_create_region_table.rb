class CreateRegionTable < ActiveRecord::Migration[5.0]
  def change
    create_table :region do |t|
   	  t.string :name
      t.string :slug
    end
    add_reference :teams, :region, foreign_key: true
  end
end
