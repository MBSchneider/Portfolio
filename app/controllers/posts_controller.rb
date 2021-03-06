# Controls Blog Posts
class PostsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  after_filter :verify_authorized, except: [:index, :show]

  def index
    @posts = Post.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])
    @commentable = @post
    @comments = policy_scope(@commentable.comments)
    @comment = Comment.new
    authorize @post
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new
    authorize @post
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
    authorize @post
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(params[:post])
    authorize @post
    respond_to do |format|
      if @post.save
        current_user.posts << @post
        format.html do
          redirect_to @post,
                      notice: 'Post was successfully created.'
        end
        format.json do
          render json: @post,
                 status: :created,
                 location: @post
        end
      else
        format.html { render action: 'new' }
        format.json do
          render json: @post.errors,
                 status: :unprocessable_entity
        end
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])
    authorize @post
    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html do
          redirect_to @post,
                      notice: 'Post was successfully updated.'
        end
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json do
          render json: @post.errors,
                 status: :unprocessable_entity
        end
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    authorize @post
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end
end
