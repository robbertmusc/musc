class Training < ActiveRecord::Base

# was ApplicationRecord

  belongs_to :user
  has_many :photos
  has_many :reservations
  has_many :reviews
  has_many :thrills
  has_many :users, through: :thrills

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

  def average_rating
    reviews.count == 0 ? 0 : reviews.average(:star).round(2)
  end
end
