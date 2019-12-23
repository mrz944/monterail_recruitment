# README

## Getting started

1. Build docker container:

        $ docker-compose build

2. Run migrations:

        $ docker-compose run web rails db:create db:setup

3. Start up the server:

        $ docker-compose up

## Usage examples

1. Get info about an event and its tickets

        $ curl -H "Accept: application/json" -H "Content-type: application/json" $(docker-machine ip):3000/events/1

2. Reserve ticket:

        $ curl -H "Accept: application/json" -H "Content-type: application/json" -X POST -d '{"reservation": {"event_id": "1", "ticket_type_id": "1", "places": "10"}}' $(docker-machine ip):3000/reservations

3. Pay for ticket:

        $ curl -H "Accept: application/json" -H "Content-type: application/json" -X POST -d '{"payment": {"reservation_id": "1", "token":"success"}}' $(docker-machine ip):3000/reservations/payment_gateway

4. Get info about reservation:

        $ curl -H "Accept: application/json" -H "Content-type: application/json" $(docker-machine ip):3000/reservations/1
