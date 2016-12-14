class AddActiveToRegion < ActiveRecord::Migration[5.0]
  def change
  	 add_column :regions, :active, :boolean
  end
end
