class TicketType < ApplicationRecord
  belongs_to :event

  validates :places, presence: true
  validates :selling_options, presence: true
end
