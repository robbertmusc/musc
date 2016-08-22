class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :thrill
  has_one :training, through: :thrill
end
