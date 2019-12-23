class TicketReservationSerializer
  include FastJsonapi::ObjectSerializer
  attributes :places

  attribute :ticket_type do |object|
    object.ticket_type.name
  end
end
