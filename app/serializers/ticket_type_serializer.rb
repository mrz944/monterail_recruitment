class TicketTypeSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :places

  attribute :available_for_sale, &:available_for_sale

  attribute :available_places, &:available_places
end
