class CompleteRolesTransition < ActiveRecord::Migration[5.0]
  def change
  	add_reference :transactions, :role, foreign_key: true
  end
end
