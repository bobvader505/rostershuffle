class ChangeBirthdayToDate < ActiveRecord::Migration[5.0]
  def change
  	change_column :players, :birthday, :date
  end
end
