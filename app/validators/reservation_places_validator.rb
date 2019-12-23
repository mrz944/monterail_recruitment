class ReservationPlacesValidator < ActiveModel::Validator
  def validate(record)
    if record.places > record.ticket_type.available_places
      record.reservation.errors[:base] << "Places value can't be greater than available places of ticket type!"
    elsif record.ticket_type.even? && !record.places.even?
      record.reservation.errors[:base] << "Places value must be even!"
    elsif record.ticket_type.all_together? && record.places != record.ticket_type.places
      record.reservation.errors[:base] << "Places value must be equal to places of this ticket type!"
    elsif record.ticket_type.avoid_one? && record.ticket_type.available_places - record.places > 1
      record.reservation.errors[:base] << "Can't leave only 1 available place for this ticket type!"
    end
  end
end
