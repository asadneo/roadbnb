class BookingsController < ApplicationController
  before_action :authenticate_user!, :set_car, only: [:new, :create, :show]

  def index
    @user = current_user
    @bookings = @user.bookings
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.car = @car
    if @booking.save
      redirect_to car_path(@car)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def booking_params
    params.require(:booking).permit(:date)
  end

  def set_car
    @car = Car.find(params[:car_id])
  end
end
