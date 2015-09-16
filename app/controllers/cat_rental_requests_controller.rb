class CatRentalRequestsController < ApplicationController
  def new
    @all_cats = Cat.all
    @cat_rental = CatRentalRequest.new
    render :new
  end

  def create
    @cat_rental = CatRentalRequest.new(cat_rental_params)
    if @cat_rental.save
      flash[:notice] = "Reservation sucessful."
      redirect_to cats_url
    else
      render json: @cat_rental.errors.full_messages, status: :unprocessable_entity
    end
  end

  def approve
    rental_id = params[:id]
    @cat_rental = CatRentalRequest.find(rental_id)
    if @cat_rental.approve!
      flash[:notice] = "Reservation approved!"
    else
      flash[:errors] = "Something went wrong"
    end
    redirect_to cat_url(@cat_rental.cat)
  end

  def deny
    rental_id = params[:id]
    @cat_rental = CatRentalRequest.find(rental_id)
    if @cat_rental.deny!
      flash[:notice] = "Reservation denied :("
    else
      flash[:errors] = "Something went wrong"
    end
    redirect_to cat_url(@cat_rental.cat)
  end

  private
  def cat_rental_params
    params.require(:cat_rental_request).permit(:id, :cat_id, :start_date, :end_date)
  end
end
