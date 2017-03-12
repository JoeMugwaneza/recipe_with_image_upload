class ProductsController < ApplicationController

  def index
    @products = Product.all
    
  end

  def new
    
  end

  def create
    response = Unirest.post("http://uploads.im/api?upload", parameters: {file: params[:image]}).body
    product = Product.new(name: params[:name],
      description: params[:description],
      image_url: response["data"]["img_url"]
      )


    product.save

    redirect_to "/products"
  end
end
