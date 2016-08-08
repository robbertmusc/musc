class Training < ApplicationRecord
  belongs_to :user
  has_many :photos
  has_many :reservations

  geocoded_by :tr_location
  after_validation :geocode, if:  :tr_location_changed?

  validates :tr_type, presence: true
  validates :tr_intensity, presence: true
  validates :tr_name, presence: true
  validates :tr_description, presence: true
  validates :tr_location, presence: true
  validates :tr_time, presence: true
  validates :tr_max_attendants, presence: true
  validates :tr_price, presence: true
  validates :tr_duration, presence: true
  validates :tr_gender, presence: true






end
