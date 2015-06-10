class MainCategoriesController < ApplicationController
  def index
    @mcategories = MainCategory.all
    
  end

  def show
    @mcategory = MainCategory.find(params[:id])
  end

  def new
    @mcategory = MainCategory.new
  end
  
     def create
       @mcategory = MainCategory.new(params.require(:main_category).permit(:title, :body))
       if @mcategory.save
         flash[:notice] = "Category was saved."
         redirect_to root_path
     else
         flash[:error] = "There was an error saving the Category. Please try again."
       render :new
     end
   end


  def edit
    @mcategory = MainCategory.find(params[:id])
    
  end
  
     def update
       @mcategory = MainCategory.find(params[:id])
       if @mcategory.update_attributes(params.require(:main_category).permit(:title, :body))
         flash[:notice] = "Category was updated."
       redirect_to root_path
     else
         flash[:error] = "There was an error saving the category. Please try again."
       render :edit
     end
   end
  
  
     def destroy
       @mcategory = MainCategory.find(params[:id])
       name = @mcategory.title
 
   
       if @mcategory.destroy
       flash[:notice] = "\"#{name}\" was deleted successfully."
       redirect_to root_path
     else
         flash[:error] = "There was an error deleting the category."
       render :show
     end
   end


  
end
