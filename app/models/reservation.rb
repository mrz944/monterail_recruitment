class Reservation < ApplicationRecord
  has_many :ticket_reservations
  STATUSES = {
    new: 0,
    paid: 1
  }.freeze

  has_many :ticket_types, through: :ticket_reservations

  validates :status, presence: true

  STATUSES.keys.each do |status|
    define_method "#{status}?" do
      status == STATUSES[status]
    end
  end
end
