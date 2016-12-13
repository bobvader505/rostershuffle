class UpdateTransactions < ActiveRecord::Migration[5.0]
  def up
  	roles = {"Top" => 1, "Jungle" => 2, "Mid" => 3, "Bot" => 4, "Support" => 5, "Sub" => 6, "Coach" => 7}
  	print roles
  	Transaction.all.each do |transact|
  		print "test"
  		transact.update_attribute :role, roles[transact.role]
  		transact.save!
  	end
  end
end
