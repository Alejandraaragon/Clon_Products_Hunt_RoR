class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  
  def index
    current_page = params[:page] || current_page = 1
     @products = Product.where(visible:true).order('id DESC').paginate(page:current_page, per_page:6)
  end
  def new
    @product = Product.new
  end
  def create
    @product = Product.create product_params
    if @product.persisted?
      redirect_to product_path(@product), notice: "Producto creado con exito"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @product.update product_params
      redirect_to product_path(@product), notice: "El producto se actualizó de manera exitosa"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path, status: :see_other, notice: "El producto se elimino de forma exitosa"
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :visible, :image)
  end

  
end
