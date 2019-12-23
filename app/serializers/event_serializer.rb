class EventSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :date

  attribute :ticket_types do |object|
    TicketTypeSerializer.new(object.ticket_types).as_json['data']
  end
end
