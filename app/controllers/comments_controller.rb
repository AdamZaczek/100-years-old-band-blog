class CommentsController < ApplicationController
	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.new(params[:comment].permit(:body))
		@comment.save!

		respond_to do |format|
			format.html { redirect_to @post }
			format.js
		end
	end

	def destroy
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
		@comment.destroy

		redirect_to @post
	end
end
