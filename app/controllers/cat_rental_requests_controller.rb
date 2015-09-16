class CatRentalRequestsController < ApplicationController
  def show
    @cat_rental = CatRentalRequest.find(params[:id])

    render :show
  end

  def new
    @all_cats = Cat.all
    @cat_rental = CatRentalRequest.new
    render :new
  end

  def create
    @cat_rental = CatRentalRequest.create(cat_rental_params)
    if @cat_rental
      render :show
    else
      render json: @cat_rental.errors.full_messages, status: :unprocessable_entity
    end
  end

  private
  def cat_rental_params
    params.require(:cat_rental_request).permit(:cat_id, :start_date, :end_date)
  end
end
