class PurchasesController < ApplicationController
  def index
  end

  def show
  end
 
  def new
    @purchase = Purchese.new
  end
  
   def create
    @purchase = Purchase.build(params.requite(:purchase).permit(:item, :email))
    
  end

  def edit
  end
end
