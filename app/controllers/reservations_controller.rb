class ReservationsController < ApplicationController
  before_action :set_reservation, only: :show

  # GET /reservations/1
  def show
    render json: ReservationSerializer.new(@reservation)
  end

  # POST /reservations
  def create
    event = Event.find(reservation_params[:event_id])
    ticket_type = TicketType.where(event: event)
                            .find(reservation_params[:ticket_type_id])

    @reservation = Reservation.new
    @reservation.ticket_reservations.build(
      places: reservation_params[:places], ticket_type: ticket_type
    )

    if @reservation.save
      render json: @reservation, status: :created, location: @reservation
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  # POST /reservations/payment_gateway
  def payment_gateway
    reservation = Reservation.find(payment_params[:reservation_id])

    Payment::Gateway.charge(amount: reservation.amount, token: payment_params[:token])
    reservation.make_paid

    render plain: 'OK', status: :ok
  rescue Payment::Gateway::CardError, Payment::Gateway::PaymentError
    render plain: 'ERROR', status: :unprocessable_entity
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def reservation_params
      params.require(:reservation).permit(:event_id, :ticket_type_id, :places)
    end

    def payment_params
      params.require(:payment).permit(:reservation_id, :token)
    end
end
