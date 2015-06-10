class ItemPicsController < ApplicationController
  def index
  end

  def show
  end

  def new
     @item= Item.find(params[:item_id])
     @item_pic = @item.item_pics.new
  end
  
       def create
         @item= Item.find(params[:item_id])
         @item_pic = @item.item_pics.new(params.require(:item_pic).permit(:avatar, :item_id))
         if @item_pic.save
           flash[:notice] = "Picture was saved to Item."
           #redirect_to sub_category_item_path(@item.sub_category_id, @item.id)
           redirect_to edit_sub_category_item_path(@item.sub_category_id, @item.id)
     else
           flash[:error] = "There was an error saving the Picture. Please try again."
       render :new
     end
   end

  def edit
    @item = Item.find(params[:item_id])
    @item_pic = @item.item_pics.find(params[:id])
  end
  
  
  
      def update
               # @mcategory= MainCategory.find(params[:main_category_id])
              @item = Item.find(params[:item_id])
              @item_pic = @item.item_pics.find(params[:id])
          if @item_pic.update_attributes(params.require(:item_pic).permit(:avatar))
            flash[:notice] = "Item Pic was updated."
            redirect_to edit_sub_category_item_path(@item.sub_category_id, @item.id)
         else
              flash[:error] = "There was an error saving the item. Please try again."
             render :edit
         end
   end
  
    def destroy
          # @mcategory= MainCategory.find(params[:main_category_id])
           @item = Item.find(params[:item_id])
           @item_pic = @item.item_pics.find(params[:id])
           #@scategory = SubCategory.find(params[:sub_category_id])
           #@item = Item.find(params[:id])
          # name = @item.name
 
   
           if @item_pic.destroy
             #flash[:notice] = "\"#{name}\" was deleted successfully."
             flash[:notice] = "Picture was deleted successfully."
             #redirect_to root_path
            redirect_to edit_sub_category_item_path(@item.sub_category_id, @item.id)
           else
             flash[:error] = "There was an error deleting the Item."
             render :show
           end
   end
  
  
end
