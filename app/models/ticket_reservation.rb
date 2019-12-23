class TicketReservation < ApplicationRecord
  belongs_to :ticket_type
  belongs_to :reservation

  validates :places, presence: true
end
