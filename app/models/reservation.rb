class Reservation < ApplicationRecord
  has_many :ticket_reservations
  has_many :ticket_types, through: :ticket_reservations

  validates :status, presence: true
end
