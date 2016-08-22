class Thrill < ApplicationRecord
  belongs_to :training
  has_many :reservations
  has_many :users, through: :reservations

  validates :thrilldate, presence: false
  validates :thrillhr, presence: true
  validates :thrillmin, presence: false
  
end
