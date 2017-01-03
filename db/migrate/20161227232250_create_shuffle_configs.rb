class CreateShuffleConfigs < ActiveRecord::Migration[5.0]
  def change
    create_table :shuffle_configs do |t|
      t.string :game
      t.string :region 
      t.timestamps
    end
  end
end
