class CatsController < ApplicationController
  def index
    @cats = Cat.all
    render :index
  end

  def show
    @cat = Cat.find(params[:id])
    render :show
  end

  def create
    @cat = Cat.new(cat_params)
    if @cat.save
      flash.now[:notice] = "Cat sucessfully created!"
      render :show
    else
      flash[:errors] = @cat.errors.full_messages
      redirect_to new_cat_url
    end
  end

  def new
    @cat = Cat.new
    render :new
  end

  def edit
    @cat = Cat.find(params[:id])
    if @cat
      render :edit
    end
  end

  def update
    @cat = Cat.find(params[:id])
    if @cat.update(cat_params)
      flash[:notice] = "Cat sucessfully updated!"
      render :show
    else
      flash[:errors] = @cat.errors.full_messages
      render :edit
    end
  end

  def destroy
    @cat = Cat.find(params[:id])
    if @cat.destroy
      flash[:notice] = "Deleted #{@cat.name}"
      redirect_to cats_url
    else
      render json: @cat.errors.full_messages, status: :unprocessable_entity
    end
  end

  private
  def cat_params
    params.require(:cat).permit(:birth_date, :color, :name, :sex, :description)
  end
end
