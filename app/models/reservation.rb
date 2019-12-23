class Reservation < ApplicationRecord
  STATUSES = {
    new: 0,
    paid: 1
  }.freeze

  has_many :ticket_reservations, dependent: :destroy
  has_many :ticket_types, through: :ticket_reservations

  validates :status, presence: true

  after_save :clear_unpaid

  STATUSES.keys.each do |s|
    define_method "#{s}?" do
      status == STATUSES[s]
    end
  end

  def amount
    ticket_types.sum(:price)
  end

  def clear_unpaid
    ReservationWorker.perform_at(15.minutes.from_now, id)
  end

  def make_paid
    update_attribute(:status, STATUSES[:paid])
  end
end
