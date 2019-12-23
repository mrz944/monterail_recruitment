class TicketReservation < ApplicationRecord
  include ActiveModel::Validations

  belongs_to :ticket_type
  belongs_to :reservation

  validates_with ReservationPlacesValidator
end
