class ReservationSerializer
  include FastJsonapi::ObjectSerializer
  attributes :amount

  attribute :status do |object|
    Reservation::STATUSES.key(object.status)
  end

  attribute :ticket_reservation do |object|
    TicketReservationSerializer.new(object.ticket_reservations).as_json['data']
  end
end
