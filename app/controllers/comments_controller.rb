class CommentsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params[:comment])
    @comment.author = current_user
    @comment.approved = false
    @comment.save
    current_user.comments << @comment
    flash[:notice] = "Comment was successfully created"
    redirect_to post_path(@post)
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(params[:comment])
      flash[:notice] = "Comment has been approved"
      redirect_to @comment.post
    else
      flash[:alert] = "Comment was not approved"
      @post = @comment.post
      render template: "posts/show"
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @post = @comment.post
    authorize @comment
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to @post }
      format.json { head :no_content }
    end
  end

end
