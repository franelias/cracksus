class Game < ApplicationRecord
  validates :name, presence: true
  validates :status, presence: true
  validates :anti_tamper, presence: true
  validates :image_url, presence: true
  validates :store_url, presence: true
  validates :cracked_by, presence: false
  validates :release_date, presence: false
  validates :crack_date, presence: false
end 