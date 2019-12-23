FactoryBot.define do
  factory :event do
    name { 'Event one' }
    date { Time.now + 1.year }
  end

  factory :ticket_type do
    name { 'standing' }
    places { 100 }
    price { 33.0 }
    selling_options { [TicketType::SELLING_OPTIONS[:even]] }
  end

  factory :ticket_reservation do
    places { 10 }
  end

  factory :reservation
end
