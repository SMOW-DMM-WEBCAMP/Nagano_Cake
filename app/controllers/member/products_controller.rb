class Member::ProductsController < ApplicationController

  def top
    @products = Product.all.limit(4).order('created_at DESC')
  end

  def about
  end

  def index
  end

  def show
  end

end