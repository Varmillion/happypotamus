class CommentsController < ApplicationController
	before_action :find_pin
	before_action :find_comment, only: [:destroy, :edit, :update, :omment_owner]
	before_action :comment_owner, only: [:destroy, :edit, :update]

	def create
		@comment = @pin.comments.create(params[:comment].permit(:content))
		@comment.user_id = current_user.id
		@comment.save

		if @comment.save
			redirect_to pin_path(@pin)
		else
			render 'new'
		end
	end

	def destroy
		@comment.destroy
		redirect_to pin_path(@pin)
	end

	def edit
	
	end

	def update
		if @comment.update(params[:comment].permit(:content))
			redirect_to pin_path(@pin)
		else
			render 'edit'
		end
	end

	private

	def find_pin
		@pin = Pin.find(params[:pin_id])
	end

	def find_comment
		@comment =@pin.comments.find(params[:id])
	end

	def comment_owner
		unless current_user.id == @comment.user_id
			flash[:notice] = "You are not allowed here!"
			redirect_to @pin
		end
	end

end
