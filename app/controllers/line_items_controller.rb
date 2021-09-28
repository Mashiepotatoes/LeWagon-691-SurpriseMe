class LineItemsController < ApplicationController
  def create
    chosen_product = Product.find(params["product_id"])
    current_cart = @current_cart

    if current_cart.products.include?(chosen_product)
      @line_item = current_cart.line_items.find_by(product: chosen_product)
      @line_item.quantity += 1
    else
      @line_item = LineItem.new
      @line_item.cart = current_cart
      @line_item.product = chosen_product
    end

    # @line_item.amount = @line_item.quantity * chosen_product.price
    @line_item.save
    raise

    # How do we check that the line item was saved?
    # what is the total line_item count now?
    line_item_total = @line_item.quantity
    # render json: { totalLineItems: line_item_total }
    render json: { totalLineItems: line_item_total}
  end

  def reduce
    chosen_product = Product.find(params[:id])
    current_cart = @current_cart

    if current_cart.products.include?(chosen_product)
      @line_item = current_cart.line_items.find_by(product: chosen_product)
      if @line_item.quantity > 0
          @line_item.quantity = @line_item.quantity - 1
          # @line_item.amount = @line_item.quantity * chosen_product.price
          @line_item.save
      end
      if @line_item.quantity == 0
        @line_item.destroy
      end
    end
    line_item_total = @line_item.quantity
    render json: { totalLineItems: line_item_total}


  end

  def destroy
    @line_item = LineItem.find(params[:id])
    @line_item.destroy
    redirect_to cart_path(@current_cart)
  end

end
