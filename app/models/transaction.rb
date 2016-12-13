class Transaction < ApplicationRecord
  belongs_to :player
  belongs_to :team
  belongs_to :transtype
  belongs_to :role
end
