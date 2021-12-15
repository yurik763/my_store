class ItemsController < ApplicationController
	
	before_action :authenticate_user!, :only => [:show, :edit, :update, :create, :destroy, :upvote, :downvote]
	before_action :find_item, only: [:show, :edit, :update, :destroy, :upvote, :downvote] #выполняется перед action
	#before_action :check_if_admin, only: [:edit, :new, :update, :create, :destroy]
	
	def index
		@items = Item.all
	end

	def expensive
		@items = Item.where("price > 1000")
		render "index"
	end

	#/items/1 GET
	def show
		unless @item
			render text: "Page not found", status: 404
		end
	end

	#/items/new  GET
	def new
		@item = Item.new
	end

	#/items/1/edit  GET
	def edit
	end

	#/items  POST
	def create
		@item = Item.create(item_params)
		if @item.errors.empty?
			redirect_to item_path(@item)
		else
			render 'new'
		end
	end

	#/items/1 PUT
	def update
		@item.update(item_params)
		if @item.errors.empty?
			redirect_to item_path(@item)
		else
			redirect_to 'edit'
		end
	end

	#/items/1  DELETE
	def destroy
		@item.destroy
		redirect_to action: "index"
	end

   def upvote
      unless signed_in?
         redirect_to new_user_session_path
      else
         @item.liked_by current_user
         redirect_to @item
      end
   end

   def downvote
      unless signed_in?
         redirect_to new_user_session_path
      else
         @item.downvote_from current_user
         redirect_to @item
      end
   end

  private

  	def find_item
  		@item = Item.where(id: params[:id]).first
  		render_404 unless @item
   	end

  	#def check_if_admin
  		#render_403 unless params[:admin]
  	#end

	def item_params
      params.require(:item).permit(:price, :name, :description, :weight, :id)
    end

end
