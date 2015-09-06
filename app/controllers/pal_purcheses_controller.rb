class PalPurchesesController < ApplicationController
  def index
    
    current_user.purchases.create( user_id: current_user.id, 
                                  Item_id: params.to_a[0][1], 
                                  Item_name: params.to_a[2][1], 
                                  email: current_user.email   )
        
        # current_user.purchases.create( user_id: params[return_values][:user_id] )
       #current_user.update_attributes!(role: 'premium') # old example
  
        
       #redirect_to sub_category_item_path(@item.sub_category_id, @item.id) 
        
    redirect_to sub_category_item_path(params.to_a[1][1],params.to_a[0][1])
    
  end

  def show
  end

  def new
    #@mcategory= MainCategory.find(params[:main_category_id])
    @item =  Item.find(params[:item_id])
    @user = User.new
  end
  
  
       def create
      # @mcategory= MainCategory.find(params[:main_category_id])
       #@scategory = @mcategory.sub_categories.build(params.require(:sub_category).permit(:title, :body, :avatar))
      # render "https://www.google.com"
      # @mcategory = MainCategory.new(params.require(:main_category).permit(:title, :body))
     
         
        
       @item = Item.find(params[:item_id])
         @user = User.new(name:params[:user][:name], email:params[:user][:email], password:params[:user][:password])
       #@user = User.new(name: "migs", email:"migs@migs.com", password:"11223344")
       @user.skip_confirmation!
       @user.confirm!
       @user.save!
       sign_in @user, :bypass => true
       #if @mcategory.save
       if @user.save 
         @retun_values={
                      
                       item_id: @item.id,
                       item_name: @item.name,
                       user_id: current_user.id,
                       email: current_user.email,
                       item_sub_category:@item.sub_category_id
                       }
            values = {
                      business: "migs432-facilitator@yahoo.com ",
                      cmd: "_xclick",
                      upload: 1,
                     #return: "http://ruby-on-rails-117942.nitrousapp.com/#{@Item}",
                     #return: "#{request.base_url}/sub_categories/#{@item.sub_category_id}/items/#{@item.id}#{+ @return_values.to_query}",
                     #return: "#{request.base_url}/sub_categories/#{@item.sub_category_id}/items/#{@item.id}?item_id=#{@retun_values[:item_id]}&sub_category=#{@retun_values[:item_sub_category]}",                                                                                  
                     # invoice: id,
                    return: "#{request.base_url}/pal_purcheses?item_id=#{@retun_values[:item_id]}&sub_category=#{@retun_values[:item_sub_category]}&item_name=#{@retun_values[:item_name]}",   
                     amount: @item.price,
                     item_name: @item.name,
                     item_number: @item.id,
                      quantity: '1'
                      #notify_url: "#{Rails.application.secrets.app_host}/hook"
    }
         # For test transactions use this URL
	#"https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query

         #flash[:notice] = "Category was saved."
         #redirect_to root_path
         redirect_to "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
       #open("https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query).read
     else
         flash[:error] = "There was an error saving the Category. Please try again."
      # render :new
     end
       
       
 
        
        
        
        
        
       
     
   end
  def creatBuy
    
  end

  def edit
  end
end
