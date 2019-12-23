class TicketType < ApplicationRecord
  belongs_to :event
  has_many :ticket_reservations
  has_many :reservations, through: :ticket_reservations

  validates :name, presence: true
  validates :places, presence: true
  validates :selling_options, presence: true
end
