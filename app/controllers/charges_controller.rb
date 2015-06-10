class ChargesController < ApplicationController
  
 def new
   @stripe_btn_data = {
     key: "#{Rails.configuration.stripe[:publishable_key]}",
     description: "new description",
     #amount: Amount.default
     amount: 15_00
     }
 end

   def create
    # @scategory = SubCategory.find(params[:id])
     @item = Item.find(params[:item_id])
     # Creates a Stripe Customer object, for associating
     # with the charge
     customer = Stripe::Customer.create(
       email: current_user ? current_user.email : "guest",
       card: params[:stripeToken]
     )
 
       #  Where the real magic happens
       charge = Stripe::Charge.create(
         customer: customer.id, # Note -- this is NOT the user_id in your app
         #amount: Amount.default,
         amount: 15_00,
         description: "thank you",
         currency: 'usd'
       )
 
     if flash[:notice] = "Thanks for your purchase"
       current_user.purchases.create( user_id: current_user.id, Item_id: @item.id, Item_name: @item.name, email: current_user.email   )
       #current_user.update_attributes!(role: 'premium') # old example
       redirect_to sub_category_item_path(@item.sub_category_id, @item.id) 
        #redirect_to root_path   # or wherever
       
      end
       # Stripe will send back CardErrors, with friendly messages
       # when something goes wrong.
       # This `rescue block` catches and displays those errors.
       rescue Stripe::CardError => e
         flash[:error] = e.message
          redirect_to sub_category_item_path(@item.sub_category_id, @item.id)
       end
  
end

#current_user.update_attributes!(role: 'premium') &&  