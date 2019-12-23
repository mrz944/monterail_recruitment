class ReservationWorker
  include Sidekiq::Worker

  def perform(reservation_id)
    reservation = Reservation.find(reservation_id)
    reservation.destroy unless reservation.paid?
  end
end
