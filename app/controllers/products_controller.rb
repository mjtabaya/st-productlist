class ProductsController < ApplicationController
  before_action :set_brand, except: [:index]
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @brand = Brand.includes(:products).find(params[:brand_id])
    @products = @brand.products
  end

  def show
  end

  def new
    @product = @brand.products.new
  end

  def edit
  end

  def create
    @product = @brand.products.new(product_params)

    if @product.save
      # redirect_to brand_product_path(@brand, @product), notice: 'Product was successfully created.'
      redirect_to [@brand, @product], notice: 'Product was successfully created.'
    else
      render :new
    end
  end

  def update
    if @product.update(product_params)
      redirect_to [@brand, @product], notice: 'Product was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    # redirect_to brand_products_path(@brand), notice: 'Product was successfully destroyed.'
    redirect_to [@brand, :products], notice: 'Product was successfully destroyed.'
  end

  private
    def set_brand
      @brand = Brand.find(params[:brand_id])
    end

    def set_product
      @product = @brand.products.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:brand_id, :name, :price)
    end
end
