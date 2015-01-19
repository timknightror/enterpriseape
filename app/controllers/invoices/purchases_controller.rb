class Invoices::PurchasesController < ApplicationController
respond_to :html, :xml, :json

  def index
    @purchases = Purchase.all
    respond_with(@purchases)
  end

  def show
    respond_with(@purchase)
  end

  def new
    @invoice = Invoice.find(params[:invoice_id])
    @purchase = Purchase.new
  end

  def edit
  end

  def create
    @invoice = Invoice.find(params[:invoice_id])
    @purchase = Purchase.new(purchase_params)
    @purchase.invoice = @invoice
    @purchase.save
    respond_with(@invoice)
  end

  def update
    @purchase.update(purchase_params)
    respond_with(@purchase)
  end

  def destroy
    @invoice = Invoice.find(params[:invoice_id])
    @purchase = Purchase.find(params[:id])
    title = @purchase.name
    
    if @purchase.destroy 
      flash[:notice] = "#{title} was deleted successfully."
      redirect_to @invoice
    else 
      flash[:error] = "There was an error deleting this purchase"
      render :show
    end
    
  end

  private
    def set_purchase
      @purchase = Purchase.find(params[:id])
    end

    def purchase_params
      params.require(:purchase).permit(:name, :category, :quantity, :invoice_id, :price)
    end
end
