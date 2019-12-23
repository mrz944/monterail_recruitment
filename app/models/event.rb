class Event < ApplicationRecord
  has_many :ticket_types

  validates :date, presence: true
  validates :name, presence: true
end
