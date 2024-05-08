class CarsController < ApplicationController
  before_action :set_car, only: [:show, :edit, :update]
  skip_before_action :authenticate_user!, only: [:index, :show]

  # GET /cars
  def index
    @cars = Car.all
  end

  # GET /cars/1
  def show
  end

  def edit
  end

  def update
    if @car.update(car_params)
      redirect_to @car, notice: 'Car was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # GET /cars/new
  def new
    @car = Car.new
  end

  # POST /cars
  def create
    @car = Car.new(car_params)
    @car.user = current_user
    if @car.save
      redirect_to @car, notice: 'Car was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

    def set_car
      @car = Car.find(params[:id])
    end

    def car_params
      params.require(:car).permit(:make, :model, :year, :img_url, :user_id)
    end
end
