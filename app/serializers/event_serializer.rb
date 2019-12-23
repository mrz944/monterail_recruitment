class EventSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :date

  attribute :ticket_types do |object|
    object.ticket_types.map(&:name)
  end
end
