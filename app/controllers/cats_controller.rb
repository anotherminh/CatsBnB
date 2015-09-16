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
    @cat = Cat.create(cat_params)
    if @cat
      render :show
    else
      render json: @cat.errors.full_messages, status: :unprocessable_entity
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
    else
      render text: "Cat not found"
    end
  end

  def update
    @cat = Cat.find(params[:id])
    if @cat.update(cat_params)
      render :show
    else
      render json: @cat.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @cat = Cat.find(params[:id])
    if @cat.destroy
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
