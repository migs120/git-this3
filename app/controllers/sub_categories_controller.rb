class SubCategoriesController < ApplicationController
  def index
    @scategories = SubCategory.all
  end

  def show
      @scategory = SubCategory.find(params[:id])
  end

  def new
    @mcategory= MainCategory.find(params[:main_category_id])
    @scategory = SubCategory.new
  end
  
    
     def create
       #@scategorymid =Subcategory.find(params[:main_category_id])
       @mcategory= MainCategory.find(params[:main_category_id])
       @scategory = @mcategory.sub_categories.build(params.require(:sub_category).permit(:title, :body, :avatar))
      # @scategory.main_category_id = @mcategory.id
       if @scategory.save
         flash[:notice] = "Category was saved."
       
        redirect_to edit_main_category_path(@mcategory.id)
       
     else
         flash[:error] = "There was an error saving the Category. Please try again."
       render :new
     end
     end

  def edit
    @mcategory= MainCategory.find(params[:main_category_id])
    @scategory = SubCategory.find(params[:id])
  end
  
    
     def update
        @mcategory= MainCategory.find(params[:main_category_id])
       @scategory = SubCategory.find(params[:id])
       if @scategory.update_attributes(params.require(:sub_category).permit(:title, :body, :avatar))
         flash[:notice] = "Category was updated."
       redirect_to edit_main_category_path(@mcategory.id)
     else
         flash[:error] = "There was an error saving the category. Please try again."
       render :edit
     end
     end
  
       def destroy
       @mcategory= MainCategory.find(params[:main_category_id])
       @scategory = SubCategory.find(params[:id])
       name = @scategory.title
 
   
       if @scategory.destroy
       flash[:notice] = "\"#{name}\" was deleted successfully."
       #redirect_to root_path
       redirect_to edit_main_category_path(@mcategory.id)
     else
         flash[:error] = "There was an error deleting the category."
       render :show
     end
       end
  
  
end
