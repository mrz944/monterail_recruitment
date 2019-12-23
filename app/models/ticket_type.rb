class TicketType < ApplicationRecord
  SELLING_OPTIONS = {
    even: 0,
    all_together: 1,
    avoid_one: 2
  }.freeze

  belongs_to :event
  has_many :ticket_reservations
  has_many :reservations, through: :ticket_reservations

  validates :name, presence: true
  validates :places, presence: true
  validates :selling_options, presence: true

  SELLING_OPTIONS.keys.each do |selling_option|
    define_method "#{selling_option}?" do
      selling_options.include? SELLING_OPTIONS[selling_option]
    end
  end

  def available_for_sale
    available_places > 0
  end

  def available_places
    places - ticket_reservations.sum(:places)
  end
end
