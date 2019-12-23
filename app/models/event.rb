class Event < ApplicationRecord
  validates :date, presence: true
  validates :name, presence: true
end
