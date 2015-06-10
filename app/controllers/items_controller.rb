require 'open-uri'

class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @purchase = Purchase.new
    respond_to do |format|
      format.html
      format.pdf { 
        #data = open @item.avatar.url, "r"
        #send_data data, type: "application/pdf", disposition: "attachment", :filename => @item.avatar.file.filename }
        
        #data = open @item.product.url, "r"
        #send_data data, type: "application/pdf", disposition: "attachment", :filename => @item.product.file.filename, x_sendfile: true }
      
      
        open(@item.product.url, 'rb') do |f|
          send_data f.read.force_encoding('BINARY'), filename: @item.product.file.filename, type: 'application/pdf', disposition: 'attachment'
        end
      }
    end

  end

  def new
    @scategory = SubCategory.find(params[:sub_category_id])
    @item = Item.new
  end
  
     def create
     
       @scategory= SubCategory.find(params[:sub_category_id])
       @item = @scategory.items.build(params.require(:item).permit(:name, :body, :avatar, :product, :price ))
      
       if @item.save
         #@item.update_attribute!(user_id: current_user.id)
         Item.where(id: @item.id).update_all(user_id: current_user.id)
         flash[:notice] = "Item was saved. "
         redirect_to  new_item_item_pic_path(@item.id)
        # redirect_to sub_category_path(@scategory)
       
     else
         flash[:error] = "There was an error saving the Item. Please try again."
       render :new
     end
   end
  

  def edit
    
    #@mcategory = MainCategory.find(params[:main_category_id])
    @scategory = SubCategory.find(params[:sub_category_id])
    @item = Item.find(params[:id])
    @item_pic = ItemPic.new
  end
  
    def update
       # @mcategory= MainCategory.find(params[:main_category_id])
      @scategory = SubCategory.find(params[:sub_category_id])
      @item = Item.find(params[:id])
      if @item.update_attributes(params.require(:item).permit(:name, :body, :avatar, :price, :product))
        flash[:notice] = "Item was updated."
        redirect_to sub_category_item_path(@scategory, @item)
     else
        flash[:error] = "There was an error saving the item. Please try again."
        # render :edit
        redirect_to edit_sub_category_item_path(@scategory, @item)
     end
   end
  
    def destroy
          # @mcategory= MainCategory.find(params[:main_category_id])
           @scategory = SubCategory.find(params[:sub_category_id])
           @item = Item.find(params[:id])
           name = @item.name
 
   
           if @item.destroy
       flash[:notice] = "\"#{name}\" was deleted successfully."
       #redirect_to root_path
       redirect_to sub_category_path(@scategory)
     else
             flash[:error] = "There was an error deleting the Item."
       render :show
     end
   end
  
  
end
