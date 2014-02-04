# Controls comments applied to posts and projects
class CommentsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  before_filter :load_commentable

  def index
    @comments = @commentable.comments
  end

  def new
    @comment = @commentable.comments.new
  end

  def create
    @comment = @commentable.comments.new(params[:comment])
    @comment.author = current_user
    @comment.approved = false
    if @comment.save
      current_user.comments << @comment
      flash[:notice] = 'Comment was successfully created'
      redirect_to [@commentable]
    else
      render :new
    end
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(params[:comment])
      flash[:notice] = 'Comment has been approved'
      redirect_to @commentable
    else
      flash[:alert] = 'Comment was not approved'
      render @commentable
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    authorize @comment
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to @commentable }
      format.json { head :no_content }
    end
  end

  private

  def load_commentable
    resource, id = request.path.split('/')[1, 2]
    @commentable = resource.singularize.classify.constantize.find(id)
  end
end
