class Reservation < ApplicationRecord
  validates :status, presence: true
end
